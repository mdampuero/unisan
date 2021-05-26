<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\FrontendBundle\Controller;

use Inamika\BackEndBundle\Entity\Model;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class UtilsController extends Controller{
    
    public function navbarAction($home, $route,$class){
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
        return $this->render('InamikaFrontendBundle:Utils:navbar.html.twig',array('data'=>$data,'home'=>$home,'route'=>$route,'class'=>$class));
    }
    
    protected function ifExist($array,$key){
        foreach($array as $index=>$value){
            if($value->getId()==$key)
                return true;
        }
        return false;
    }
    
}
