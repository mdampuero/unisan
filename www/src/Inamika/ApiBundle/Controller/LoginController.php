<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Config\Definition\Exception\Exception;
use FOS\RestBundle\Controller\FOSRestController;

use Inamika\BackEndBundle\Entity\Customer;
use Inamika\BackEndBundle\Form\Login\LoginType;


class LoginController extends FOSRestController
{   
    public function postAction(Request $request){
        $form = $this->createForm(LoginType::class);
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()) {
            if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
                'email'=>$form->get('username')->getData(),
                'isValidate'=>true,
                'password'=>substr(md5($form->get('password')->getData()), 0, 16)
            )))
                return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
            $dataCustomer=[
                'customer'=>$entity,
                'cart'=>[],
            ];
            $this->get('session')->set('_security_main', $dataCustomer);
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

    public function forgotPasswordAction(Request $request){
        $content=json_decode($request->getContent(), true);
        if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
            'email'=>$content['email'],
            'isDelete'=>false
            )))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
       
        $entity->setCodeActive(md5(md5(uniqid().uniqid())));
        $em = $this->getDoctrine()->getManager();
        $em->persist($entity);
        $em->flush();
        $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - '.$this->get('translator')->trans('RECOVERY_PASSWORD')))
        ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
        ->setTo($entity->getEmail())
        ->setBody($this->renderView('InamikaBackOfficeBundle:Emails:LoginFE/forgotPassword.html.twig', array('entity' => $entity,'resetUrl'=>$content['resetUrl'])),'text/html');
        $this->get('mailer')->send($message); 
        return $this->handleView($this->view($entity, Response::HTTP_OK));
    }
    
    public function resetPasswordAction(Request $request){
        $content=json_decode($request->getContent(), true);
        if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
            'id'=>$content['id'],
            'codeActive'=>$content['code']
            )))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $entity->setPassword(substr(md5($content["password"]), 0, 16));
        $entity->setCodeActive(md5(md5(uniqid().uniqid())));
        $entity->setIsValidate(true);
        $em = $this->getDoctrine()->getManager();
        $em->persist($entity);
        $em->flush();
        $message = (new \Swift_Message($this->get('setting')->getData()->getTitle().' - '.$this->get('translator')->trans('BLANK_PASSWORD_SUCCESS')))
        ->setFrom(array($this->getParameter('mailer_from')=>$this->get('setting')->getData()->getTitle()))
        ->setTo($entity->getEmail())
        ->setBody($this->renderView('InamikaBackOfficeBundle:Emails:LoginFE/resetPassword.html.twig', array('entity' => $entity)),'text/html');
        $this->get('mailer')->send($message); 
        return $this->handleView($this->view($entity, Response::HTTP_OK));
    }
    
    public function checkCodeAction(Request $request){
        $content=json_decode($request->getContent(), true);
        if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
            'id'=>$content['id'],
            'codeActive'=>$content['code']
            )))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        return $this->handleView($this->view($entity, Response::HTTP_OK)); 
    }

    
}


