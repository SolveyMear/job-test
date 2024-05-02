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

/* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */
// gestion des réponses d'erreur du serveur en json :
use Symfony\Component\HttpFoundation\JsonResponse;
/* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */

#[Route('/job')]
class JobController extends AbstractController
{

    /* Ajouts Cyril pour que la requête www.monsite/job/id renvoie un job en Json */


    #[Route('/{id}', name: 'app_job_json', methods: ['GET'])]
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
                "location" => $job->getLocation(),
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

    /* Fin ajouts Cyril pour job id en en Json */

    // Suppression de toutes les routes qui suivent car on ne passera par aucune pour modifier les jobs : tout se fera avec easyadmin !


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
}
