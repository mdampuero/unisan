<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\Cotization;
use Inamika\BackEndBundle\Form\Cotization\CotizationType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;

class CotizationsController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:Cotizations:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_cotizations_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}

	public function addAction(){
		return $this->render('InamikaBackOfficeBundle:Cotizations:form.html.twig',array('entity'=>new Cotization()));
    }	
    
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:Cotizations:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Cotization::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:Cotizations:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:Cotizations:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Cotization::class)->find($id)));
    }

    public function importAction(){
		return $this->render('InamikaBackOfficeBundle:Cotizations:import.html.twig',array(
			'form' => $this->createForm(ImportType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_cotizations_import')
            ))->createView()
        ));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_cotizations_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_cotizations_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:Cotizations:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(CotizationType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}
