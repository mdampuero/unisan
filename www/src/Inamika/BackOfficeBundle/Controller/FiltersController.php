<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\Filter;
use Inamika\BackEndBundle\Form\Filter\FilterType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;

class FiltersController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:Filters:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_filters_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}

	public function addAction(){
		return $this->render('InamikaBackOfficeBundle:Filters:form.html.twig',array('entity'=>new Filter()));
    }	
    
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:Filters:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Filter::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:Filters:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:Filters:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Filter::class)->find($id)));
    }

    public function importAction(){
		return $this->render('InamikaBackOfficeBundle:Filters:import.html.twig',array(
			'form' => $this->createForm(ImportType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_filters_import')
            ))->createView()
        ));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_filters_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_filters_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:Filters:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(FilterType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}
