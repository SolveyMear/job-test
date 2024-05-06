<?php

namespace App\Security\Voter;


use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\User\UserInterface;

class JobVoter extends Voter
{
    public const EDIT = 'JOB_EDIT';
    public const DELETE = 'JOB_DELETE';

    protected function supports(string $attribute, mixed $subject): bool
    {
        // replace with your own logic
        // https://symfony.com/doc/current/security/voters.html
        return in_array($attribute, [self::EDIT, self::DELETE])
            && $subject instanceof \App\Entity\Job;
    }

    protected function voteOnAttribute(string $attribute, mixed $subject, TokenInterface $token): bool
    {
        $user = $token->getUser();

        // if the user is anonymous, do not grant access
        if (!$user instanceof UserInterface) {
            return false;
        }

        /**
         * @var Job $job
         */


        $job = $subject;

        // ... (check conditions and return true to grant permission) ...
        switch ($attribute) {
            case self::EDIT:
                return ($job->getUser() === $user || in_array("ROLE_ADMIN", $user->getRoles()));
                break;

            case self::DELETE:
                return ($job->getUser() === $user || in_array("ROLE_ADMIN", $user->getRoles()));
                break;
        }

        return false;
    }
}
