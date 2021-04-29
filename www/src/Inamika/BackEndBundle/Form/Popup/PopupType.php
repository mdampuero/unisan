<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Form\Popup;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Inamika\BackEndBundle\Entity\Popup;

class PopupType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('title',TextType::class,array('label'=>'TITLE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'NAME')))
       // ->add('description',TextareaType::class,array('label'=>'DESCRIPTION','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('isActive',ChoiceType::class, array('label'=>'ACTIVE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control'),'choices' => array(
            'YES' => true,
            'NO' => false
        )))
        ->add('display',ChoiceType::class, array('label'=>'DISPLAY','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control'),
        'choices' => array(
            Popup::SHOW_FOR_ONCE => Popup::SHOW_FOR_ONCE,
            Popup::SHOW_FOR_ONCE_DAY => Popup::SHOW_FOR_ONCE_DAY,
            Popup::SHOW_ALWAYS => Popup::SHOW_ALWAYS,
            Popup::SHOW_FOR_SESSION => Popup::SHOW_FOR_SESSION
        ),
        'placeholder' => 'SELECT_AN_OPTION',
        ))
        ->add('section', EntityType::class, array(
            'label'=>'SECTION',
            'label_attr'=>array('class'=>'control-label'),
            'class' => 'InamikaBackEndBundle:Section',
            'choice_label' => 'name',
            'attr'=>array('class'=>'form-control'),
            'placeholder' => 'SELECT_AN_OPTION',
            'query_builder' => function (EntityRepository $er) {
                $qb = $er->createQueryBuilder('e');
                $choices=$qb->where("e.isDelete=:isDelete")->setParameter('isDelete',false)
                    ->orderBy('e.position', 'ASC');
                return $choices;
            }
        ));
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'csrf_protection'=>false,
            'allow_extra_fields'=>true,
            'data_class' => 'Inamika\BackEndBundle\Entity\Popup'
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
