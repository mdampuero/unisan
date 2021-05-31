<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Form\Model;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Doctrine\ORM\EntityRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Inamika\BackEndBundle\Entity\Popup;

class ModelType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('name',TextType::class,array('label'=>'NAME','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control')))
        ->add('description',TextareaType::class,array('label'=>'DESCRIPTION','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('spec',TextareaType::class,array('label'=>'SPECS','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
        ->add('conditions',TextareaType::class,array('label'=>'CONDITIONS','label_attr'=>array('class'=>'control-label'),'attr'=>array('class'=>'form-control','placeholder'=>'')))
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
        ))
        ->add('forHome', CheckboxType::class, [
            'label'    => 'FOR_HOME'
        ])
        ->add('forIndustry', CheckboxType::class, [
            'label'    => 'FOR_INDUSTRY'
        ])
        ->add('forEvent', CheckboxType::class, [
            'label'    => 'FOR_EVENT'
        ])
        ->add('pictureRemove',HiddenType::class,array("mapped" => false))
        ->add('pictureBase64',HiddenType::class,array("mapped" => false))
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
        // ->add('model3dRemove',HiddenType::class,array("mapped" => false))
        // ->add('model3dBase64',HiddenType::class,array("mapped" => false))
        // ->add('model3d', FileType::class, array(
        //     'label'=>'PICTURE',
        //     'data_class' => null,
        //     'label_attr'=>array('class'=>'control-label'),
        //     'attr'=>array(
        //         'onchange'=>'encodeImageFileAsURL(this)',
        //         'class'=>'dropify',
        //         'data-height'=>'200',
        //         'data-max-file-size'=>'20M',
        //         'data-allowed-file-extensions'=>'glb'
        //         )
        //     )
        // )
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
            'data_class' => 'Inamika\BackEndBundle\Entity\Model'
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
