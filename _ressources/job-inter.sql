-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 07, 2024 at 11:42 AM
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
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract` tinyint(1) NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `role_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created_at` datetime NOT NULL,
  `apply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `position`, `contract`, `location`, `description`, `requirement_content`, `requirements`, `role_content`, `roles`, `created_at`, `apply`, `user_id`) VALUES
(1, 'Senior Software Engineer', 1, 'GB', 'Scoot is looking for a Senior Software Engineer passionnate about building approachable, innovative and user-first experiences to join our small but growing Engineering team. You will be responsible for building and maintaining front end functionality across all of Scoot\'s applications, fostering a growing team of software engineers, and helping drive and maintain best software patterns and practices in our codebase.', 'The ideal candidate is as passionate about solving challenges through technology. They are well-versed in building proof of concepts from scratch and taking these PCS to production and scale. The right fit will have the engineering experience to build and iterate quickly and is comfortable working with product and design to set the technical strategy and roadmap.', '[\"5+ years of industry experience in a software engineering role, preferably building a SaaS product. You can demonstrate significant impact that your work has had on the product and\\/or the team.\",\"Experience with scalable distributed systems, both build from scratch as well as on AWS primitives.\",\"Extremely data-driven\",\"Ability to debug complex systems.\"]', 'We are looking for a Senior Software Engineer to join as one of our first hires. As we iterate on our MVP, you will have the opportunity to drive the vision and own the build behind our digital experience. You\'ll have the support of an experienced technical advisor, a Head of Product, and an external team to work with.', '[\"This role is for someone who is excited about the early stage - you\'ll be responsible for turning the plateform vision into reality through smart, efficient building and testing.\",\"Translate the product roadmap into engieneering requirements and own the engineering roadmap.\",\"Work with limited resources to test and learn as efficiently as possible, while laying the framework to build a more scalable product over time.\",\"Collaborate with product, design, and external engineering teamates as needed.\",\"Make the coffee\",\"Walk the dog\"]', '2023-08-15 10:30:00', 'http://example.com/apply', 2),
(2, 'Haskell and PureScript Dev', 0, 'US', 'Blogr is looking for a part-time developer to join our six-strong team of full-stack engineers. our core development values are strong, static typing and correctness, rigorous automation (in both testing and infrastructure) and everyone having a say.', 'We are looking to carefully add gread developers which care about solving problems & which have been in a relationship with Purescript and/or Haskell for at least 3 years (Not necessarily monogamous though).', '[\"You have a knack for UI design.\",\"Have Haskell or Purescript knowledge\\/hacking under your belt.\",\"An experienced engineer familiar with automated testing and deployment.\",\"Experienced with functional programming and domain-driven design or simply interested and capable of learning on the job.\"]', 'The role is more frontend-focused where you will be tasked to build browserèbased UIs for Haskell applications.', '[\"Build up our tech stack around Haskell and introduce best practices.\",\"Contribute to the design of our conversational engine and the architecture supporting it.\",\"Design new UIs, working closely with users, stake holders and the backend team.\",\"Maximize robustness, performance, and scalability of solutions.\"]', '2023-10-20 14:45:00', 'http://example.com/apply', 2),
(3, 'Midlevel Back End Engineer', 0, 'RU', 'We are looking for a Mid-level Back End Engineer to join our growing software engineering organization. The right person will help move our plateform to the next level. You(ll be working as part of a skilled, collaborative team to jointly desin and implement hight visibility applications.', 'As our ideal candidate, you have previous experience in Ruby on Rails and are eager to continue to develop professionnally. You work wwell in an agile environment, and collaborate well with other Software Engineers, Test Automation Engineers, Product Managers, and Designers. You thrive in a fasst-paced environment, and are able to adapt when needed.', '{\"1\":\"Active participation on a software development team designing, coding, testing, and releasing functionality to our customers.\",\"2\":\"Close collaboration with other engineers and product managers to become a valued member of an autonomous, cross-functional team.\",\"3\":\"operational responsibility for the services that are owned by your team, potentially including taking part in an on-call rotation.\"}', 'This is an IDEAL  job if you have already have a few years of software engineering experience under your belt, and you want to be part of a small, intensly skilled team, who feel total ownership of their work, and can\'t imagine a day without learning coding. You will play crucial role in the Vector plateform and everything you do will matter.', '[\"Design, code, deploy, and test applications according to the user stories\\/requirements and industry best practices.\",\"Follow industry standart software lifecycle process when developing software.\",\"Conduct code-review with other developers.\",\"Assist in development and peer review of plans, technical solutions, and related documentation.\"]', '2023-11-05 09:15:00', 'http://example.com/apply', 5),
(4, 'Senior Application Engineer', 1, 'JP', 'Office Lite is seeking a talented and enthusiastic Senior Application Engineer whose primary responsibility is software architecture and developent for Office Lite systems. Additional responsibilities include participation in project time/task estimation, code and architecure reviews, providing support for junior developers, documentation of system architecture and a supporting role for all phases of the development life-cycle (project definition, process mapping,  architecture, coding, acceptance testing, installation, turnover to support, etc.).', 'As a hands-on subject matter expert, you will use expert-level engineering knowledge to provide tehcnical support and help translate customer requirements into exciting new product features. You will be working within multi-disciplinary teams to create pervasive simulation solutions, advance your industry knowledge and grow the business impact.', '[\"Expert Node.js proficiency in a production environment.\",\"Proficiency in developing REST APIs\",\"Expert proficiency with relational databases (MySQL) and optimizing SQL queries\",\"Extensive experience with microservices-based architecture in production\",\"Experience with CircleCI, Jenkins or similar CI\\/CD applications\"]', 'You\'ll work alongside a skilled team of Senior Engineers across five countries participating in a system design, architecture, maintenance, and refactoring decisions. You\'ll be working on new features and integrations and be active in code reviews and coordinating engineering efforts across teams and products.', '[\"Administering and configuring software\",\"Identify opporutnity and help to implement a monitoring solution for proactive and predictable operations.\",\"Triaging problems with applictions - identifying known errors and problem trends and finding permanent solutions through root cause analysis.\",\"Providing level 2 and 3 application support.\"]', '2024-01-12 16:20:00', 'http://example.com/apply', 3),
(5, 'Remote DevOps Engineer', 0, 'JP', 'Join our dynamic team in developing Pod\'s core products and supporting infrastructure. Our software is currently written in Java, VB.net, React Native, React JS and others. You will help lead new initiatives to build and improve the testing, staging and deployment solutions. You will interact with all development teams, development leadership and our hosting/IT staff to define requirements and goals for the Dev Ops Plateform.', 'We are looking for talented and motivated engineers who can hit the ground running and take our products to the next level. The engineers who are building our plateform across the stack are always willing to go the extra mile to deliver the highest quality software and clinet experiences. Ideally, you would have:', '[\"Bachelor\'s degree preferred, strong preference for Computer Science field of study\",\"Minimum of 5 years of relevant work experience\",\"Hand\'s on experience with configuring and maintaining resources on AWS\",\"Experience and solid understanding to deploy and maintain container orchestration platforms such as ECS or Kubernetes\",\"Knowledge of networking fundamentals\",\"Expertise with cloud security, understand the principle of least privilege\",\"Strong written and verbal communication skills\"]', 'You will work closely with development teams to implement automation solutions using technologies like Amazon Web Services (AWS), Ansible, Jenkins, and Kubernetes to automatically build, test, integrate, and deploy complex, modern systems. You will leverage the full power of the cloud to configure highly resilient and scalable applications that support zero downtime. This position is open to a mid-level to senior professional depending on experience and background.', '[\"Configure and maintain resources on AWS\",\"Maintain infrastructure as code using Terraform, CloudFormation, and\\/or Ansible\",\"Responsible for production deployments using Jenkins, CodeDeploy, GitHub Actions\",\"Manage security groups and access controls\",\"Use ticket management system such as Jira and Confluence to manage work priorities\",\"Ability to clearly articulate and communicate complex technical ideas to non-DevOps colleagues\"]', '2024-02-28 11:00:00', 'http://example.com/apply', 1),
(6, 'DevOps Engineer', 1, 'DE', 'We are hiring a DevOps Engineer to manage our infrastructure and deployments.', 'Ideal candidates should have experience with cloud platforms, automation tools, and CI/CD pipelines.', '[\"AWS\", \"Docker\", \"Jenkins\"]', 'Responsibilities include automating deployments, monitoring system performance, and optimizing processes.', '[\"Automate deployments\", \"Monitor performance\", \"Optimize processes\"]', '2024-03-15 13:10:00', 'http://example.com/apply', 5),
(7, 'Data Scientist', 1, 'ES', 'We are seeking a skilled Data Scientist to analyze large datasets and generate insights.', 'Candidates should have expertise in statistical analysis, machine learning algorithms, and data visualization tools.', '[\"Python\", \"Machine learning\", \"Data analysis\"]', 'Responsibilities include identifying patterns, building predictive models, and presenting findings.', '[\"Identify patterns\", \"Build predictive models\", \"Present findings\"]', '2024-04-02 09:45:00', 'http://example.com/apply', 4),
(8, 'Cybersecurity Analyst', 0, 'JP', 'We are looking for a Cybersecurity Analyst to protect our systems and networks from cyber threats.', 'Candidates should have knowledge of cybersecurity principles, risk assessment, and incident response.', '[\"Network security\", \"Risk assessment\", \"Incident response\"]', 'Responsibilities include monitoring security access, conducting vulnerability assessments, and responding to security incidents.', '[\"Monitor security access\", \"Conduct vulnerability assessments\", \"Respond to security incidents\"]', '2024-02-10 15:30:00', 'http://example.com/apply', 26),
(9, 'Mobile App Developer', 1, 'IT', 'We are hiring a Mobile App Developer to design and build mobile applications for iOS and Android platforms.', 'Ideal candidates should have experience with mobile app development frameworks and proficiency in programming languages.', '[\"Swift\", \"Kotlin\", \"Mobile app development\"]', 'Responsibilities include designing user interfaces, developing application features, and debugging code.', '[\"Design user interfaces\", \"Develop application features\", \"Debug code\"]', '2024-04-25 10:00:00', 'http://example.com/apply', 4),
(10, 'Product Manager', 1, 'NL', 'We are seeking a Product Manager to oversee the development and launch of our products.', 'Candidates should have experience in product management, market analysis, and project management.', '[\"Product management\", \"Market analysis\", \"Project management\"]', 'Responsibilities include defining product strategy, coordinating development efforts, and analyzing market trends.', '[\"Define product strategy\", \"Coordinate development efforts\", \"Analyze market trends\"]', '2024-03-30 14:00:00', 'http://example.com/apply', 5),
(11, 'Data Engineer', 1, 'US', 'We are looking for a skilled Data Engineer to build and maintain optimized data pipelines.', 'Candidates should have experience in data modeling, ETL processes, and database technologies.', '[\"SQL\", \"ETL\", \"Data modeling\"]', 'Responsibilities include designing data architectures, building data pipelines, and optimizing data workflows.', '[\"Design data architectures\", \"Build data pipelines\", \"Optimize data workflows\"]', '2023-09-10 12:00:00', 'http://example.com/apply', 26),
(12, 'Cloud Solutions Architect', 1, 'GB', 'We are seeking a Cloud Solutions Architect to design and implement scalable cloud solutions.', 'Ideal candidates should have expertise in cloud computing platforms and architecture design.', '[\"AWS\", \"Azure\", \"Google Cloud\"]', 'Responsibilities include designing cloud infrastructure, implementing cloud solutions, and optimizing performance.', '[\"Design cloud infrastructure\", \"Implement cloud solutions\", \"Optimize performance\"]', '2023-11-18 14:30:00', 'http://example.com/apply', 4),
(13, 'Machine Learning Engineer', 0, 'CA', 'We are hiring a Machine Learning Engineer to develop and deploy machine learning models.', 'Candidates should have experience in machine learning algorithms, data preprocessing, and model deployment.', '[\"Machine learning\", \"Data preprocessing\", \"Model deployment\"]', 'Responsibilities include building and training machine learning models, evaluating model performance, and deploying models into production.', '[\"Build machine learning models\", \"Evaluate model performance\", \"Deploy models into production\"]', '2024-01-22 10:45:00', 'http://example.com/apply', 3),
(14, 'Digital Marketing Specialist', 0, 'FR', 'We are looking for a Digital Marketing Specialist to develop and implement digital marketing strategies.', 'Candidates should have experience in SEO, SEM, social media marketing, and content marketing.', '[\"SEO\", \"SEM\", \"Social media marketing\"]', 'Responsibilities include planning and executing digital marketing campaigns, analyzing campaign performance, and optimizing marketing channels.', '[\"Plan digital marketing campaigns\", \"Analyze campaign performance\", \"Optimize marketing channels\"]', '2024-03-01 09:15:00', 'http://example.com/apply', 5),
(15, 'Blockchain Developer', 1, 'AU', 'We are seeking a Blockchain Developer to design and implement blockchain solutions.', 'Ideal candidates should have experience in blockchain technologies and smart contract development.', '[\"Blockchain\", \"Smart contracts\", \"Decentralized applications\"]', 'Responsibilities include developing blockchain applications, testing smart contracts, and integrating blockchain solutions into existing systems.', '[\"Develop blockchain applications\", \"Test smart contracts\", \"Integrate blockchain solutions\"]', '2024-04-05 11:30:00', 'http://example.com/apply', 3),
(16, 'UX Researcher', 1, 'DE', 'We are hiring a UX Researcher to conduct user research and provide insights for product design.', 'Candidates should have experience in qualitative and quantitative research methods, usability testing, and user interviews.', '[\"Qualitative research\", \"Quantitative research\", \"Usability testing\"]', 'Responsibilities include planning and conducting user research studies, analyzing user feedback, and providing recommendations for product improvements.', '[\"Plan user research studies\", \"Analyze user feedback\", \"Provide product recommendations\"]', '2024-01-10 13:00:00', 'http://example.com/apply', 1),
(17, 'Network Engineer', 0, 'ES', 'We are seeking a Network Engineer to design and implement network solutions.', 'Candidates should have experience in network design, configuration, and troubleshooting.', '[\"Network design\", \"Configuration\", \"Troubleshooting\"]', 'Responsibilities include designing and deploying network infrastructure, optimizing network performance, and ensuring network security.', '[\"Design network infrastructure\", \"Optimize network performance\", \"Ensure network security\"]', '2022-06-15 14:45:00', 'http://example.com/apply', 2),
(18, 'UI Developer', 1, 'JP', 'We are looking for a UI Developer to create visually appealing user interfaces.', 'Ideal candidates should have expertise in HTML, CSS, JavaScript, and UI design principles.', '[\"HTML\", \"CSS\", \"JavaScript\", \"UI design\"]', 'Responsibilities include designing and implementing user interface components, optimizing front-end performance, and ensuring cross-browser compatibility.', '[\"Design UI components\", \"Optimize front-end performance\", \"Ensure cross-browser compatibility\"]', '2024-03-20 16:30:00', 'http://example.com/apply', 26),
(19, 'AI Specialist', 1, 'IT', 'We are seeking an AI Specialist to develop and deploy artificial intelligence solutions.', 'Candidates should have experience in machine learning, natural language processing, and AI frameworks.', '[\"Machine learning\", \"Natural language processing\", \"AI frameworks\"]', 'Responsibilities include building and training AI models, integrating AI solutions into applications, and optimizing model performance.', '[\"Build AI models\", \"Integrate AI solutions\", \"Optimize model performance\"]', '2024-02-01 09:00:00', 'http://example.com/apply', 1),
(20, 'IT Project Manager', 1, 'NL', 'We are looking for an IT Project Manager to oversee IT projects from inception to completion.', 'Ideal candidates should have experience in project management methodologies, IT infrastructure, and stakeholder management.', '[\"Project management\", \"IT infrastructure\", \"Stakeholder management\"]', 'Responsibilities include defining project scope, allocating resources, and managing project timelines and budgets.', '[\"Define project scope\", \"Allocate resources\", \"Manage project timelines and budgets\"]', '2024-02-05 10:00:00', 'http://example.com/apply', 3),
(21, 'Quality Assurance Engineer', 1, 'CA', 'We are seeking a Quality Assurance Engineer to ensure the quality of our software products.', 'Candidates should have experience in manual and automated testing, test planning, and defect tracking.', '[\"Manual testing\", \"Automated testing\", \"Test planning\"]', 'Responsibilities include designing and executing test cases, identifying and documenting defects, and collaborating with development teams to resolve issues.', '[\"Design test cases\", \"Identify defects\", \"Collaborate with development teams\"]', '2024-01-15 11:30:00', 'http://example.com/apply', 5),
(22, 'Salesforce Developer', 1, 'US', 'We are hiring a Salesforce Developer to customize and maintain Salesforce solutions.', 'Ideal candidates should have experience in Salesforce development, Apex programming, and Salesforce integration.', '[\"Salesforce development\", \"Apex programming\", \"Salesforce integration\"]', 'Responsibilities include customizing Salesforce applications, developing Apex code, and integrating Salesforce with other systems.', '[\"Customize Salesforce applications\", \"Develop Apex code\", \"Integrate Salesforce with other systems\"]', '2023-01-02 12:45:00', 'http://example.com/apply', 3),
(23, 'Data Analyst', 1, 'US', 'We are looking for a Data Analyst to analyze data and generate actionable insights.', 'Candidates should have strong analytical skills, proficiency in data analysis tools, and experience with databases.', '[\"Data analysis\", \"SQL\", \"Statistics\"]', 'Responsibilities include collecting data, analyzing trends, and presenting findings to stakeholders.', '[\"Collect data\", \"Analyze trends\", \"Present findings\"]', '2023-09-10 11:30:00', 'http://example.com/apply', 2),
(24, 'Cloud Engineer', 1, 'GB', 'We are seeking a Cloud Engineer to design, implement, and manage cloud environments.', 'Ideal candidates should have experience with cloud platforms, networking, and security.', '[\"AWS\", \"Azure\", \"Networking\"]', 'Responsibilities include designing cloud architecture, implementing security measures, and optimizing performance.', '[\"Design cloud architecture\", \"Implement security measures\", \"Optimize performance\"]', '2023-10-25 09:45:00', 'http://example.com/apply', 5),
(25, 'AI/ML Engineer', 0, 'CA', 'We are hiring an AI/ML Engineer to develop machine learning models and algorithms.', 'Candidates should have expertise in machine learning frameworks, data preprocessing, and model evaluation.', '[\"TensorFlow\", \"PyTorch\", \"Machine learning algorithms\"]', 'Responsibilities include building predictive models, optimizing algorithms, and deploying solutions.', '[\"Build predictive models\", \"Optimize algorithms\", \"Deploy solutions\"]', '2023-11-12 14:15:00', 'http://example.com/apply', 3),
(26, 'Software Tester', 1, 'FR', 'We are seeking a Software Tester to ensure the quality and reliability of our software products.', 'Ideal candidates should have experience in software testing methodologies, test automation, and bug tracking tools.', '[\"Software testing\", \"Test automation\", \"Bug tracking\"]', 'Responsibilities include creating test plans, executing tests, and reporting defects.', '[\"Create test plans\", \"Execute tests\", \"Report defects\"]', '2024-01-20 10:20:00', 'http://example.com/apply', 3),
(27, 'Blockchain Developer', 0, 'AU', 'We are looking for a Blockchain Developer to design and implement blockchain solutions.', 'Candidates should have experience with blockchain platforms, smart contracts, and cryptography.', '[\"Blockchain\", \"Smart contracts\", \"Cryptography\"]', 'Responsibilities include developing blockchain applications, implementing consensus mechanisms, and ensuring security.', '[\"Develop blockchain applications\", \"Implement consensus mechanisms\", \"Ensure security\"]', '2024-02-15 12:30:00', 'http://example.com/apply', 2),
(28, 'System Administrator', 0, 'DE', 'We are seeking a System Administrator to manage and maintain our IT infrastructure.', 'Ideal candidates should have expertise in system administration, network security, and troubleshooting.', '[\"System administration\", \"Network security\", \"Troubleshooting\"]', 'Responsibilities include installing and configuring software, monitoring system performance, and resolving technical issues.', '[\"Install software\", \"Monitor performance\", \"Resolve technical issues\"]', '2024-03-01 15:45:00', 'http://example.com/apply', 1),
(29, 'UX Researcher', 1, 'ES', 'We are looking for a UX Researcher to conduct user research and provide insights for product development.', 'Candidates should have experience in qualitative and quantitative research methods, usability testing, and data analysis.', '[\"User research\", \"Usability testing\", \"Data analysis\"]', 'Responsibilities include conducting user interviews, analyzing user feedback, and creating personas.', '[\"Conduct user interviews\", \"Analyze user feedback\", \"Create personas\"]', '2024-04-05 09:00:00', 'http://example.com/apply', 3),
(30, 'Network Engineer', 1, 'JP', 'We are seeking a Network Engineer to design, implement, and maintain our network infrastructure.', 'Ideal candidates should have expertise in network protocols, routing, and switching.', '[\"Network protocols\", \"Routing\", \"Switching\"]', 'Responsibilities include designing network architecture, configuring routers and switches, and troubleshooting network issues.', '[\"Design network architecture\", \"Configure routers and switches\", \"Troubleshoot network issues\"]', '2024-04-12 11:10:00', 'http://example.com/apply', 4),
(31, 'UI Developer', 1, 'IT', 'We are hiring a UI Developer to create visually appealing and user-friendly interfaces for our applications.', 'Candidates should have expertise in HTML, CSS, JavaScript, and UI design principles.', '[\"HTML\", \"CSS\", \"JavaScript\", \"UI design\"]', 'Responsibilities include developing UI components, optimizing user experience, and ensuring cross-browser compatibility.', '[\"Develop UI components\", \"Optimize user experience\", \"Ensure cross-browser compatibility\"]', '2024-02-25 14:30:00', 'http://example.com/apply', 4),
(32, 'IT Support Specialist', 1, 'NL', 'We are seeking an IT Support Specialist to provide technical assistance and support to our employees.', 'Ideal candidates should have experience in IT support, hardware troubleshooting, and software installation.', '[\"IT support\", \"Hardware troubleshooting\", \"Software installation\"]', 'Responsibilities include diagnosing and resolving technical issues, installing and configuring software, and providing training to users.', '[\"Diagnose technical issues\", \"Install software\", \"Provide training\"]', '2024-03-10 10:45:00', 'http://example.com/apply', 1),
(33, 'Business Analyst', 0, 'IN', 'We are looking for a Business Analyst to analyze business processes and identify opportunities for improvement.', 'Candidates should have strong analytical skills, business acumen, and experience in process mapping.', '[\"Analytical skills\", \"Business acumen\", \"Process mapping\"]', 'Responsibilities include gathering business requirements, conducting data analysis, and recommending solutions to enhance efficiency.', '[\"Gather business requirements\", \"Conduct data analysis\", \"Recommend solutions\"]', '2024-04-15 09:00:00', 'http://example.com/apply', 4),
(34, 'Quality Assurance Engineer', 1, 'BR', 'We are seeking a Quality Assurance Engineer to ensure the quality of our software products.', 'Ideal candidates should have experience in manual and automated testing, test case design, and bug tracking.', '[\"Manual testing\", \"Automated testing\", \"Test case design\"]', 'Responsibilities include creating test plans, executing tests, and documenting defects.', '[\"Create test plans\", \"Execute tests\", \"Document defects\"]', '2024-04-20 13:15:00', 'http://example.com/apply', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F8A76ED395` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;