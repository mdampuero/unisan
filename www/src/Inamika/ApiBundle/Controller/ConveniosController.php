<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ConveniosController extends BaseController
{   
    public function indexAction(Request $request){
        $sql = " SELECT * FROM VistaClientesConvenios";
        $stmt = $this->getDoctrine()->getManager('convenios')->getConnection()->prepare($sql);
        $stmt->execute();
        return $this->handleView($this->view($stmt->fetchAll()));
    }

    public function getByRutAction(Request $request){
       
        $sql = " SELECT * FROM VistaClientesConvenios WHERE ".$this->preQuery($request)." ORDER BY FechaInicioServecio DESC";
        $stmt = $this->getDoctrine()->getManager('convenios')->getConnection()->prepare($sql);
        $stmt->execute();
        return $this->handleView($this->view($stmt->fetchAll()));
    }

    private function preQuery($request){
        $conditions=[];
        $content=json_decode($request->getContent(), true);
        if(key_exists('query',$content)){
            foreach($content["query"] as $key =>$value){
                $conditions[]=$key." = '".$value."'";
            }
            return join(" AND ",$conditions);
        }else{
            return '1';
        }
    }
}