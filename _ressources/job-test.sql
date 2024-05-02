-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2024 at 09:35 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240429100350', '2024-04-29 10:21:37', 64);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` tinyint(1) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement_content` longtext COLLATE utf8mb4_unicode_ci,
  `requirements` json DEFAULT NULL,
  `role_content` longtext COLLATE utf8mb4_unicode_ci,
  `roles` json DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `apply` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `position`, `contract`, `location`, `description`, `requirement_content`, `requirements`, `role_content`, `roles`, `created_at`, `apply`, `user_id`) VALUES
(1, 'Frontend Developer', 1, 'US', 'We are looking for a skilled Frontend Developer to join our team.', 'We are seeking a candidate with expertise in HTML, CSS, and JavaScript.', '[\"HTML\", \"CSS\", \"JavaScript\"]', 'The role involves developing and maintaining user interfaces for web applications.', '[\"Develop user interfaces\", \"Optimize performance\", \"Collaborate with designers\"]', '2023-08-15 10:30:00', 'http://example.com/apply', 2),
(2, 'Backend Developer', 1, 'GB', 'We are seeking an experienced Backend Developer to work on our cutting-edge projects.', 'Candidates should have a strong background in server-side programming and database management.', '[\"PHP\", \"Python\", \"MySQL\"]', 'Responsibilities include developing server-side logic, ensuring high performance, and managing databases.', '[\"Develop server-side logic\", \"Optimize database queries\", \"Implement security measures\"]', '2023-10-20 14:45:00', 'http://example.com/apply', 0),
(3, 'Full Stack Developer', 1, 'CA', 'We are hiring a Full Stack Developer to contribute to the development of our web applications.', 'Ideal candidates should have proficiency in both frontend and backend technologies.', '[\"JavaScript\", \"Node.js\", \"React\", \"MongoDB\"]', 'The role involves designing user interactions, developing server-side logic, and ensuring responsiveness.', '[\"Design user interactions\", \"Develop server-side logic\", \"Ensure responsiveness\"]', '2023-11-05 09:15:00', 'http://example.com/apply', 0),
(4, 'UI/UX Designer', 0, 'FR', 'We are looking for a creative UI/UX Designer to join our design team and turn our software into easy-to-use products.', 'Candidates should have a strong portfolio of successful UI/UX projects and proficiency in design software.', '[\"UI design\", \"UX design\", \"Adobe XD\"]', 'Responsibilities include gathering user requirements, designing graphic elements, and building navigation components.', '[\"Gather user requirements\", \"Design graphic elements\", \"Build navigation components\"]', '2024-01-12 16:20:00', 'http://example.com/apply', 0),
(5, 'Software Engineer', 1, 'AU', 'We are seeking a talented Software Engineer to design and develop software solutions.', 'Candidates should have a strong foundation in software engineering principles and experience with programming languages.', '[\"Java\", \"C++\", \"Software development\"]', 'Responsibilities include designing algorithms, writing code, and debugging programs.', '[\"Design algorithms\", \"Write code\", \"Debug programs\"]', '2024-02-28 11:00:00', 'http://example.com/apply', 0),
(6, 'DevOps Engineer', 1, 'DE', 'We are hiring a DevOps Engineer to manage our infrastructure and deployments.', 'Ideal candidates should have experience with cloud platforms, automation tools, and CI/CD pipelines.', '[\"AWS\", \"Docker\", \"Jenkins\"]', 'Responsibilities include automating deployments, monitoring system performance, and optimizing processes.', '[\"Automate deployments\", \"Monitor performance\", \"Optimize processes\"]', '2024-03-15 13:10:00', 'http://example.com/apply', 0),
(7, 'Data Scientist', 1, 'ES', 'We are seeking a skilled Data Scientist to analyze large datasets and generate insights.', 'Candidates should have expertise in statistical analysis, machine learning algorithms, and data visualization tools.', '[\"Python\", \"Machine learning\", \"Data analysis\"]', 'Responsibilities include identifying patterns, building predictive models, and presenting findings.', '[\"Identify patterns\", \"Build predictive models\", \"Present findings\"]', '2024-04-02 09:45:00', 'http://example.com/apply', 0),
(8, 'Cybersecurity Analyst', 0, 'JP', 'We are looking for a Cybersecurity Analyst to protect our systems and networks from cyber threats.', 'Candidates should have knowledge of cybersecurity principles, risk assessment, and incident response.', '[\"Network security\", \"Risk assessment\", \"Incident response\"]', 'Responsibilities include monitoring security access, conducting vulnerability assessments, and responding to security incidents.', '[\"Monitor security access\", \"Conduct vulnerability assessments\", \"Respond to security incidents\"]', '2024-02-10 15:30:00', 'http://example.com/apply', 0),
(9, 'Mobile App Developer', 1, 'IT', 'We are hiring a Mobile App Developer to design and build mobile applications for iOS and Android platforms.', 'Ideal candidates should have experience with mobile app development frameworks and proficiency in programming languages.', '[\"Swift\", \"Kotlin\", \"Mobile app development\"]', 'Responsibilities include designing user interfaces, developing application features, and debugging code.', '[\"Design user interfaces\", \"Develop application features\", \"Debug code\"]', '2024-04-25 10:00:00', 'http://example.com/apply', 0),
(10, 'Product Manager', 1, 'NL', 'We are seeking a Product Manager to oversee the development and launch of our products.', 'Candidates should have experience in product management, market analysis, and project management.', '[\"Product management\", \"Market analysis\", \"Project management\"]', 'Responsibilities include defining product strategy, coordinating development efforts, and analyzing market trends.', '[\"Define product strategy\", \"Coordinate development efforts\", \"Analyze market trends\"]', '2024-03-30 14:00:00', 'http://example.com/apply', 0),
(11, 'Data Engineer', 1, 'US', 'We are looking for a skilled Data Engineer to build and maintain optimized data pipelines.', 'Candidates should have experience in data modeling, ETL processes, and database technologies.', '[\"SQL\", \"ETL\", \"Data modeling\"]', 'Responsibilities include designing data architectures, building data pipelines, and optimizing data workflows.', '[\"Design data architectures\", \"Build data pipelines\", \"Optimize data workflows\"]', '2023-09-10 12:00:00', 'http://example.com/apply', 0),
(12, 'Cloud Solutions Architect', 1, 'GB', 'We are seeking a Cloud Solutions Architect to design and implement scalable cloud solutions.', 'Ideal candidates should have expertise in cloud computing platforms and architecture design.', '[\"AWS\", \"Azure\", \"Google Cloud\"]', 'Responsibilities include designing cloud infrastructure, implementing cloud solutions, and optimizing performance.', '[\"Design cloud infrastructure\", \"Implement cloud solutions\", \"Optimize performance\"]', '2023-11-18 14:30:00', 'http://example.com/apply', 0),
(13, 'Machine Learning Engineer', 0, 'CA', 'We are hiring a Machine Learning Engineer to develop and deploy machine learning models.', 'Candidates should have experience in machine learning algorithms, data preprocessing, and model deployment.', '[\"Machine learning\", \"Data preprocessing\", \"Model deployment\"]', 'Responsibilities include building and training machine learning models, evaluating model performance, and deploying models into production.', '[\"Build machine learning models\", \"Evaluate model performance\", \"Deploy models into production\"]', '2024-01-22 10:45:00', 'http://example.com/apply', 0),
(14, 'Digital Marketing Specialist', 0, 'FR', 'We are looking for a Digital Marketing Specialist to develop and implement digital marketing strategies.', 'Candidates should have experience in SEO, SEM, social media marketing, and content marketing.', '[\"SEO\", \"SEM\", \"Social media marketing\"]', 'Responsibilities include planning and executing digital marketing campaigns, analyzing campaign performance, and optimizing marketing channels.', '[\"Plan digital marketing campaigns\", \"Analyze campaign performance\", \"Optimize marketing channels\"]', '2024-03-01 09:15:00', 'http://example.com/apply', 0),
(15, 'Blockchain Developer', 1, 'AU', 'We are seeking a Blockchain Developer to design and implement blockchain solutions.', 'Ideal candidates should have experience in blockchain technologies and smart contract development.', '[\"Blockchain\", \"Smart contracts\", \"Decentralized applications\"]', 'Responsibilities include developing blockchain applications, testing smart contracts, and integrating blockchain solutions into existing systems.', '[\"Develop blockchain applications\", \"Test smart contracts\", \"Integrate blockchain solutions\"]', '2024-04-05 11:30:00', 'http://example.com/apply', 0),
(16, 'UX Researcher', 1, 'DE', 'We are hiring a UX Researcher to conduct user research and provide insights for product design.', 'Candidates should have experience in qualitative and quantitative research methods, usability testing, and user interviews.', '[\"Qualitative research\", \"Quantitative research\", \"Usability testing\"]', 'Responsibilities include planning and conducting user research studies, analyzing user feedback, and providing recommendations for product improvements.', '[\"Plan user research studies\", \"Analyze user feedback\", \"Provide product recommendations\"]', '2024-01-10 13:00:00', 'http://example.com/apply', 0),
(17, 'Network Engineer', 0, 'ES', 'We are seeking a Network Engineer to design and implement network solutions.', 'Candidates should have experience in network design, configuration, and troubleshooting.', '[\"Network design\", \"Configuration\", \"Troubleshooting\"]', 'Responsibilities include designing and deploying network infrastructure, optimizing network performance, and ensuring network security.', '[\"Design network infrastructure\", \"Optimize network performance\", \"Ensure network security\"]', '2022-06-15 14:45:00', 'http://example.com/apply', 0),
(18, 'UI Developer', 1, 'JP', 'We are looking for a UI Developer to create visually appealing user interfaces.', 'Ideal candidates should have expertise in HTML, CSS, JavaScript, and UI design principles.', '[\"HTML\", \"CSS\", \"JavaScript\", \"UI design\"]', 'Responsibilities include designing and implementing user interface components, optimizing front-end performance, and ensuring cross-browser compatibility.', '[\"Design UI components\", \"Optimize front-end performance\", \"Ensure cross-browser compatibility\"]', '2024-03-20 16:30:00', 'http://example.com/apply', 0),
(19, 'AI Specialist', 1, 'IT', 'We are seeking an AI Specialist to develop and deploy artificial intelligence solutions.', 'Candidates should have experience in machine learning, natural language processing, and AI frameworks.', '[\"Machine learning\", \"Natural language processing\", \"AI frameworks\"]', 'Responsibilities include building and training AI models, integrating AI solutions into applications, and optimizing model performance.', '[\"Build AI models\", \"Integrate AI solutions\", \"Optimize model performance\"]', '2024-02-01 09:00:00', 'http://example.com/apply', 0),
(20, 'IT Project Manager', 1, 'NL', 'We are looking for an IT Project Manager to oversee IT projects from inception to completion.', 'Ideal candidates should have experience in project management methodologies, IT infrastructure, and stakeholder management.', '[\"Project management\", \"IT infrastructure\", \"Stakeholder management\"]', 'Responsibilities include defining project scope, allocating resources, and managing project timelines and budgets.', '[\"Define project scope\", \"Allocate resources\", \"Manage project timelines and budgets\"]', '2024-02-05 10:00:00', 'http://example.com/apply', 0),
(21, 'Quality Assurance Engineer', 1, 'CA', 'We are seeking a Quality Assurance Engineer to ensure the quality of our software products.', 'Candidates should have experience in manual and automated testing, test planning, and defect tracking.', '[\"Manual testing\", \"Automated testing\", \"Test planning\"]', 'Responsibilities include designing and executing test cases, identifying and documenting defects, and collaborating with development teams to resolve issues.', '[\"Design test cases\", \"Identify defects\", \"Collaborate with development teams\"]', '2024-01-15 11:30:00', 'http://example.com/apply', 0),
(22, 'Salesforce Developer', 1, 'US', 'We are hiring a Salesforce Developer to customize and maintain Salesforce solutions.', 'Ideal candidates should have experience in Salesforce development, Apex programming, and Salesforce integration.', '[\"Salesforce development\", \"Apex programming\", \"Salesforce integration\"]', 'Responsibilities include customizing Salesforce applications, developing Apex code, and integrating Salesforce with other systems.', '[\"Customize Salesforce applications\", \"Develop Apex code\", \"Integrate Salesforce with other systems\"]', '2023-01-02 12:45:00', 'http://example.com/apply', 0),
(23, 'Data Analyst', 1, 'US', 'We are looking for a Data Analyst to analyze data and generate actionable insights.', 'Candidates should have strong analytical skills, proficiency in data analysis tools, and experience with databases.', '[\"Data analysis\", \"SQL\", \"Statistics\"]', 'Responsibilities include collecting data, analyzing trends, and presenting findings to stakeholders.', '[\"Collect data\", \"Analyze trends\", \"Present findings\"]', '2023-09-10 11:30:00', 'http://example.com/apply', 0),
(24, 'Cloud Engineer', 1, 'GB', 'We are seeking a Cloud Engineer to design, implement, and manage cloud environments.', 'Ideal candidates should have experience with cloud platforms, networking, and security.', '[\"AWS\", \"Azure\", \"Networking\"]', 'Responsibilities include designing cloud architecture, implementing security measures, and optimizing performance.', '[\"Design cloud architecture\", \"Implement security measures\", \"Optimize performance\"]', '2023-10-25 09:45:00', 'http://example.com/apply', 0),
(25, 'AI/ML Engineer', 0, 'CA', 'We are hiring an AI/ML Engineer to develop machine learning models and algorithms.', 'Candidates should have expertise in machine learning frameworks, data preprocessing, and model evaluation.', '[\"TensorFlow\", \"PyTorch\", \"Machine learning algorithms\"]', 'Responsibilities include building predictive models, optimizing algorithms, and deploying solutions.', '[\"Build predictive models\", \"Optimize algorithms\", \"Deploy solutions\"]', '2023-11-12 14:15:00', 'http://example.com/apply', 0),
(26, 'Software Tester', 1, 'FR', 'We are seeking a Software Tester to ensure the quality and reliability of our software products.', 'Ideal candidates should have experience in software testing methodologies, test automation, and bug tracking tools.', '[\"Software testing\", \"Test automation\", \"Bug tracking\"]', 'Responsibilities include creating test plans, executing tests, and reporting defects.', '[\"Create test plans\", \"Execute tests\", \"Report defects\"]', '2024-01-20 10:20:00', 'http://example.com/apply', 0),
(27, 'Blockchain Developer', 0, 'AU', 'We are looking for a Blockchain Developer to design and implement blockchain solutions.', 'Candidates should have experience with blockchain platforms, smart contracts, and cryptography.', '[\"Blockchain\", \"Smart contracts\", \"Cryptography\"]', 'Responsibilities include developing blockchain applications, implementing consensus mechanisms, and ensuring security.', '[\"Develop blockchain applications\", \"Implement consensus mechanisms\", \"Ensure security\"]', '2024-02-15 12:30:00', 'http://example.com/apply', 0),
(28, 'System Administrator', 0, 'DE', 'We are seeking a System Administrator to manage and maintain our IT infrastructure.', 'Ideal candidates should have expertise in system administration, network security, and troubleshooting.', '[\"System administration\", \"Network security\", \"Troubleshooting\"]', 'Responsibilities include installing and configuring software, monitoring system performance, and resolving technical issues.', '[\"Install software\", \"Monitor performance\", \"Resolve technical issues\"]', '2024-03-01 15:45:00', 'http://example.com/apply', 0),
(29, 'UX Researcher', 1, 'ES', 'We are looking for a UX Researcher to conduct user research and provide insights for product development.', 'Candidates should have experience in qualitative and quantitative research methods, usability testing, and data analysis.', '[\"User research\", \"Usability testing\", \"Data analysis\"]', 'Responsibilities include conducting user interviews, analyzing user feedback, and creating personas.', '[\"Conduct user interviews\", \"Analyze user feedback\", \"Create personas\"]', '2024-04-05 09:00:00', 'http://example.com/apply', 0),
(30, 'Network Engineer', 1, 'JP', 'We are seeking a Network Engineer to design, implement, and maintain our network infrastructure.', 'Ideal candidates should have expertise in network protocols, routing, and switching.', '[\"Network protocols\", \"Routing\", \"Switching\"]', 'Responsibilities include designing network architecture, configuring routers and switches, and troubleshooting network issues.', '[\"Design network architecture\", \"Configure routers and switches\", \"Troubleshoot network issues\"]', '2024-04-12 11:10:00', 'http://example.com/apply', 0),
(31, 'UI Developer', 1, 'IT', 'We are hiring a UI Developer to create visually appealing and user-friendly interfaces for our applications.', 'Candidates should have expertise in HTML, CSS, JavaScript, and UI design principles.', '[\"HTML\", \"CSS\", \"JavaScript\", \"UI design\"]', 'Responsibilities include developing UI components, optimizing user experience, and ensuring cross-browser compatibility.', '[\"Develop UI components\", \"Optimize user experience\", \"Ensure cross-browser compatibility\"]', '2024-02-25 14:30:00', 'http://example.com/apply', 0),
(32, 'IT Support Specialist', 1, 'NL', 'We are seeking an IT Support Specialist to provide technical assistance and support to our employees.', 'Ideal candidates should have experience in IT support, hardware troubleshooting, and software installation.', '[\"IT support\", \"Hardware troubleshooting\", \"Software installation\"]', 'Responsibilities include diagnosing and resolving technical issues, installing and configuring software, and providing training to users.', '[\"Diagnose technical issues\", \"Install software\", \"Provide training\"]', '2024-03-10 10:45:00', 'http://example.com/apply', 0),
(33, 'Business Analyst', 0, 'IN', 'We are looking for a Business Analyst to analyze business processes and identify opportunities for improvement.', 'Candidates should have strong analytical skills, business acumen, and experience in process mapping.', '[\"Analytical skills\", \"Business acumen\", \"Process mapping\"]', 'Responsibilities include gathering business requirements, conducting data analysis, and recommending solutions to enhance efficiency.', '[\"Gather business requirements\", \"Conduct data analysis\", \"Recommend solutions\"]', '2024-04-15 09:00:00', 'http://example.com/apply', 0),
(34, 'Quality Assurance Engineer', 1, 'BR', 'We are seeking a Quality Assurance Engineer to ensure the quality of our software products.', 'Ideal candidates should have experience in manual and automated testing, test case design, and bug tracking.', '[\"Manual testing\", \"Automated testing\", \"Test case design\"]', 'Responsibilities include creating test plans, executing tests, and documenting defects.', '[\"Create test plans\", \"Execute tests\", \"Document defects\"]', '2024-04-20 13:15:00', 'http://example.com/apply', 0);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Your Company Name',
  `logo_background` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `company_name`, `logo_background`, `website`, `logo_url`) VALUES
