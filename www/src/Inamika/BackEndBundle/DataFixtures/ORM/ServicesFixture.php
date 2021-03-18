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
use Inamika\BackEndBundle\Entity\Service;
use Inamika\BackEndBundle\Entity\ServiceCategory;

class ServicesFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        $categoryINDUSTRY=$manager->getRepository(ServiceCategory::class)->find(ServiceCategory::INDUSTRY);
        for ($i=1; $i<=15; $i++){
            $service = new Service();
            $service->setName($categoryINDUSTRY->getName()." - Servicio - ".$i);
            $service->setCategory($categoryINDUSTRY);
            $service->setCode("SE#".$i);
            $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
            $manager->persist($service);
        }
        
        $categoryHOME=$manager->getRepository(ServiceCategory::class)->find(ServiceCategory::HOME);
        for ($i=16; $i<=30; $i++){
            $service = new Service();
            $service->setName($categoryHOME->getName()." - Servicio - ".$i);
            $service->setCategory($categoryHOME);
            $service->setCode("SE#".$i);
            $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
            $manager->persist($service);
        }

        $categoryEVENT=$manager->getRepository(ServiceCategory::class)->find(ServiceCategory::EVENT);
        for ($i=31; $i<=45; $i++){
            $service = new Service();
            $service->setName($categoryEVENT->getName()." - Servicio - ".$i);
            $service->setCategory($categoryEVENT);
            $service->setCode("SE#".$i);
            $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
            $manager->persist($service);
        }

        $manager->flush();
    }
    
    public function getOrder(){
        return 8;
    }
}
