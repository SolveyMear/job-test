<?php

namespace App\Controller\Admin;

use App\Entity\Job;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

class JobCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Job::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('position'),
            BooleanField::new('contract'),
            TextField::new('location'),
            ArrayField::new('requirements'),
            //TextEditorField::new('description'),
        ];
    }

    //Full texts
    // id 	position 	contract 	location 	description 	requirement_content 	requirements
    //(DC2Type:array) 	role_content 	roles
    //(DC2Type:array) 	created_at 	apply

}
