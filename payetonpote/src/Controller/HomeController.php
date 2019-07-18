<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Campaign;
use App\Entity\Participant;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index()
    {
        // Get all campaigns 5 dernieres campaign
        $campaign_rep = $this->getDoctrine()->getRepository(Campaign::class);
        $campaigns = $campaign_rep->findBy([], null, 5);

        // recup nombre de participant de chaque campaign
        $participant_rep = $this->getDoctrine()->getRepository(Participant::class);
        $participants = [];

        foreach ($campaigns as $campaign) {
            $participants[$campaign->getId()] = $participant_rep->findBy(['campaign' => $campaign->getId()]);
        }

        // Get participant count
        $participants_count = count($participants);

        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'campaigns' => $campaigns,
            'participants' => $participants,
        ]);
    }
}
