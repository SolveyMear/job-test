<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240502140346 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE job CHANGE requirements requirements LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:json)\', CHANGE roles roles LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:json)\'');
        $this->addSql('ALTER TABLE job ADD CONSTRAINT FK_FBD8E0F8A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_FBD8E0F8A76ED395 ON job (user_id)');
        $this->addSql('ALTER TABLE user ADD image_name VARCHAR(255) DEFAULT NULL, ADD image_size INT DEFAULT NULL, ADD updated_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', CHANGE roles roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\', CHANGE company_name company_name VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE job DROP FOREIGN KEY FK_FBD8E0F8A76ED395');
        $this->addSql('DROP INDEX IDX_FBD8E0F8A76ED395 ON job');
        $this->addSql('ALTER TABLE job CHANGE requirements requirements TEXT DEFAULT NULL, CHANGE roles roles TEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE user DROP image_name, DROP image_size, DROP updated_at, CHANGE roles roles TEXT DEFAULT NULL, CHANGE company_name company_name VARCHAR(255) DEFAULT \'Your Company Name\'');
    }
}
