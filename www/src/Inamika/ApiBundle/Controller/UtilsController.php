<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\Customer;
use Inamika\BackEndBundle\Form\Utils\CertificateType;

class UtilsController extends BaseController
{   
    public function retiroAction(Request $request){
        $content=json_decode($request->getContent(), true);
        if(!$customer=$this->getDoctrine()->getRepository(Customer::class)->find($content["customerId"]))
            return $this->handleView($this->view("Cliente no encontrado", Response::BAD_REQUEST));
        //SEND EMAIL
        $settings = $this->container->get('setting');
        $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - Solicitud de Retiro '))
        ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
        ->setTo($this->get('setting')->getData()->getEmailRetirements())
        ->setBody($this->renderView('InamikaBackEndBundle:Emails:Utils/retirements.html.twig', array('customer' => $customer,'content'=>$content)),'text/html');
        $this->get('mailer')->send($message);

        return $this->handleView($this->view($customer, Response::HTTP_OK));
    }
    
    public function visitsAction(Request $request){
        $content=json_decode($request->getContent(), true);
        if(!$customer=$this->getDoctrine()->getRepository(Customer::class)->find($content["customerId"]))
            return $this->handleView($this->view("Cliente no encontrado", Response::BAD_REQUEST));
        //SEND EMAIL
        $settings = $this->container->get('setting');
        $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - Solicitud de Reporte de visitas'))
        ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
        ->setTo($this->get('setting')->getData()->getEmailVisits())
        ->setBody($this->renderView('InamikaBackEndBundle:Emails:Utils/visits.html.twig', array('customer' => $customer,'content'=>$content)),'text/html');
        $this->get('mailer')->send($message);

        return $this->handleView($this->view($customer, Response::HTTP_OK));
    }

    public function certificateAction(Request $request){
        $form = $this->createForm(CertificateType::class, null);
        $content=json_decode($request->getContent(), true);
        if(!$customer=$this->getDoctrine()->getRepository(Customer::class)->find($content["customerId"]))
            return $this->handleView($this->view("Cliente no encontrado", Response::BAD_REQUEST));
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            //SEND EMAIL
            $settings = $this->container->get('setting');
            $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - Certificado Disposición final'))
            ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
            ->setTo($this->get('setting')->getData()->getEmailCertificate())
            ->setBody($this->renderView('InamikaBackEndBundle:Emails:Utils/certificate.html.twig', array('customer' => $customer,'content'=>$content)),'text/html');
            $this->get('mailer')->send($message);

            return $this->handleView($this->view([], Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
    
}