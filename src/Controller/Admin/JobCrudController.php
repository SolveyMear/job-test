<?php

namespace App\Controller\Admin;

use App\Entity\Job;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CountryField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\UrlField;

use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;

class JobCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Job::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('position'),
            BooleanField::new('contract')->onlyOnForms(),
            CountryField::new('location')->showFlag(false),
            TextareaField::new('requirementContent')->hideOnIndex(),
            ArrayField::new('requirements')->hideOnIndex(),
            TextareaField::new('roleContent')->hideOnIndex(),
            ArrayField::new('roles')->hideOnIndex(),
            TextareaField::new('description'),
            UrlField::new('apply'),

        ];
    }

    public function configureActions(Actions $actions): Actions
    {
        return $actions->setPermission(Action::EDIT, 'ROLE_USER')
            ->setPermission(Action::NEW, 'ROLE_ADMIN')
            ->setPermission(Action::DELETE, 'ROLE_ADMIN');
        /*  ->setPermission(Action::DELETE, {
                $job->isAuthor();
            }); */
    }


    /* 
    public function configureActions(Actions $actions): Actions
    {
        return parent::configureActions($actions)
            ->update(Crud::PAGE_INDEX, Action::DELETE, static function (Action $action) {
                $action->displayIf(static function (Job $job) {
                    return $job->isAuthor();
                })
                
            });
    } */
}
