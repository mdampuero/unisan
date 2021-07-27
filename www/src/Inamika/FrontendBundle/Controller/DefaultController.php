<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\FrontendBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Inamika\BackEndBundle\Entity\Product;
use Inamika\BackEndBundle\Entity\Service;
use Inamika\BackEndBundle\Entity\Model;
use Inamika\BackEndBundle\Entity\Filter;
use Inamika\BackEndBundle\Entity\Customer;
use Inamika\BackEndBundle\Entity\Category;
use Inamika\BackEndBundle\Entity\OrdersPayments;
use Inamika\BackEndBundle\Entity\Orders;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Config\Definition\Exception\Exception;

class DefaultController extends Controller{
    
    public function indexAction(){
        $results=$this->getDoctrine()->getRepository(Model::class)->getAll()->orderBy("service.displayOrder","ASC")->getQuery()->getResult();
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

        $results=$this->getDoctrine()->getRepository(Filter::class)->getAll()->getQuery()->getResult();
        $filters=[
            'forHome'=>[],
            'forIndustry'=>[],
            'forEvent'=>[]
        ];
        foreach($results as $key=>$result){
            if($result->getForSection()=='forHome'){
                $filters['forHome'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
            if($result->getForSection()=='forIndustry'){
                $filters['forIndustry'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
            if($result->getForSection()=='forEvent'){
                $filters['forEvent'][]=array('name'=>$result->getName(),'services'=>json_decode($result->getJsonServices(),true));
            }
        }

        return $this->render('InamikaFrontendBundle:Default:index.html.twig',array(
            'salients'=>$this->getDoctrine()->getRepository(Product::class)->getAll()->andWhere('e.isSalient=:isSalient')->setParameter('isSalient',true)->getQuery()->getResult(),
            'services'=>$data,
            'filters'=>$filters
        ));
    }

    public function serviceAction($section,$id){
        $entity=$this->getDoctrine()->getRepository(Service::class)->find($id);
        $models=$this->getDoctrine()->getRepository(Model::class)->getByCategory($entity,$section)->getQuery()->getResult();
        return $this->render('InamikaFrontendBundle:Default:service.html.twig',array(
            'section'=>$section,
            'data'=>$entity,
            'models'=>$models
        ));
    }

    public function modelAction($section,$id){
        $entity=$this->getDoctrine()->getRepository(Model::class)->find($id);
        return $this->render('InamikaFrontendBundle:Default:model.html.twig',array(
            'section'=>$section,
            'data'=>$entity
        ));
    }
    
    public function productsAction(Request $request){
        $q=$request->query->get('q', null);
        $category=$request->query->get('category', null);
        $qb=$this->getDoctrine()->getRepository(Product::class)->getAll();
        if($category)
            $qb->andWhere('e.category=:category')->setParameter('category',$category);
        if($q)
            $qb->andWhere("CONCAT(e.name,COALESCE(e.description,'')) LIKE :query")->setParameter('query',"%".$q."%");
        return $this->render('InamikaFrontendBundle:Default:products.html.twig',array(
            'products'=>$qb->getQuery()->getResult(),
            'categories'=>$this->getDoctrine()->getRepository(Category::class)->getAll()->getQuery()->getResult(),
            'salients'=>$this->getDoctrine()->getRepository(Product::class)->getAll()->orderBy('RAND()')->setMaxResults(3)->andWhere('e.isSalient=:isSalient')->setParameter('isSalient',true)->getQuery()->getResult()
        ));
    }
    
    public function salientsAction(Request $request){
        return $this->render('InamikaFrontendBundle:Default:salients.html.twig',array(
            'salients'=>$this->getDoctrine()->getRepository(Product::class)->getAll()->andWhere('e.isSalient=:isSalient')->setParameter('isSalient',true)->getQuery()->getResult()
        ));
    }
    
    public function productAction(Request $request, $id){
        return $this->render('InamikaFrontendBundle:Default:product.html.twig',array(
            'data'=>$this->getDoctrine()->getRepository(Product::class)->find($id)
        ));
    }
    
    public function cartAction(Request $request){
        $customer=null;
        $orderId=$request->query->get('orderId', null);
        if($this->get('session')->get('_security_main')){
            $dataSession=$this->get('session')->get('_security_main');
            $customer=$this->getDoctrine()->getRepository(Customer::class)->find($dataSession['customer']->getId());
        }
        return $this->render('InamikaFrontendBundle:Default:cart.html.twig',array(
            'customer'=>$customer,
            'orderId'=>$orderId
        ));
    }
    
    public function paymentResultAction($order,Request $request){
        try {
            $em = $this->getDoctrine()->getManager();
            if(!$orderEntity=$em->getRepository(Orders::class)->find($order))
                throw new Exception('No se encontró la orden',6);
            
            $token=$request->query->get('token_ws', null);
            $response=$this->get('Webpay')->getResponse($token);
            $authorized=($response->getStatus()=='AUTHORIZED');
            $responseComplete=[
                'getVci'=>$response->getVci(),
                'getAmount'=>$response->getAmount(),
                'getStatus'=>$response->getStatus(),
                'getBuyOrder'=>$response->getBuyOrder(),
                'getSessionId'=>$response->getSessionId(),
                'getCardDetail'=>$response->getCardDetail(),
                'getCardNumber'=>$response->getCardNumber(),
                'getAccountingDate'=>$response->getAccountingDate(),
                'getTransactionDate'=>$response->getTransactionDate(),
                'getAuthorizationCode'=>$response->getAuthorizationCode(),
                'getPaymentTypeCode'=>$response->getPaymentTypeCode(),
                'getResponseCode'=>$response->getResponseCode(),
                'getInstallmentsAmount'=>$response->getInstallmentsAmount(),
                'getInstallmentsNumber'=>$response->getInstallmentsNumber(),
                'getBalance'=>$response->getBalance()
            ];

            $ordersPayments=new OrdersPayments();
            $ordersPayments->setOrder($orderEntity);
            $ordersPayments->setAmount($response->getAmount());
            $ordersPayments->setStatus($response->getStatus());
            $ordersPayments->setCardNumber($response->getCardNumber());
            $ordersPayments->setIsAuthorized($authorized);
            $ordersPayments->setAuthorizationCode($response->getAuthorizationCode());
            $ordersPayments->setDescription(json_encode($responseComplete));

            $em->persist($ordersPayments);
            $em->flush();

            if($ordersPayments->getIsAuthorized()){
                $orderEntity->setIsPendingPayment(false);
                $em->persist($orderEntity);
                $em->flush();
            }else{
                throw new Exception('El pago fue rechazado, intente nuevamente con otro medio de pago.',6);
            }
            header('Location: '.$this->generateUrl('inamika_frontend_cart').'?orderId='.$order);
            exit();
        } catch (\Throwable $th) {
            $this->addFlash("danger", $th->getMessage());
            return $this->redirectToRoute('inamika_frontend_cart');
        }
        
    }

    public function cotizationAction(Request $request, $modelId, $section){
        $entity=$this->getDoctrine()->getRepository(Model::class)->find($modelId);
        return $this->render('InamikaFrontendBundle:Default:cotization.html.twig',array(
            'section'=>$section,
            'data'=>$entity
        ));
    }
    
    public function sendCVAction(Request $request){
        return $this->render('InamikaFrontendBundle:Default:sendCV.html.twig');
    }

    protected function ifExist($array,$key){
        foreach($array as $index=>$value){
            if($value->getId()==$key)
                return true;
        }
        return false;
    }
}
