<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\ServiceCategory;
use Inamika\BackEndBundle\Form\ServiceCategory\ServiceCategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;

class ServiceCategoriesController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:ServiceCategories:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_service_categories_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:ServiceCategories:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(ServiceCategory::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:ServiceCategories:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:ServiceCategories:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(ServiceCategory::class)->find($id)));
    }

    public function importAction(){
		return $this->render('InamikaBackOfficeBundle:ServiceCategories:import.html.twig',array(
			'form' => $this->createForm(ImportType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_service_categories_import')
            ))->createView()
        ));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_service_categories_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_service_categories_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:ServiceCategories:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(ServiceCategoryType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}
