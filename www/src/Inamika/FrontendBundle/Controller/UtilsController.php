<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\FrontendBundle\Controller;

use Inamika\BackEndBundle\Entity\Model;
use Inamika\BackEndBundle\Entity\Customer;
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
    
    public function modalsAction(){
        $months=[];
        for($i=1;$i<=12; $i++)
            $months[]=$this->get('translator')->trans(strtoupper(date('F', mktime(0,0,0,$i, 1, date('Y')))));
        $years=[];
        for($i=(date("Y") - 1);$i<=(date("Y")); $i++)
            $years[]=$i;
        
        return $this->render('InamikaFrontendBundle:Utils:modals.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId()),
            'months'=>$months,
            'years'=>$years
        ));
    }
    
    public function menuUserAction($route){
        return $this->render('InamikaFrontendBundle:Utils:menuUser.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId()),
            'route'=>$route
        ));
    }
    
    protected function ifExist($array,$key){
        foreach($array as $index=>$value){
            if($value->getId()==$key)
                return true;
        }
        return false;
    }
    
}
