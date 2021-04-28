<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Form\Cotization;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class CotizationType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('clientName',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('clientEmail',TextType::class,array('label'=>'CLIENT_EMAIL','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('clientPhone',TextType::class,array('label'=>'CLIENT_PHONE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('clientCity',TextType::class,array('label'=>'CLIENT_CITY','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('clientAddress',TextareaType::class,array('label'=>'CLIENT_ADDRESS','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('observation',TextareaType::class,array('label'=>'OBSERVATION','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('service', EntityType::class, array(
            'label'=>'SERVICE',
            'label_attr'=>array('class'=>'control-label'),
            'class' => 'InamikaBackEndBundle:Service',
            'choice_label' => 'name',
            'attr'=>array('class'=>'form-control'),
            'placeholder' => 'SELECT_AN_OPTION',
            'query_builder' => function (EntityRepository $er) {
                $qb = $er->createQueryBuilder('e');
                $choices=$qb->where("e.isDelete=:isDelete")->setParameter('isDelete',false)
                    ->orderBy('e.name', 'ASC');
                return $choices;
            }
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection'=>false,
            'allow_extra_fields'=>true,
            'data_class' => 'Inamika\BackEndBundle\Entity\Cotization'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return '';
    }

}
