<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

use Inamika\BackEndBundle\Entity\ServiceCategory;
use Inamika\BackEndBundle\Entity\ServiceSubcategory;
use Inamika\BackEndBundle\Entity\Currency;
use Inamika\BackEndBundle\Form\ServiceCategory\ServiceCategoryType;

class ServiceCategoriesController extends BaseController
{   
    public function indexAction(Request $request){
        $search = $request->query->get('search', array());
        $query=(!isset($search['value']))?'':$search['value'];
        $offset = $request->query->get('start', 0);
        $limit = $request->query->get('length', 30);
        $sort = $request->query->get('sort', null);
        $direction = $request->query->get('direction', null);
        return $this->handleView($this->view(array(
            'data' => $this->getDoctrine()->getRepository(ServiceCategory::class)->search($query, $limit, $offset, $sort, $direction)->getQuery()->getResult(),
            'recordsTotal' => $this->getDoctrine()->getRepository(ServiceCategory::class)->total(),
            'recordsFiltered' => $this->getDoctrine()->getRepository(ServiceCategory::class)->searchTotal($query, $limit, $offset),
            'offset' => $offset,
            'limit' => $limit,
        )));
    }
    
    public function getAction($id){
        if(!$entity=$this->getDoctrine()->getRepository(ServiceCategory::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        return $this->handleView($this->view($entity));
    }
    
    public function putAction(Request $request,$id){
        if(!$entity=$this->getDoctrine()->getRepository(ServiceCategory::class)->find($id))
            return $this->handleView($this->view(null, Response::HTTP_NOT_FOUND));
        $form = $this->createForm(ServiceCategoryType::class, $entity);
        $content=json_decode($request->getContent(), true);
        $form->submit($content);
        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            if(key_exists('subcategories',$content)){
                foreach($content['subcategories'] as $sub){
                    if(!$subcategory=$this->getDoctrine()->getRepository(ServiceSubcategory::class)->find($sub["id"]))
                        $subcategory= new ServiceSubcategory();
                    $subcategory->setCategory($entity);
                    $subcategory->setName($sub["name"]);
                    $subcategory->setIsDelete(($sub["isDelete"])?1:0);
                    $em->persist($subcategory);
                }
            }
            $em->persist($entity);
            $em->flush();
            return $this->handleView($this->view($entity, Response::HTTP_OK));
        }
        return $this->handleView($this->view($form->getErrors(), Response::HTTP_BAD_REQUEST));
    }

}