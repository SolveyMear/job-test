<?php

namespace App\Entity;

use App\Repository\JobRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use phpDocumentor\Reflection\Types\Boolean;
use Symfony\Component\Intl\Countries;

#[ORM\Entity(repositoryClass: JobRepository::class)]
class Job
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(nullable: true)]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $position = null;

    #[ORM\Column]
    private ?bool $contract = null;

    #[ORM\Column(length: 255)]
    private ?string $location = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $description = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $requirementContent = null;

    #[ORM\Column(nullable: true)]
    private ?array $requirements = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $roleContent = null;

    #[ORM\Column(nullable: true)]
    private ?array $roles = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $apply = null;

    #[ORM\ManyToOne(inversedBy: 'Jobs')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $user = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPosition(): ?string
    {
        return $this->position;
    }

    public function setPosition(string $position): static
    {
        $this->position = $position;

        return $this;
    }

    public function isContract(): ?bool
    {
        return $this->contract;
    }

    public function setContract(bool $contract): static
    {
        $this->contract = $contract;

        return $this;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function setLocation(string $location): static
    {
        $this->location = Countries::getName($location);

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getRequirementContent(): ?string
    {
        return $this->requirementContent;
    }

    public function setRequirementContent(?string $requirementContent): static
    {
        $this->requirementContent = $requirementContent;

        return $this;
    }

    public function getRequirements(): ?array
    {
        return $this->requirements;
    }

    public function setRequirements(?array $requirements): static
    {
        $this->requirements = $requirements;

        return $this;
    }

    public function getRoleContent(): ?string
    {
        return $this->roleContent;
    }

    public function setRoleContent(?string $roleContent): static
    {
        $this->roleContent = $roleContent;

        return $this;
    }

    public function getRoles(): ?array
    {
        return $this->roles;
    }

    public function setRoles(?array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getApply(): ?string
    {
        return $this->apply;
    }

    public function setApply(string $apply): static
    {
        $this->apply = $apply;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }
}
