<?php

namespace App\Controller\Admin;

use App\Entity\Job;

use EasyCorp\Bundle\EasyAdminBundle\Collection\FieldCollection;
use EasyCorp\Bundle\EasyAdminBundle\Collection\FilterCollection;
use Doctrine\ORM\QueryBuilder;
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
use EasyCorp\Bundle\EasyAdminBundle\Dto\SearchDto;
use EasyCorp\Bundle\EasyAdminBundle\Dto\EntityDto;

use EasyCorp\Bundle\EasyAdminBundle\Orm\EntityRepository;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;

use App\Security\Voter\JobVoter;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\User\UserInterface;


class JobCrudController extends AbstractCrudController
{

    private EntityRepository $entityRepository;


    public function __construct(EntityRepository $entityRepository)
    {
        $this->entityRepository = $entityRepository;
    }


    public static function getEntityFqcn(): string
    {
        return Job::class;
    }


    public function createIndexQueryBuilder(SearchDto $searchDto, EntityDto $entityDto, FieldCollection $fields, FilterCollection $filters): QueryBuilder
    {
        parent::createIndexQueryBuilder($searchDto, $entityDto, $fields, $filters); // TODO: Change the autogenerated stub
        $response = $this->entityRepository->createQueryBuilder($searchDto, $entityDto, $fields, $filters);

        $user = $this->getUser();


        //$response->where('entity.user = ' . $this->getUser()->getId());


        if (!in_array("ROLE_ADMIN", $user->getRoles())) {
            $response->where('entity.user = ' . $this->getUser()->getId());
        }

        return $response;
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
        return $actions->setPermission(Action::EDIT, JobVoter::EDIT)
            ->setPermission(Action::NEW, 'ROLE_USER')
            ->setPermission(Action::DELETE, JobVoter::DELETE);
    }
}
