<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Inamika\BackEndBundle\Entity\Model;
use Inamika\BackEndBundle\Form\Model\ModelType;
use Inamika\BackEndBundle\Form\Model\FilmType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpClient\HttpClient;
use Symfony\Component\Routing\Generator\UrlGenerator;
use Symfony\Component\HttpFoundation\Request;

class ModelsController extends BaseController{

	public function indexAction(){
		return $this->render('InamikaBackOfficeBundle:Models:index.html.twig',array(
            'formDelete'=>$this->createFormBuilder()
            ->setAction($this->generateUrl('api_models_delete', array('id' => ':ENTITY_ID')))
            ->setMethod('DELETE')
            ->getForm()->createView(),
        ));
	}

	public function addAction(){
		return $this->render('InamikaBackOfficeBundle:Models:form.html.twig',array('entity'=>new Model()));
    }	
    
    public function editAction($id){
        return $this->render('InamikaBackOfficeBundle:Models:form.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Model::class)->find($id)));
    }
    
    public function landingAction($id){
        return $this->render('InamikaBackOfficeBundle:Models:landing.html.twig',array('id'=>$id));
    }

    public function getAction($id){
        return $this->render('InamikaBackOfficeBundle:Models:_partials/get.html.twig',array('entity'=>$this->getDoctrine()->getRepository(Model::class)->find($id)));
    }

    public function importAction(){
		return $this->render('InamikaBackOfficeBundle:Models:import.html.twig',array(
			'form' => $this->createForm(ImportType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_models_import')
            ))->createView()
        ));
    }
    
    public function fileAction(Request $request,$id){
        $entity=$this->getDoctrine()->getRepository(Model::class)->find($id);
        $form=$this->createForm(FilmType::class, $entity,array('method' => 'POST','action'=>$this->generateUrl('inamika_backoffice_models_file_post',array('id'=>$entity->getId()))));
        $form->handleRequest($request);
		return $this->render('InamikaBackOfficeBundle:Models:file.html.twig',array(
			'form' =>$form->createView(),
			'entity' =>$entity
        ));
    }

    public function filePostAction(Request $request,$id){
        $entity=$this->getDoctrine()->getRepository(Model::class)->find($id);
        $form=$this->createForm(FilmType::class, $entity,array('method' => 'POST'));
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            if($_FILES["model3d"]["error"]!=4){
                $fileName = md5(uniqid()).'.glb';
                move_uploaded_file($_FILES["model3d"]["tmp_name"],"uploads/models3d/".$fileName);
                $em=$this->getDoctrine()->getManager();
                $entity->setModel3d($fileName);
                $em->persist($entity);
                $em->flush();
                $this->addFlash("success", 'El archivo se subió correctamente');
            }else{
                $this->addFlash("danger", 'Error al subir el archivo');
            }            
        }
		return $this->redirectToRoute('inamika_backoffice_models_file',array('id'=>$entity->getId()));
    }
    
	public function form($entity){
        $method='POST';
        $action=$this->generateUrl('api_models_post');
        if($entity->getId()){
            $method='PUT';
            $action=$this->generateUrl('api_models_put',array('id'=>$entity->getId()));
        }
		return $this->render('InamikaBackOfficeBundle:Models:_partials/form.html.twig',array(
            'entity'=>$entity,
			'form' => $this->createForm(ModelType::class, $entity,array(
                'method' => $method,
                'action' => $action
            ))->createView()
        ));
    }
}
