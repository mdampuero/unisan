<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use FOS\RestBundle\Controller\FOSRestController;
use Inamika\BackEndBundle\Entity\Service;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGenerator;
use Symfony\Component\Config\Definition\Exception\Exception;

class CotizationsController extends FOSRestController
{

    public function requestAction(Request $request){
        try{
            $content=json_decode($request->getContent(), true);
            if (!$entity = $this->getDoctrine()->getRepository(Service::class)->find($content["serviceId"]))
                return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));

            //SEND EMAIL
            $settings = $this->container->get('setting');
            $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - Solicitud de cotización '))
            ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
            ->setTo($this->getParameter('mailer_from'))
            ->setBody($this->renderView('InamikaBackOfficeBundle:Emails:Cotizations/request.html.twig', array('entity' => $entity,'content'=>$content)),'text/html')
            ;
            $this->get('mailer')->send($message);
            return $this->handleView($this->view($content, Response::HTTP_OK));
        }catch (Exception $excepcion) {
            return $this->handleView($this->view($this->structureError($excepcion->getMessage()), Response::HTTP_BAD_REQUEST));
        }
    }

}
