<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\Model;
use Inamika\BackEndBundle\Entity\Currency;
use Inamika\BackEndBundle\Form\Model\ModelType;

class ModelsController extends BaseController
{   
    public function indexAction(Request $request){
        $search = $request->query->get('search', array());
        $query=(!isset($search['value']))?'':$search['value'];
        $offset = $request->query->get('start', 0);
        $limit = $request->query->get('length', 30);
        $sort = $request->query->get('sort', null);
        $direction = $request->query->get('direction', null);
        return $this->handleView($this->view(array(
            'data' => $this->getDoctrine()->getRepository(Model::class)->search($query, $limit, $offset, $sort, $direction)->getQuery()->getResult(),
            'recordsTotal' => $this->getDoctrine()->getRepository(Model::class)->total(),
            'recordsFiltered' => $this->getDoctrine()->getRepository(Model::class)->searchTotal($query, $limit, $offset),
            'offset' => $offset,
            'limit' => $limit,
        )));
    }
    
    public function byGroupAction(Request $request){
        $results=$this->getDoctrine()->getRepository(Model::class)->getAll()->getQuery()->getResult();
        $data=[
            'forHome'=>[],
            'forIndustry'=>[],
            'forEvent'=>[]
        ];
        foreach($results as $key=>$result){
            if($result->getForHome()){
                if(!$this->ifExist($data['forHome'],$result->getService()->getId()))
                    $data['forHome'][]=$result->getService();
            }
            if($result->getForIndustry()){
                if(!$this->ifExist($data['forIndustry'],$result->getService()->getId()))
                    $data['forIndustry'][]=$result->getService();
            }
            if($result->getForEvent()){
                if(!$this->ifExist($data['forEvent'],$result->getService()->getId()))
                    $data['forEvent'][]=$result->getService();
            }
        }        
        return $this->handleView($this->view($data));
    }
    
    public function byCategoryAction(Request $request,$category){
        $qb=$this->getDoctrine()->getRepository(Model::class)->getAll();   
        $qb->andWhere('e.'.$category.'=:value')->setParameter('value',true)->orderBy("service.name","ASC");;
        return $this->handleView($this->view($qb->getQuery()->getResult()));
    }


    protected function ifExist($array,$key){
        foreach($array as $index=>$value){
            if($value->getId()==$key)
                return true;
        }
        return false;
    }
    
    public function getAction($id){
        if(!$entity=$this->getDoctrine()->getRepository(Model::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        return $this->handleView($this->view($entity));
    }

    public function postAction(Request $request){
        $entity = new Model();
        $form = $this->createForm(ModelType::class, $entity);
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            /** Picture */
            if($form->get('pictureBase64')->getData())
                $entity->setPicture($this->base64ToFile($form->get('pictureBase64')->getData(),"uploads/"));
            /** Model 3d */
            // if($form->get('model3dBase64')->getData())
            //     $entity->setModel3d($this->base64ToFile3d($form->get('model3dBase64')->getData()));
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
            $file=$this->get('Base64Model')->convertToFile($content["file"]["base64"],$path);
            try {
                $this->getDoctrine()->getRepository(Model::class)->import($path.$file);
                return $this->handleView($this->view("", Response::HTTP_OK));
            } catch (\Throwable $th) {
                return $this->handleView($this->view($th->getMessage(), Response::HTTP_BAD_REQUEST));
            }
            
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
    
    public function putAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Model::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createForm(ModelType::class, $entity);
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
        if(!$entity=$this->getDoctrine()->getRepository(Model::class)->find($id))
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
    
    public function deleteFileAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Model::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createFormBuilder(null, array('csrf_protection' => false))->setMethod('DELETE')->getForm();
        $form->submit(json_decode($request->getContent(), true));
        if ($form->isSubmitted() && $form->isValid()){
            $entity->setModel3d(null);
            $this->getDoctrine()->getManager()->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

}