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
use Inamika\BackEndBundle\Entity\Section;

class SectionsFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        $section = new Section();
        $section->setId("HOME");
        $section->setName("Inicio");
        $section->setPosition(100);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("ACCOUNT");
        $section->setName("Mi cuenta");
        $section->setPosition(200);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("ACCOUNT-CONVENIOS");
        $section->setName("Listado de convenios");
        $section->setPosition(300);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("ACCOUNT-CONVENIOS-DETAIL");
        $section->setName("Detalle de convenio");
        $section->setPosition(400);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("ACCOUNT-ORDERS");
        $section->setName("Listado de órdenes");
        $section->setPosition(500);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("ACCOUNT-ORDERS-DETAIL");
        $section->setName("Detalle de órden");
        $section->setPosition(600);
        $manager->persist($section);
       
        $section = new Section();
        $section->setId("ACCOUNT-USERS");
        $section->setName("Listado de usuarios");
        $section->setPosition(600);
        $manager->persist($section);
       
        $section = new Section();
        $section->setId("CART");
        $section->setName("Carrito de compras");
        $section->setPosition(600);
        $manager->persist($section);

        $section = new Section();
        $section->setId("COTIZATION");
        $section->setName("Formulario de cotización");
        $section->setPosition(600);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("FORGOT-PASSWORD");
        $section->setName("Olvidé mi constraseña");
        $section->setPosition(1200);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("LOGIN");
        $section->setName("Inicio de sesión");
        $section->setPosition(600);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("PRODUCT");
        $section->setName("Listado de productos");
        $section->setPosition(1000);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("PRODUCT-DETAIL");
        $section->setName("Detalle de producto");
        $section->setPosition(1100);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("PSALIENT");
        $section->setName("Productos Destacados");
        $section->setPosition(1150);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("RESET-PASSWORD");
        $section->setName("Blanqueo de contraseña");
        $section->setPosition(1300);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("SERVICES");
        $section->setName("Detalle de Servicio");
        $section->setPosition(1500);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("SERVICES-DETAIL");
        $section->setName("Detalle de Model");
        $section->setPosition(1500);
        $manager->persist($section);
        
        $section = new Section();
        $section->setId("VALIDATE-ACCOUNT");
        $section->setName("Activación de cuenta");
        $section->setPosition(1500);
        $manager->persist($section);

        $manager->flush();
    }
    
    public function getOrder(){
        return 12;
    }
}
