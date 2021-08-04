<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Service;
use Symfony\Component\HttpClient\HttpClient;
use Doctrine\ORM\EntityManager;
use Transbank\Webpay\WebpayPlus\Transaction;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Inamika\BackEndBundle\Entity\Trace;
/**
 * Class Webpay
 *
 * @package Inamika\BackEndBundle\Service
 */
class Webpay
{
    protected $em;
    protected $setting;
    protected $transaction; 
    protected $router; 

    public function __construct(EntityManager $em, $router)
    {

        $this->em = $em;   
        $this->router = $router;
        $this->setting=$this->em->getRepository('InamikaBackEndBundle:Setting')->find('setting');
        $this->transaction = new Transaction();
        if($this->setting->getWebpayProduction())
            $this->transaction->configureForProduction($this->setting->getWebpayCommerceCode(), $this->setting->getWebpayKeySecret());
        else
            $this->transaction->configureForIntegration($this->setting->getWebpayCommerceCode(), $this->setting->getWebpayKeySecret());
    }

    /**
     * @return array
     */
    public function getUrl($orderId,$amount){
        $createResponse = $this->transaction->create($orderId, uniqid(), $amount, $this->router->generate('inamika_frontend_payment_result',['order'=>$orderId],UrlGeneratorInterface::ABSOLUTE_URL));
        $trace= new Trace();
        $trace->setName('Transaction -> create');
        $trace->setDescription(json_encode([
            'orderId'=>$orderId,
            'sessionId'=>uniqid(),
            'amount'=>$amount,
            'url'=>$this->router->generate('inamika_frontend_payment_result',['order'=>$orderId],UrlGeneratorInterface::ABSOLUTE_URL),
            'urlResponse'=>$createResponse->getUrl(),
            'token'=>$createResponse->getToken()
        ]));
        $this->em->persist($trace);
        $this->em->flush();
        return $createResponse->getUrl().'?token_ws='.$createResponse->getToken();
    }
    
    /**
     * @return array
     */
    public function getResponse($token){
        $response=$this->transaction->commit($token);
        $trace= new Trace();
        $trace->setName('Transaction -> commit');
        $trace->setDescription(json_encode([
            'token'=>$token,
            'response'=>$response
        ]));
        $this->em->persist($trace);
        $this->em->flush();
        return $response;
    }
    
    
}