<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\FrontendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Inamika\BackEndBundle\Form\Login\LoginType;
use Inamika\BackEndBundle\Entity\Customer;
use Inamika\BackEndBundle\Entity\Orders;
use Inamika\BackEndBundle\Entity\OrdersStatus;
class AccountController extends Controller{
    
    protected $path='inamika_frontend_login';

    public function indexAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:index.html.twig');
    }
    
    public function ordersAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);

        $status=$request->query->get('status', null);
        $id=$request->query->get('id', null);
        $qb=$this->getDoctrine()->getRepository(Orders::class)->getAll()
            ->andWhere('e.customer=:customer')->setParameter('customer',$this->get('session')->get('_security_main')['customer']->getId());
        if($status)
            $qb->andWhere('e.status=:status')->setParameter('status',$status);
        if($id)
            $qb->andWhere('e.id=:id')->setParameter('id',$id);
        return $this->render('InamikaFrontendBundle:Account:orders.html.twig',array(
            'status'=>$this->getDoctrine()->getRepository(OrdersStatus::class)->findAll(),
            'results'=>$qb->getQuery()->getResult()
        ));
    }
    
    public function orderAction(Request $request,$id){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        $entity=$this->getDoctrine()->getRepository(Orders::class)->findOneBy(array(
            'isDelete'=>false,
            'customer'=>$this->get('session')->get('_security_main')['customer']->getId(),
            'id'=>$id
        ));
        return $this->render('InamikaFrontendBundle:Account:order.html.twig',array(
            'entity'=>$entity
        ));
    }

    public function conveniosAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:convenios.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }

    public function convenioAction(Request $request,$id){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:convenio.html.twig',array(
            'id'=>$id,
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }

    public function contratosAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:contratos.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }
    
    public function contratoAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:contratos.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }
    
    public function usuariosAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        $user=$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId());
        if($user->getRole()!='ROLE_CUSTOMER_SUPER')
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:usuarios.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }

    public function profileAction(Request $request){
        if(!$this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Account:profile.html.twig',array(
            'user'=>$this->getDoctrine()->getRepository(Customer::class)->find($this->get('session')->get('_security_main')['customer']->getId())
        ));
    }
}