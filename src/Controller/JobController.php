<?php

namespace App\Controller;

use App\Entity\Job;
use App\Form\JobType;
use App\Repository\JobRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Intl\Countries;


/* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */
// gestion des réponses d'erreur du serveur en json :
use Symfony\Component\HttpFoundation\JsonResponse;
/* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */

/* #[Route('/job')] */

class JobController extends AbstractController
{

    /* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */


    #[Route('/job/{id}', name: 'app_job_json', methods: ['GET'])]
    public function jsonJob(Job $job = null): Response
    {

        if (!$job) {
            $responseData = [
                'message' => 'Ressource non trouvée.'
            ];

            // Créer une réponse JSON avec le code HTTP 404 :
            $response = new JsonResponse($responseData, JsonResponse::HTTP_NOT_FOUND);

            return $response;
        } else {

            $jobObject = [

                "apply" => $job->getApply(),
                "contract" => $job->isContract() ? "Full Time" : "Part Time",
                "description" => $job->getDescription(),
                "id" => $job->getId(),
                "location" => Countries::getName($job->getLocation()),
                "position" => $job->getPosition(),
                "postedAt" => ($job->getCreatedAt()->getTimestamp()) * 1000, //Le timestamp original de l'API devjobs est un timestamp Unix en secondes, tandis que le second timestamp "1708728585000" est en millisecondes, on multiplie donc par 1000.
                "role" => [
                    "content" => $job->getRoleContent(),
                    "items" => $job->getRoles(),
                ],
                "requirements" => [
                    "content" => $job->getRequirementContent(),
                    "items" => $job->getRequirements(),
                ],
                // Encore à implémenter (soit du relationnel, soit pas encore fait car upload d'images à gérer) :
                "company" => $job->getUser()->getCompanyName(),
                "logo" => $job->getUser()->getLogoUrl(),
                "logoBackground" => $job->getUser()->getLogoBackground(),
                "website" => $job->getUser()->getWebsite(),
            ];

            $jobResponse = json_encode($jobObject);

            $response = new Response($jobResponse);

            $response->headers->set('Content-Type', 'application/json');

            return $response;
        }
    }



    #[Route('/jobs', name: 'app_jobs_json', methods: ['GET'])]
    public function jsonJobs(JobRepository $jobs = null, Request $request): Response
    {

        //$offset = $request->query->get('offset');
        //$offset !== null ? $offset : 0;
        $offset = $request->query->get('offset') ? $request->query->get('offset') : 0;

        $jobsRepoResponse = $jobs->findBy(
            array(), // Aucun critère de recherche supplémentaire, nous voulons tous les résultats
            array('createdAt' => 'DESC'), // Trier par la colonne 'date' de manière décroissante
            12, // Nombre maximum de résultats à récupérer
            $offset // Décalage (offset)
        );

        $jobsData = array();

        foreach ($jobsRepoResponse as $job) {

            $jobObject = [
                "company" => $job->getUser()->getCompanyName(),
                "contract" => $job->isContract() ? "Full Time" : "Part Time",
                "id" => $job->getId(),
                "location" => Countries::getName($job->getLocation()),
                "logo" => $job->getUser()->getLogoUrl(),
                "logoBackground" => $job->getUser()->getLogoBackground(),
                "position" => $job->getPosition(),
                "postedAt" => ($job->getCreatedAt()->getTimestamp()) * 1000
            ];

            array_push($jobsData, $jobObject);
        };

        $responseData = [
            "jobs" => $jobsData,
            "total" => $jobs->count()
        ];


        $jobResponse = json_encode($responseData);

        $response = new Response($jobResponse);

        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }


