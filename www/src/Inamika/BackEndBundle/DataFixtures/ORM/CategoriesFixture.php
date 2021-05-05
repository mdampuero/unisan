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
use Inamika\BackEndBundle\Entity\Category;

class CategoriesFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        
        $category = new Category();
        $category->setName("Unidades Sanitarias");
        $manager->persist($category);
        $category = new Category();
        $category->setName("Bacterias");
        $manager->persist($category);
        $category = new Category();
        $category->setName("Aromatizantes");
        $manager->persist($category);
        $category = new Category();
        $category->setName("Productos químicos");
        $manager->persist($category);
        
        $manager->flush();
    }
    
    public function getOrder(){
        return 2;
    }
}
