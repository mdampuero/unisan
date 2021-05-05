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
use Inamika\BackEndBundle\Entity\Model;
use Inamika\BackEndBundle\Entity\Service;

class ModelsFixture extends AbstractFixture implements OrderedFixtureInterface, ContainerAwareInterface{

    private $container;

    public function setContainer(ContainerInterface $container = null){
        $this->container = $container;
    }
    
    public function load(ObjectManager $manager){

        $data=[
            'Unidades Sanitarias'=>[
                ['name'=>'Baño Químico Vip','forHome'=>false,'forIndustry'=>false,'forEvent'=>true],
                ['name'=>'Baño Químico Minusválido','forHome'=>false,'forIndustry'=>false,'forEvent'=>true],
                ['name'=>'Baño Químico con conexión','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Carro Urbano simple','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Carro Agrícola Doble','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Baño Químico','forHome'=>true,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Ducha Portátil','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Arnés Alzador','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Punto de Agua','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Caseta de Vigilancia simple','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Caseta de Vigilancia con baño','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Caseta de Vigilancia doble','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Caseta Mudador','forHome'=>false,'forIndustry'=>false,'forEvent'=>true],
                ['name'=>'Urinario Urijet','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Urinario pasillo','forHome'=>false,'forIndustry'=>true,'forEvent'=>true],
            ],
            'Baños de Lujo'=>[
                ['name'=>'Trailer Vip','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Trailer Presidencial','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Trailer Minusvalido','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Trailer Gold','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Trailer Silver','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Torres de Iluminación','forHome'=>true,'forIndustry'=>true,'forEvent'=>true],
            ],
            'Limpieza de Fosas y Grasas'=>[
                ['name'=>'Retiro de Riles','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Retiro de Grasas','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Retiro de Aguas Servidas','forHome'=>true,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Limpieza Hydrojet','forHome'=>true,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Destape de ductos','forHome'=>true,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Mantención de Camaras','forHome'=>true,'forIndustry'=>true,'forEvent'=>false],
            ],
            'Residuos Industriales'=>[
                ['name'=>'Tolva abierta 12 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Tolva abierta 20 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Tolva abierta 30 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Autocompactador 20 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Tolva cerrada 15 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Tolva estanco 15 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Alza contenedor','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Contenedores plásticos','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
            ],
            'Residuos Peligrosos'=>[
                ['name'=>'Retiro de Respel','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Bodegas Respel','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
            ],
            'Escombros'=>[
                ['name'=>'Multibucket 5 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Multibucket 9 m3','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Tolva abierta 12 m3','forHome'=>true,'forIndustry'=>false,'forEvent'=>false],
                ['name'=>'Bagster','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Jaula Segregación','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
            ],
            'Reciclaje y Valorización'=>[
                ['name'=>'Jaula de Reciclaje','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Puntos Limpios','forHome'=>false,'forIndustry'=>true,'forEvent'=>true],
                ['name'=>'Enfardadora en origen','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Tolvas de Segregación','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Retiro de reciclables','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
            ],
            'Sanitización'=>[
                ['name'=>'Oficinas','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Espacios abiertos','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
                ['name'=>'Sanitarios','forHome'=>false,'forIndustry'=>true,'forEvent'=>false],
            ]
        ];


        $lorem="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor rutrum urna vitae elementum. Proin et quam vel massa pellentesque mollis. Sed non vehicula urna, sed tincidunt elit. Aliquam erat volutpat. Ut tempus dictum tortor eget posuere. Vestibulum fringilla efficitur sollicitudin. Sed at porta dolor. Nam lectus metus, dictum ut volutpat sed, elementum nec erat.";
        foreach($data as $service =>$models){
            $serviceEntity=$manager->getRepository(Service::class)->findOneByName($service);
            foreach($models as $modelName){
                $model = new Model();
                $model->setName($modelName['name']);
                $model->setForHome($modelName['forHome']);
                $model->setForIndustry($modelName['forIndustry']);
                $model->setForEvent($modelName['forEvent']);
                $model->setService($serviceEntity);
                $model->setDescription($lorem);
                $model->setSpec($lorem);
                $model->setConditions($lorem);
                $manager->persist($model);
            }
        }
        
        $manager->flush();
    }
    
    public function getOrder(){
        return 10;
    }
}
