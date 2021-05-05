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

class ServicesFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        
        $service = new Service();
        $service->setName("Unidades Sanitarias");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
        
        $service = new Service();
        $service->setName("Baños de Lujo");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
        
        $service = new Service();
        $service->setName("Limpieza de Fosas y Grasas");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
       
        $service = new Service();
        $service->setName("Residuos Industriales");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);

        $service = new Service();
        $service->setName("Residuos Peligrosos");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
        
        $service = new Service();
        $service->setName("Escombros");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
        
        $service = new Service();
        $service->setName("Reciclaje y Valorización");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);
       
        $service = new Service();
        $service->setName("Sanitización");
        $service->setTitle("Lorem ipsum dolor sit amet");
        $service->setDescription("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit scelerisque lectus. Sed suscipit quam tellus, in consequat nisi pulvinar nec. Suspendisse felis massa, gravida ut nisl interdum, ullamcorper convallis felis. Curabitur gravida gravida lacus, a tristique enim elementum non. Donec ligula turpis, interdum eget porta at, pellentesque quis elit. Proin ultricies mollis mi, nec fermentum elit dapibus eget. Phasellus in dolor porta, fringilla libero id, viverra velit. Suspendisse vulputate mauris turpis, nec pretium ipsum consectetur laoreet. Donec dictum faucibus lacus, in pretium magna tristique ac.");
        $manager->persist($service);

        $manager->flush();
    }
    
    public function getOrder(){
        return 8;
    }
}