(1, 'contact@techco.com', '[\"ROLE_ADMIN\"]', '$2y$13$2jXR8A7sniKl7hOP2vXpNupaXOsV.omYh4Fz99Bxl0ng5BaxK88um', 'TechCo', 'hsl(210, 70%, 50%)', 'https://www.techco.com', 'https://www.techco.com/logo.png'),
(2, 'info@cybernetic.com', '[\"ROLE_USER\"]', '$2y$13$PYAJPwmE2strp1ayz8Rm4.MNsL4k8aPCBDkBrWv2iQowzsS4XoCmi', 'Cybernetic Solutions', 'hsl(240, 80%, 60%)', 'https://www.cybernetic.com', 'https://www.cybernetic.com/logo.png'),
(3, 'hello@infinitech.io', '[\"ROLE_USER\"]', '$2y$13$8m.zA8Hsrwl7yS2XsmmVHOMPeyBTYvnCRabmNxDL2THFT0ABwsWKS', 'InfiniTech', 'hsl(30, 90%, 70%)', 'https://www.infinitech.io', 'https://www.infinitech.io/logo.png'),
(4, 'contact@quantumsoft.com', '[\"ROLE_USER\"]', 'quantumpass', 'QuantumSoft', 'hsl(120, 60%, 40%)', 'https://www.quantumsoft.com', 'https://www.quantumsoft.com/logo.png'),
(5, 'contact@nexgenlabs.net', '[\"ROLE_ADMIN\"]', '$2y$13$Dx8MuDr74.IMMNrFRg/Cbeo.5bqA7Yyc.cSFiCm3rIqidQsIB7XSC', 'NexGen Labs', 'hsl(300, 70%, 50%)', 'https://www.nexgenlabs.net', 'https://www.nexgenlabs.net/logo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
