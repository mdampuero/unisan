<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\Service;
use Inamika\BackEndBundle\Entity\Currency;
use Inamika\BackEndBundle\Form\Service\ServiceType;

class ServicesController extends BaseController
{   
    public function indexAction(Request $request){
        $search = $request->query->get('search', array());
        $query=(!isset($search['value']))?'':$search['value'];
        $offset = $request->query->get('start', 0);
        $limit = $request->query->get('length', 30);
        $sort = $request->query->get('sort', null);
        $direction = $request->query->get('direction', null);
        return $this->handleView($this->view(array(
            'data' => $this->getDoctrine()->getRepository(Service::class)->search($query, $limit, $offset, $sort, $direction)->getQuery()->getResult(),
            'recordsTotal' => $this->getDoctrine()->getRepository(Service::class)->total(),
            'recordsFiltered' => $this->getDoctrine()->getRepository(Service::class)->searchTotal($query, $limit, $offset),
            'offset' => $offset,
            'limit' => $limit,
        )));
    }
    
    public function getAction($id){
        if(!$entity=$this->getDoctrine()->getRepository(Service::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        return $this->handleView($this->view($entity));
    }

    public function postAction(Request $request){
        $entity = new Service();
        $form = $this->createForm(ServiceType::class, $entity);
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            /** Picture */
            if($form->get('pictureBase64')->getData())
                $entity->setPicture($this->base64ToFile($form->get('pictureBase64')->getData(),"uploads/"));
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
                $this->getDoctrine()->getRepository(Service::class)->import($path.$file);
                return $this->handleView($this->view("", Response::HTTP_OK));
            } catch (\Throwable $th) {
                return $this->handleView($this->view($th->getMessage(), Response::HTTP_BAD_REQUEST));
            }
            
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
    
    public function putAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Service::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createForm(ServiceType::class, $entity);
        $fileOld=$entity->getPicture();
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            /** Picture */
            if($form->get('pictureBase64')->getData())
                $fileOld=$this->base64ToFile($form->get('pictureBase64')->getData());
            else if($form->get('pictureRemove')->getData()) $fileOld=null;
            $entity->setPicture($fileOld);
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

    public function deleteAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Service::class)->find($id))
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

}