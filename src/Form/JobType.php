<?php

namespace App\Form;

use App\Entity\Job;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class JobType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('position')
            ->add('contract')
            ->add('location')
            ->add('description')
            ->add('requirementContent')
            ->add('requirements')
            ->add('roleContent')
            ->add('roles')
            ->add('createdAt', null, [
                'widget' => 'single_text',
            ])
            ->add('apply')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Job::class,
        ]);
    }
}
