<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\Category;
use Inamika\BackEndBundle\Form\Category\CategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;

class CategoriesController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:Categories:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_categories_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}

	public function addAction(){
		return $this->render('InamikaBackOfficeBundle:Categories:form.html.twig',array('entity'=>new Category()));
    }	
    
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:Categories:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Category::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:Categories:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:Categories:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Category::class)->find($id)));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_categories_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_categories_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:Categories:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(CategoryType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}
