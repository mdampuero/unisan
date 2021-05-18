<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\Filter;
use Inamika\BackEndBundle\Form\Filter\FilterType;

class FiltersController extends BaseController
{   
    public function indexAction(Request $request){
        $search = $request->query->get('search', array());
        $query=(!isset($search['value']))?'':$search['value'];
        $offset = $request->query->get('start', 0);
        $limit = $request->query->get('length', 30);
        $sort = $request->query->get('sort', null);
        $direction = $request->query->get('direction', null);
        return $this->handleView($this->view(array(
            'data' => $this->getDoctrine()->getRepository(Filter::class)->search($query, $limit, $offset, $sort, $direction)->getQuery()->getResult(),
            'recordsTotal' => $this->getDoctrine()->getRepository(Filter::class)->total(),
            'recordsFiltered' => $this->getDoctrine()->getRepository(Filter::class)->searchTotal($query, $limit, $offset),
            'offset' => $offset,
            'limit' => $limit,
        )));
    }
    
    public function getAction($id){
        if(!$entity=$this->getDoctrine()->getRepository(Filter::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        return $this->handleView($this->view($entity));
    }

    public function postAction(Request $request){
        $entity = new Filter();
        $form = $this->createForm(FilterType::class, $entity);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity->setJsonModels(json_encode($content['models']));
            $entity->setJsonServices(json_encode($content['services']));
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }
        
    public function putAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Filter::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createForm(FilterType::class, $entity);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity->setJsonModels(json_encode($content['models']));
            $entity->setJsonServices(json_encode(array_values(array_unique($content['services']))));
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

    public function byGroupAction(Request $request){
        $results=$this->getDoctrine()->getRepository(Filter::class)->getAll()->getQuery()->getResult();
        $data=[
            'forHome'=>[],
            'forIndustry'=>[],
            'forEvent'=>[]
        ];
        foreach($results as $key=>$result){
            if($result->getForSection()=='forHome'){
                $data['forHome'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
            if($result->getForSection()=='forIndustry'){
                $data['forIndustry'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
            if($result->getForSection()=='forEvent'){
                $data['forEvent'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
        }        
        return $this->handleView($this->view($data));
    }

    public function deleteAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(Filter::class)->find($id))
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