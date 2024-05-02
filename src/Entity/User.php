<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]

#[ORM\UniqueConstraint(name: 'UNIQ_IDENTIFIER_EMAIL', fields: ['email'])]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 180)]
    private ?string $email = null;

    /**
     * @var list<string> The user roles
     */
    #[ORM\Column]
    private array $roles = [];

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    /**
     * @var Collection<int, Job>
     */
    #[ORM\OneToMany(targetEntity: Job::class, mappedBy: 'user')]
    private Collection $Jobs;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $CompanyName = null;

    #[ORM\Column(length: 64, nullable: true)]
    private ?string $LogoBackground = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $Website = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $LogoUrl = null;

    #[ORM\Column(nullable: true)]
    private ?\DateTimeImmutable $updatedAt = null;



    public function __construct()
    {
        $this->Jobs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     *
     * @return list<string>
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    /**
     * @param list<string> $roles
     */
    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    /**
     * @return Collection<int, Job>
     */
    public function getJobs(): Collection
    {
        return $this->Jobs;
    }

    public function addJob(Job $job): static
    {
        if (!$this->Jobs->contains($job)) {
            $this->Jobs->add($job);
            $job->setUser($this);
        }

        return $this;
    }

    public function removeJob(Job $job): static
    {
        if ($this->Jobs->removeElement($job)) {
            // set the owning side to null (unless already changed)
            if ($job->getUser() === $this) {
                $job->setUser(null);
            }
        }

        return $this;
    }

    public function getCompanyName(): ?string
    {
        return $this->CompanyName;
    }

    public function setCompanyName(string $CompanyName): static
    {
        $this->CompanyName = $CompanyName;

        return $this;
    }

    public function getLogoBackground(): ?string
    {
        return $this->LogoBackground;
    }

    public function setLogoBackground(string $LogoBackground): static
    {
        $this->LogoBackground = $LogoBackground;

        return $this;
    }

    public function getWebsite(): ?string
    {
        return $this->Website;
    }

    public function setWebsite(string $Website): static
    {
        $this->Website = $Website;

        return $this;
    }

    public function getLogoUrl(): ?string
    {
        return $this->LogoUrl;
    }

    public function setLogoUrl(?string $LogoUrl): static
    {
        $this->LogoUrl = $LogoUrl;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updatedAt): static
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }




}
