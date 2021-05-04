<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\Popup;
use Inamika\BackEndBundle\Entity\Note;
use Inamika\BackEndBundle\Form\Popup\PopupType;

class PopupsController extends BaseController
{   
    public function indexAction(Request $request){
        
        $query=(!isset($search['value']))?'':$search['value'];
        $offset = $request->query->get('start', 0);
        $limit = $request->query->get('length', 30);
        $sort = $request->query->get('sort', null);
        $direction = $request->query->get('direction', null);
        return $this->handleView($this->view(array(
            'data' => $this->getDoctrine()->getRepository(Popup::class)->search($query, $limit, $offset, $sort, $direction)->getQuery()->getResult(),
            'recordsTotal' => $this->getDoctrine()->getRepository(Popup::class)->total(),
            'recordsFiltered' => $this->getDoctrine()->getRepository(Popup::class)->searchTotal($query, $limit, $offset),
            'offset' => $offset,
            'limit' => $limit,
        )));
    }
    
    public function getAction($id){
        if(!$entity=$this->getDoctrine()->getRepository(Popup::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));           
        return $this->handleView($this->view($entity));
    }
    
    public function activeAction(){
        return $this->handleView($this->view($this->getDoctrine()->getRepository(Popup::class)->findBy(array('isDelete'=>false,'isActive'=>true)), Response::HTTP_OK));
    }

    public function postAction(Request $request){
        $entity = new Popup();
        $form = $this->createForm(PopupType::class, $entity);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            if(!$this->isAvailableActived($entity))
                return $this->handleView($this->view($this->get('ErrorStructure')->get(array('code'=>400,'property'=>'isActive','message'=>'Ya existe otro Pop-up activo en para la seccion "'.$entity->getSection()->getName().'"')), Response::HTTP_BAD_REQUEST));
            if(key_exists('notes',$content)){
                foreach($content['notes'] as $n){
                    if(!$note=$this->getDoctrine()->getRepository(Note::class)->find($n["id"]))
                        $note= new Note();
                    $note->setPopup($entity);
                    $note->setName($n["name"]);
                    $note->setPicture($n["picture"]);
                    $note->setDescription($n["description"]);
                    $note->setIsDelete(($n["isDelete"])?1:0);
                    $em->persist($note);
                }
            }            
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
    
    public function importAction(Request $request){
        $form = $this->createForm(ImportType::class, null);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $path='uploads/or/';
            $file=$this->get('Base64Service')->convertToFile($content["file"]["base64"],$path);
            try {
                $this->getDoctrine()->getRepository(Popup::class)->import($path.$file);
                return $this->handleView($this->view("", Response::HTTP_OK));
            } catch (\Throwable $th) {
                return $this->handleView($this->view($th->getMessage(), Response::HTTP_BAD_REQUEST));
            }
            
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
    
    public function putAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Popup::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createForm(PopupType::class, $entity);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            if(!$this->isAvailableActived($entity))
                return $this->handleView($this->view($this->get('ErrorStructure')->get(array('code'=>400,'property'=>'isActive','message'=>'Ya existe otro Pop-up activo en para la seccion "'.$entity->getSection()->getName().'"')), Response::HTTP_BAD_REQUEST));
            
            if(key_exists('notes',$content)){
                foreach($content['notes'] as $n){
                    if(!$note=$this->getDoctrine()->getRepository(Note::class)->find($n["id"]))
                        $note= new Note();
                    $note->setPopup($entity);
                    $note->setName($n["name"]);
                    $note->setPicture($n["picture"]);
                    $note->setDescription($n["description"]);
                    $note->setIsDelete(($n["isDelete"])?1:0);
                    $em->persist($note);
                }
            }
            
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

    public function deleteAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Popup::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createFormBuilder(null, array('csrf_protection' => false))->setMethod('DELETE')->getForm();
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()){
            $entity->setIsDelete(true);
            $this->getDoctrine()->getManager()->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

    private function isAvailableActived($entity){
        return ($this->getDoctrine()->getRepository(Popup::class)->getActiveBySection($entity) && $entity->getIsActive()==true)?false:true;
    }
}