    #[Route('/jobs/search', name: 'app_jobs_search_json', methods: ['GET'])]
    public function jsonJobsSerach(JobRepository $jobs = null, Request $request): Response
    {

        $text = $request->query->get('text') ? '%' . $request->query->get('text') . '%' : null;
        $location = $request->query->get('location') ? $request->query->get('location') : null;
        $fulltime = $request->query->get('fulltime') ? 1 : null;

        $offset = $request->query->get('offset') ? $request->query->get('offset') : 0;

        // Construction de la requête en fonction des filtres
        $queryBuilder = $jobs->createQueryBuilder('job');
        $queryBuilder->leftJoin('job.user', 'user'); // Jointure entre la table 'job' et 'user'
        if ($text) {
            $queryBuilder->andWhere(
                $queryBuilder->expr()->orX(
                    $queryBuilder->expr()->like('job.description', ':text'),
                    $queryBuilder->expr()->like('job.position', ':text'),
                    $queryBuilder->expr()->like('user.CompanyName', ':text')
                )
            )->setParameter('text', $text);
        }
        if ($location) {
            $queryBuilder->andWhere('job.location = :location')
                ->setParameter('location', $location);
        }
        if ($fulltime) {
            $queryBuilder->andWhere('job.contract = :fulltime')
                ->setParameter('fulltime', $fulltime);
        }

        // Comptage du total des résultats en base
        $jobsRepoResponseLength = count(
            $queryBuilder
                ->setFirstResult(0)
                ->getQuery()
                ->getResult()
        );

        // Exécution de la requête avec les filtres
        $jobsRepoResponse = $queryBuilder
            ->orderBy('job.createdAt', 'DESC')
            ->setMaxResults(12)
            ->setFirstResult($offset)
            ->getQuery()
            ->getResult();



        $jobsData = array();

        foreach ($jobsRepoResponse as $job) {

            $jobObject = [
                "company" => $job->getUser()->getCompanyName(),
                "contract" => $job->isContract() ? "Full Time" : "Part Time",
                "id" => $job->getId(),
                "location" => Countries::getName($job->getLocation()),
                "logo" => $job->getUser()->getLogoUrl(),
                "logoBackground" => $job->getUser()->getLogoBackground(),
                "position" => $job->getPosition(),
                "postedAt" => ($job->getCreatedAt()->getTimestamp()) * 1000
            ];

            array_push($jobsData, $jobObject);
        };

        $responseData = [
            "jobs" => $jobsData,
            "total" => $jobsRepoResponseLength
        ];


        $jobResponse = json_encode($responseData);

        $response = new Response($jobResponse);

        $response->headers->set('Content-Type', 'application/json');

        return $response;
    }
}
    
    /* Fin ajouts Cyril pour job id en en Json */
    
    // Suppression de toutes les routes qui suivent car on ne passera par aucune pour modifier les jobs : tout se fera avec easyadmin !





// Mémo de mes expérimentations :

/*         $text = $request->query->get('text') ? '%' . $request->query->get('text') . '%' : null;
        $location = $request->query->get('location') ? $request->query->get('location') : null;
        $fulltime = $request->query->get('fulltime') ? 1 : null;

        $filters = array();

        $text ? $filters['position'] = $text : null;
        $location ? $filters['location'] = $location : null;
        $fulltime ? $filters['contract'] = 1 : null;

        $offset = $request->query->get('offset') ? $request->query->get('offset') : 0;


        $jobsRepoResponse = $jobs->findBy( */
            /*
            array(                
                'description' => $text,
                'location' => $location,
                'contract' => $fulltime
                 ),
            */
  /*           $filters,
            array('createdAt' => 'DESC'), // Trier par la colonne 'date' de manière décroissante
            12, // Nombre maximum de résultats à récupérer
            $offset // Décalage (offset)
        ); */











    /*     
    #[Route('/', name: 'app_job_index', methods: ['GET'])]
    public function index(JobRepository $jobRepository): Response
    {
        return $this->render('job/index.html.twig', [
            'jobs' => $jobRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_job_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $job = new Job();
        $form = $this->createForm(JobType::class, $job);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($job);
            $entityManager->flush();

            return $this->redirectToRoute('app_job_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('job/new.html.twig', [
            'job' => $job,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_job_show', methods: ['GET'])]
    public function show(Job $job): Response
    {
        return $this->render('job/show.html.twig', [
            'job' => $job,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_job_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Job $job, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(JobType::class, $job);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_job_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('job/edit.html.twig', [
            'job' => $job,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_job_delete', methods: ['POST'])]
    public function delete(Request $request, Job $job, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $job->getId(), $request->getPayload()->get('_token'))) {
            $entityManager->remove($job);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_job_index', [], Response::HTTP_SEE_OTHER);
    }

 */
