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
        ->add('company',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('name',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('rut',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('comercialAddressStreet',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('comercialAddressNumber',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('comercialAddressCity',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('serviceAddressStreet',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('serviceAddressNumber',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('serviceAddressCity',TextType::class,array('label'=>'CLIENT_NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('email',TextType::class,array('label'=>'CLIENT_EMAIL','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('phone',TextType::class,array('label'=>'CLIENT_PHONE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('frequency',TextType::class,array('label'=>'CLIENT_CITY','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('observation',TextareaType::class,array('label'=>'OBSERVATION','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('model', EntityType::class, array(
            'label'=>'SERVICE',
            'label_attr'=>array('class'=>'control-label'),
            'class' => 'InamikaBackEndBundle:Model',
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
