<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Form\Product;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class ProductType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('name',TextType::class,array('label'=>'NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('code',TextType::class,array('label'=>'CODE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('price',TextType::class,array('label'=>'PRICE','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('description',TextareaType::class,array('label'=>'DESCRIPTION','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('pictureRemove',HiddenType::class,array("mapped" => false))
        ->add('pictureBase64',HiddenType::class,array("mapped" => false))
        ->add('isSalient',ChoiceType::class, array('label'=>'SALIENT','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control'),'choices' => array(
            'YES' => true,
            'NO' => false
        )))
        ->add('picture', FileType::class, array(
            'label'=>'PICTURE',
            'data_class' => null,
            'label_attr'=>array('class'=>'control-label'),
            'attr'=>array(
                'onchange'=>'encodeImageFileAsURL(this)',
                'class'=>'dropify',
                'data-height'=>'480',
                'data-max-file-size'=>'4M',
                'data-allowed-file-extensions'=>'png jpg jpeg gif'
                )
            )
        )
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
            'data_class' => 'Inamika\BackEndBundle\Entity\Product'
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
