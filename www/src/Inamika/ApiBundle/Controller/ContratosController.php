<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\ApiBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ContratosController extends BaseController
{   
    private $token='WfjQzG4cSnSENv6ukFQo7FiaAxbP19qwYdij';

    public function indexAction(Request $request){
        $result=$this->get('ApiCall')->get("http://23.19.226.69:81/include/adaptiva/reporte_inventario_xls.php?rut=96691680-K&token=".$this->token);
        return $this->handleView($this->view($this->desassociate($result)));
    }

    public function getByRutAction(Request $request){
        $result=$this->get('ApiCall')->get("http://23.19.226.69:81/include/adaptiva/reporte_inventario_xls.php?".$this->preQuery($request)."&token=".$this->token);
        return $this->handleView($this->view($this->desassociate($result)));
    }

    protected function preQuery($request){
        $conditions=[];
        $content=json_decode($request->getContent(), true);
        if(key_exists('query',$content)){
            foreach($content["query"] as $key =>$value){
                if($value!='')
                    $conditions[]=$key."=".$value;
            }
            return join("&",$conditions);
        }else{
            return '';
        }
    }

    protected function desassociate($response){
        $data=[];
        foreach($response["result"][0]['contrato'] as $key=>$value){
            $value[0]['id']=$key;
            $value[0]['unidades']=$this->desassociateUnit($value[0]['unidad']);
            $data[]=$value[0];
        }
        return $data;
    }
    protected function desassociateUnit($units){
        $data=[];
        foreach($units as $key=>$value){
            $data[]=array('name'=>$key,'count'=>$value);
        }
        return $data;
    }

}