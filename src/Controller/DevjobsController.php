<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/')]
class DevjobsController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */

    public function index(): Response
    {
        // Redirige vers le dossier devjobs dans le dossier public
        return $this->redirect('devjobs/');
    }
}
