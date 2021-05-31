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
class LoginController extends Controller{
    
    protected $path='inamika_frontend_account_orders';
    
    public function loginAction(Request $request){
        if($this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Login:login.html.twig',array(
            'form' => $this->createForm(LoginType::class, null,array(
                'method' => 'POST',
                'action' => $this->generateUrl('api_login_post')
            ))->createView()
        ));
    }

    public function forgotAction(Request $request){
        if($this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Login:forgot.html.twig');
    }
    
    public function resetAction(Request $request,$id,$code){
        if($this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
            'id'=>$id,
            'codeActive'=>$code
            )))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Login:reset.html.twig',array('entity'=>$entity));
    }
    
    public function validateAction(Request $request,$id,$code){
        if($this->get('session')->get('_security_main'))
            return $this->redirectToRoute($this->path);
        if(!$entity=$this->getDoctrine()->getRepository(Customer::class)->findOneBy(array(
            'id'=>$id,
            'codeActive'=>$code
            )))
            return $this->redirectToRoute($this->path);
        return $this->render('InamikaFrontendBundle:Login:validate.html.twig',array('entity'=>$entity));
    }

    public function logoutAction(){
        $this->get('session')->set('_security_main', null);
        return $this->redirectToRoute('inamika_frontend_login');
    }
}
