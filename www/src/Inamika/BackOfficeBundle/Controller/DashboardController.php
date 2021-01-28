<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackOfficeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DashboardController extends Controller
{
    public function indexAction(){
        return $this->render('InamikaBackOfficeBundle:Dashboard:index.html.twig',array(
            'yearsByOrders'=>$this->getDoctrine()->getRepository('InamikaBackEndBundle:Orders')->getDistinctYear(),
            'yearsByVisits'=>$this->getDoctrine()->getRepository('InamikaBackEndBundle:Visit')->getDistinctYear(),
            'currencies'=>$this->getDoctrine()->getRepository('InamikaBackEndBundle:Currency')->getAll()->getQuery()->getResult()
        ));
    }
}
