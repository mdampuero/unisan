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
use Inamika\BackEndBundle\Entity\Currency;

class CurrenciesFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        // $EUR = new Currency();
        // $EUR->setId(Currency::EUR);
        // $EUR->setName("Euro");
        // $EUR->setCode(Currency::EUR);
        // $EUR->setSymbol("€");
        // $EUR->setIsDefault(true);

        $CLP = new Currency();
        $CLP->setId(Currency::CLP);
        $CLP->setName("Peso chileno");
        $CLP->setCode(Currency::CLP);
        $CLP->setSymbol("$");
        $CLP->setIsDefault(true);
        $manager->persist($CLP);        
        $manager->flush();
    }
    
    public function getOrder(){
        return 4;
    }
}
