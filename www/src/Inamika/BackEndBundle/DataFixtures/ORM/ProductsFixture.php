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
use Inamika\BackEndBundle\Entity\Category;
use Inamika\BackEndBundle\Entity\Currency;

class ProductsFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){
        $data=[
            'Unidades Sanitarias'=>[
                ['name'=>'Baño químico','description'=>'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan con ventanillas de ventilación, tubo extracción de olores y cierre con pestillos. Urinario, lavamanos y otros adicionales son acorde al requerimiento del cliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs Capacidad del estanque: 227 lts.'],
                ['name'=>'Carro Urbano con baño','description'=>'Unidades fabricadas en acero galvanizado, posee  eje con suspención que permite desplazamiento hasta de 90 km/Hora y soporta peso de 250 kg. Posee pata estabilizadora y rueda repuesto. Carro cuenta  con escala para acceder al baño químico montado sobre él. Las características del baño pueden ser ajustadas a la necesidad del cliente. Las medidas son: 2,2 x 1,55 x 1,55 m Peso vacío: 131 Kgs. El carro cuenta con luces reglamentarias y documentación que permiten el desplazamiento en ruta.'],
                ['name'=>'Ducha plástico','description'=>'Unidades fabricadas en EEUU con polietileno de alta densidad y protección UV, todas cuentan manillas, aspersor de agua y conexión a la red de agua para  fría y caliente. Las medidas son: 2,3 x 1,1 x 1,2 m Peso vacío: 75 Kgs.'],
                ['name'=>'Caseta de vigilancia','description'=>''],
            ],
            'Bacterias'=>[
                ['name'=>'Bactería para grasas','description'=>''],
                ['name'=>'Bactería para residuos domiciliarios','description'=>'']
            ],
            'Aromatizantes'=>[
                ['name'=>'Spray aromatizante','description'=>''],
                ['name'=>'Disco aromáticos','description'=>'']
            ],
            'Productos Químicos'=>[
                ['name'=>'Amonio Cuaternario','description'=>''],
                ['name'=>'Kit para urinarios','description'=>'']
            ]
        ];
        foreach($data as $category =>$products){
            $categoryEntity=$manager->getRepository(Category::class)->findOneByName($category);
            foreach($products as $productArray){
                $product = new Product();
                $product->setName($productArray['name']);
                $product->setCategory($categoryEntity);
                $product->setDescription($productArray['description']);
                $product->setPrice(100000);
                $product->setIsSalient((bool)random_int(0, 1));
                $product->setCurrency($manager->getRepository(Currency::class)->findOneByIsDefault(true));
                $manager->persist($product);
            }
        }
        $manager->flush();
    }
    
    public function getOrder(){
        return 5;
    }
}
