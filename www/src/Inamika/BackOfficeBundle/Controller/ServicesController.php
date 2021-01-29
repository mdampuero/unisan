<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\Service;
use Inamika\BackEndBundle\Form\Service\ServiceType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;

class ServicesController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:Services:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_services_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}

	public function addAction(){
		return $this->render('InamikaBackOfficeBundle:Services:form.html.twig',array('entity'=>new Service()));
    }	
    
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:Services:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Service::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:Services:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:Services:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Service::class)->find($id)));
    }

    public function importAction(){
		return $this->render('InamikaBackOfficeBundle:Services:import.html.twig',array(
			'form' => $this->createForm(ImportType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_services_import')
            ))->createView()
        ));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_services_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_services_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:Services:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(ServiceType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}