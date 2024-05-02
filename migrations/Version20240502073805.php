<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240502073805 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, email VARCHAR(180) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) NOT NULL, company_name VARCHAR(255) NOT NULL, logo_background VARCHAR(64) NOT NULL, website LONGTEXT NOT NULL, logo_url VARCHAR(255) DEFAULT NULL, UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL (email), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE job ADD user_id INT NOT NULL, CHANGE requirements requirements JSON DEFAULT NULL, CHANGE roles roles JSON DEFAULT NULL, CHANGE created_at created_at DATETIME NOT NULL');
        $this->addSql('ALTER TABLE job ADD CONSTRAINT FK_FBD8E0F8A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_FBD8E0F8A76ED395 ON job (user_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE job DROP FOREIGN KEY FK_FBD8E0F8A76ED395');
        $this->addSql('DROP TABLE user');
        $this->addSql('DROP INDEX IDX_FBD8E0F8A76ED395 ON job');
        $this->addSql('ALTER TABLE job DROP user_id, CHANGE requirements requirements LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\', CHANGE roles roles LONGTEXT DEFAULT NULL COMMENT \'(DC2Type:array)\', CHANGE created_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL');
    }
}
