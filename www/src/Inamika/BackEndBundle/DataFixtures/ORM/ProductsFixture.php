<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\DataFixtures\ORM;

use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\DependencyInjection\ContainerAwareInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Inamika\BackEndBundle\Entity\Product;
use Inamika\BackEndBundle\Entity\Currency;

class ProductsFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        for ($i=1; $i<=100; $i++){
            $product = new Product();
            $product->setName("Producto - ".$i);
            $product->setCode("AA".$i);
            $product->setPrice($i*1.10);
            $product->setCurrency($manager->getRepository(Currency::class)->findOneByIsDefault(true));
            $product->setDescription("Description producto - ".$i);
            $manager->persist($product);
        }
        $manager->flush();
    }
    
    public function getOrder(){
        return 5;
    }
}
