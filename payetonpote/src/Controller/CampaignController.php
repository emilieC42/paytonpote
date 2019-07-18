<?php

namespace App\Controller;

use App\Entity\Campaign;
use App\Form\CampaignType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Participant;
use App\Entity\Payment;

/**
 * @Route("/campaign")
 */
class CampaignController extends AbstractController
{
    /**
     * @Route("/new", name="campaign_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $campaign = new Campaign();
        $form = $this->createForm(CampaignType::class, $campaign);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $campaign->setId('Id'); //il faut définir l'id de la campagne !
            $em->persist($campaign);
            $em->flush();

            return $this->redirectToRoute('campaign_show', ['id' => $campaign->getId()]);
        }

        return $this->render('campaign/new.html.twig', [
            'campaign' => $campaign,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="campaign_show", methods={"GET"})
     */
    public function show(Campaign $campaign): Response
    {
        // Get all participants
        $participant_rep = $this->getDoctrine()->getRepository(Participant::class);
        $participants = $participant_rep->findBy([
            'campaign' => $campaign->getId(),
        ]);

        // Get participant count
        $participants_count = count($participants);

        // Get payment data for each participation
        $payment_rep = $this->getDoctrine()->getRepository((Payment::class));
        $payments = [];

        foreach ($participants as $participant) {
            $participantId = $participant->getId();
            $payments[$participantId] = $payment_rep->findOneBy([
                'participant' => $participantId,
            ]);
        }

        // Get payment sum

        $paymentSum = 0;

        foreach ($payments as $payment) {
            $paymentSum += $payment->getAmount();
        }

        // Get goal percentage
        $percentage = (int) (round(($paymentSum / $campaign->getGoal()) * 100));

        return $this->render('campaign/show.html.twig', [
            'campaign' => $campaign,
            'participants' => $participants,
            'participants_count' => $participants_count,
            'payments' => $payments,
            'payment_sum' => $paymentSum,
            'percentage' => $percentage,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="campaign_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Campaign $campaign): Response
    {
        $form = $this->createForm(CampaignType::class, $campaign);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('campaign_index', [
                'id' => $campaign->getId(),
            ]);
        }

        return $this->render('campaign/edit.html.twig', [
            'campaign' => $campaign,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="campaign_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Campaign $campaign): Response
    {
        if ($this->isCsrfTokenValid('delete'.$campaign->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($campaign);
            $entityManager->flush();
        }

        return $this->redirectToRoute('campaign_index');
    }
}
