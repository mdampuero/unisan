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
use Inamika\BackEndBundle\Entity\ServiceCategory;

class ServiceCategoryFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }

    public function load(ObjectManager $manager){
        $serviceCategory = new ServiceCategory();
        $serviceCategory->setId(ServiceCategory::INDUSTRY);
        $serviceCategory->setName('Industria');
        $manager->persist($serviceCategory);
        
        $serviceCategory = new ServiceCategory();
        $serviceCategory->setId(ServiceCategory::HOME);
        $serviceCategory->setName('Hogar');
        $manager->persist($serviceCategory);
        
        $serviceCategory = new ServiceCategory();
        $serviceCategory->setId(ServiceCategory::EVENT);
        $serviceCategory->setName('Eventos');
        $manager->persist($serviceCategory);

        $manager->flush();
    }
    
    public function getOrder(){
        return 6;
    }
}
