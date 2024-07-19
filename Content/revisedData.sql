CREATE DATABASE  IF NOT EXISTS `react_crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `react_crud`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: react_crud
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billinghistories`
--

DROP TABLE IF EXISTS `billinghistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billinghistories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `renewaldate` datetime NOT NULL,
  `expirydate` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinghistories`
--

LOCK TABLES `billinghistories` WRITE;
/*!40000 ALTER TABLE `billinghistories` DISABLE KEYS */;
/*!40000 ALTER TABLE `billinghistories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerid` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `clienttype` varchar(255) DEFAULT NULL,
  `billingdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `amount_patients` int NOT NULL,
  `amount_suitable_overflow` int NOT NULL,
  `duration_time` time DEFAULT NULL,
  `color` int NOT NULL,
  `deleted` int NOT NULL DEFAULT '0',
  `fk_license` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (6,'sergiy','sergiy',3,3,'17:14:00',4,3,'asdf'),(7,'customer','customer',21,1,'17:22:00',2,1,'dafadf');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (8,'6'),(9,'7'),(10,'8'),(11,'9'),(12,'10'),(13,'11'),(14,'12');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents`
--

LOCK TABLES `contents` WRITE;
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` VALUES (1,'K-12 VR',1),(2,'Enterprise VR',2),(3,'Higher Ed VR',3);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `usercount` int NOT NULL,
  `devicecount` int NOT NULL,
  `gstin` text,
  `licensestartdate` datetime DEFAULT NULL,
  `licenseEnddate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deviceid` varchar(255) NOT NULL,
  `customerid` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprises`
--

DROP TABLE IF EXISTS `enterprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprises` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `enterprises_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprises`
--

LOCK TABLES `enterprises` WRITE;
/*!40000 ALTER TABLE `enterprises` DISABLE KEYS */;
INSERT INTO `enterprises` VALUES (1,2,'Safety Procedures','Simulate hazardous scenarios to train employees on safety protocols.'),(2,2,'Customer Service Skills','Practice handling different customer interactions in a virtual environment.'),(3,2,'Product Demonstrations','Showcase products and features in a realistic setting for sales teams.'),(4,2,'Team Collaboration','Foster teamwork and communication skills through collaborative VR tasks.'),(5,2,'Conflict Resolution','Practice resolving conflicts with coworkers or clients in a controlled environment.'),(6,2,'Cybersecurity Awareness','Train employees to identify and respond to cybersecurity threats.'),(7,2,'Public Speaking','Overcome stage fright and improve presentation skills through VR public speaking simulations.'),(8,2,'Supply Chain Management','Simulate the supply chain process to train logistics and procurement teams.'),(9,2,'Crisis Management','Simulate crisis situations to train employees on emergency response protocols.'),(10,2,'Diversity and Inclusion Training','Promote diversity and inclusion awareness through immersive scenarios.'),(11,2,'Language Training','Practice foreign language skills in realistic conversational scenarios.'),(12,2,'Project Management','Manage virtual projects from conception to completion to hone project management skills.'),(13,2,'Environmental Sustainability','Raise awareness about environmental issues and sustainable practices.'),(14,2,'Remote Work Skills','Prepare employees for remote work environments through virtual collaboration tasks.'),(15,2,'Human Resources Training','Train HR professionals on recruitment, onboarding, and employee relations.'),(16,2,'Brand Management','Teach employees to uphold and promote brand values through various scenarios.'),(17,2,'Regulatory Compliance','Ensure employees understand and adhere to industry regulations and compliance standards.'),(18,2,'Assembly Line Simulation','Train employees on the assembly process of complex machinery or products in a simulated environment.'),(19,2,'Quality Control Inspection','Simulate various defects and anomalies in products to train quality control inspectors.'),(20,2,'Machine Operation and Maintenance','Teach operators how to operate and maintain machinery safely and efficiently.'),(21,2,'Safety Procedures Training','Simulate hazardous scenarios to train employees on safety protocols and emergency procedures.'),(22,2,'Equipment Troubleshooting','Train technicians to diagnose and troubleshoot equipment failures in a virtual environment.'),(23,2,'Lean Manufacturing Principles','Simulate lean manufacturing processes to train employees on waste reduction and efficiency improvement techniques.'),(24,2,'Environmental Compliance Training','Simulate environmental hazards and train employees on compliance regulations and procedures.'),(25,2,'Emergency Response Training','Simulate emergency scenarios like cardiac arrest or trauma to train healthcare providers in rapid response and life-saving techniques.'),(26,2,'CNC Machine Operations and Maintenance','This module focuses on training employees in the operation and maintenance of CNC (Computer Numerical Control) machines.'),(27,2,'Broiler Usage and Safety Training','This module provides comprehensive training on the usage and safety protocols of broilers used in manufacturing processes.');
/*!40000 ALTER TABLE `enterprises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `higher_eds`
--

DROP TABLE IF EXISTS `higher_eds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `higher_eds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `higher_eds_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `higher_eds`
--

LOCK TABLES `higher_eds` WRITE;
/*!40000 ALTER TABLE `higher_eds` DISABLE KEYS */;
INSERT INTO `higher_eds` VALUES (1,3,'Hospitality','Virtual Hotel Management Simulation','HEd1.png'),(2,3,'Hospitality','Customer Service Excellence in Hospitality','HEd2.png'),(3,3,'Hospitality','Event Management in Virtual Environments','HEd3.png'),(4,3,'Hospitality','Front Desk Operations and Guest Relations','HEd4.png'),(5,3,'Nursing','Patient Care and Communication in VR','HEd5.png'),(6,3,'Nursing','Anatomy and Physiology VR Lab','HEd6.png'),(7,3,'Nursing','Medical Emergency Response Training','HEd7.png'),(8,3,'Computer Science','Virtual Programming Environments (Python, Java, etc.)','HEd8.png'),(9,3,'Computer Science','Cybersecurity Training and Simulations','HEd9.png'),(10,3,'Computer Science','Artificial Intelligence and Machine Learning Demonstrations','HEd10.png'),(11,3,'Computer Science','Virtual Reality Development Workshop','HEd11.png'),(12,3,'Computer Science','Database Management Systems in Virtual Environments','HEd12.png'),(13,3,'Engineering','Civil Engineering: Virtual Construction Site Management','HEd13.png'),(14,3,'Engineering','Mechanical Engineering: CAD Modeling and Simulation','HEd14.png'),(15,3,'Engineering','Electrical Engineering: Circuit Design and Analysis in VR','HEd15.png'),(16,3,'Engineering','Chemical Engineering: Process Simulation and Safety Training','HEd16.png'),(17,3,'Engineering','Aerospace Engineering: Flight Simulations and Aircraft Design','HEd17.png'),(18,3,'Business Management','Virtual Business Strategy Simulations','HEd18.png'),(19,3,'Business Management','Leadership and Team Management Training','HEd19.png'),(20,3,'Business Management','Marketing Campaign Planning in VR','HEd20.png'),(21,3,'Business Management','Supply Chain Management in Virtual Environments','HEd21.png'),(22,3,'Art and Design','3D Modeling and Sculpting in Virtual Reality','HEd22.png'),(23,3,'Art and Design','Virtual Art Gallery Creation and Curation','HEd23.png'),(24,3,'Art and Design','Animation Production in Virtual Studios','HEd24.png'),(25,3,'Health Sciences','Medical Diagnosis and Treatment Planning in VR','HEd25.png'),(26,3,'Health Sciences','Physical Therapy and Rehabilitation Exercises','HEd26.png'),(27,3,'Health Sciences','Virtual Classroom Teaching and Pedagogy Practice','HEd27.png'),(28,3,'Education and Training','Language Learning and Cultural Immersion in VR','HEd28.png'),(29,3,'Education and Training','Educational Leadership and Administration Training Scenarios','HEd29.png'),(30,3,'Physics','Quantum Mechanics Visualization','HEd30.png'),(31,3,'Physics','Astrophysics Simulations','HEd31.png'),(32,3,'Physics','Thermodynamics Experiments','HEd32.png');
/*!40000 ALTER TABLE `higher_eds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `k12s`
--

DROP TABLE IF EXISTS `k12s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `k12s` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `grade` int NOT NULL,
  `subjectName` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `k12s_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `k12s`
--

LOCK TABLES `k12s` WRITE;
/*!40000 ALTER TABLE `k12s` DISABLE KEYS */;
INSERT INTO `k12s` VALUES (19,1,6,'Science','Getting To Know Plants','Leaf Structure of Leaf','AddingLikeFraction.png'),(20,1,6,'Science','Light, Shadows And Reflections','Transparent, Opaque and Translucent Objects','3DShapes.png'),(21,1,6,'Science','Electricity And Circuits','Electric Conductors Conductors and Insulators','Area of Parallelograms.png'),(22,1,6,'Science','Getting To Know Plants','Introduction Parts of a Plant','Area of Parallelograms.png'),(23,1,6,'Science','Getting To Know Plants','Flower Reproductive Parts of Flower','AreaofTriangle.png'),(24,1,6,'Science','Body Movements','Human Body and Its The Human Skeletal System','Atoms.png'),(25,1,6,'Mathematics','Basic Geometrical Ideas','A Line Lines','butterflyLifecycle.png'),(26,1,6,'Mathematics','Data Handling','Pictograph Pictogram','ConductorNInsulator.png'),(27,1,6,'Mathematics','Fractions','Addition and Subtraction of Subtract like fractions','Copy of DIgestiveSystem.png'),(28,1,6,'Mathematics','Data Handling','A Bar Graph Bar Graph','cubevolume.png'),(29,1,6,'Mathematics','Symmetry','Making Symmetric Figures : Ink- Line and Plane of Symmetry','decible.png'),(30,1,6,'Mathematics','UNDERSTANDING ELEMENTARY SHAPES','Three Dimensional Shapes Three Dimensional Geometric Figures','DIgestiveSystem.png'),(31,1,6,'Mathematics','Data Handling','Drawing a Pictograph Pictogram','Distance-Time Graph.png'),(32,1,7,'Science','Nutrition in Plants','Photosynthesis ” Food Making Process In Plants Photosynthesis in green plants','Factors Affecting Friction.png'),(33,1,7,'Science','Nutrition in Animals','Digestion In Humans Parts of Digestive System','FlowerReproductive.png'),(34,1,7,'Science','Light','Light Travels Along a Straight Line Travelling of Light','Force and Effects of Force.png'),(35,1,7,'Science','Motion and Time','Speed Speed','frictioncauses.png'),(36,1,7,'Science','Transportation in Animals and Plants','The Human Heart','FroglyLifecycle.png'),(37,1,7,'Science','Transportation in Animals and Plants','Types of Human Blood Vessels','AddingLikeFraction.png'),(38,1,7,'Science','Transportation in Animals and Plants','Blood Flow in the Human Heart','3DShapes.png'),(39,1,7,'Science','Reproduction in Plants','Sexual Reproduction Sexual Reproduction in Plants',''),(40,1,7,'Science','Motion and Time','Distance-Time Graph Distance-Time Graph for Uniform Motion',''),(41,1,7,'Mathematics','Perimeter and Area','Area of a Triangle Area of Triangle',''),(42,1,7,'Mathematics','The triangle and its Properties','Right-Angled Triangles and Pythagoras Property Pythagorean Theorem',''),(43,1,7,'Mathematics','The triangle and its Properties','Right-Angled Triangles and Pythagoras Property Use of pythagoras theorem',''),(44,1,8,'Science','Force And Pressure','Force A Push or a Pull Force and Effects of Forces',''),(45,1,8,'Science','Friction','Factors affecting Friction Factors Affecting Friction',''),(46,1,8,'Science','Sound','Sound is Produced by a Vibrating Making Sound',''),(47,1,8,'Science','Cell ” Structure And Functions','Parts of the Nucleus',''),(48,1,8,'Science','Reproduction In Animals','Sexual Life Cycle of Butterfly',''),(49,1,8,'Science','Reproduction In Animals','Sexual Life Cycle of Frog',''),(50,1,8,'Science','Force And Pressure','A Force can Change the Force and Effects of Forces',''),(51,1,8,'Science','Friction','Force of Friction Friction and its Causes',''),(52,1,8,'Science','Sound','Sound Produced by Humans Vibrations and Sound',''),(53,1,8,'Science','Sound','Amplitude, Time Period And Pitch',''),(54,1,8,'Science','Sound','Amplitude, Time Period And The Decibel Scale',''),(55,1,8,'Mathematics','DATA HANDLING','Circle Graph or Pie Pie chart',''),(56,1,8,'Mathematics','MENSURATION','Surface Area of Cube, Cuboid and Cylinder Volume and surface area of cube and cuboid',''),(57,1,8,'Mathematics','MENSURATION','Volume of Cube, Cuboid and Cylinder Volume and surface area of cube and cuboid',''),(58,1,9,'Mathematics','QUADRILATERALS','Another Condition for a Quadrilateral to be a Parallelogram Parallelograms',''),(59,1,9,'Mathematics','AREAS OF PARALLELOGRAMS AND TRIANGLES','Figures on the Same Base and Between the Same Parallels Area of Parallelograms and Triangles',''),(60,1,9,'Science','Atoms And Molecules','What is an Atom? The Atom',''),(61,1,9,'Science','Atoms And Molecules','What is a Molecule? The Molecules',''),(62,1,9,'Science','Structure of the Atom','The Structure of an Rutherford ™s Atomic Model',''),(63,1,9,'Science','Diversity in Living Organisms','The Hierarchy of Classification- Groups Paramecium',''),(64,1,9,'Science','Force and Laws of Motion','First Law of Newton\'s First Law of Motion',''),(65,1,9,'Science','Force and Laws of Motion','Inertia and Mass Newton\'s First Law',''),(66,1,9,'Science','Gravitation','Gravitation Gravity',''),(67,1,9,'Science','Gravitation','Archimedes ™ Principle Archimedes Principle',''),(68,1,9,'Science','Work and Energy','Work Work',''),(69,1,9,'Science','Work and Energy','Energy Introduction to Energy and',''),(70,1,9,'Science','Sound','Propagation of Sound Sound Waves',''),(71,1,9,'Science','Sound','Applications of Ultrasound Ultrasound-Sonar',''),(72,1,9,'Science','Structure of the Atom','The Structure of an Atomic Models',''),(73,1,9,'Science','Sound','Production of Sound Sound Needs a Medium to',''),(74,1,9,'Mathematics','PAIR OF LINEAR EQUATIONS IN TWO VARIABLES','Graphical Method of Solution Solving System of Equations in Two Variables',''),(75,1,10,'Mathematics','TRIANGLES','Similarity of Triangles Similarity of Triangles',''),(76,1,10,'Mathematics','SOME APPLICATIONS OF TRIGONOMETRY','Heights and Distances Application of Trigonometry',''),(77,1,10,'Mathematics','SURFACE AREAS AND VOLUMES','Volume and Surface Area of',''),(78,1,10,'Mathematics','PROBABILITY','Probability ” A Theoretical Probability',''),(79,1,10,'Science','Life Processes','Nutrition Digestive System',''),(80,1,10,'Science','Life Processes','Respiration Cellular Respiration',''),(81,1,10,'Science','Life Processes','Transportation Blood Vessels',''),(82,1,10,'Science','How do Organisms Reproduce?','Do Organisms Create Exact Copies of Themselves? How DNA Replicates',''),(83,1,10,'Science','Magnetic Effects of Electric Current','Electromagnetic Induction Faraday\'s Law of Electromagnetic Induction',''),(84,1,10,'Science','Magnetic Effects of Electric Current','Electric Electric Generator',''),(85,1,10,'Science','Life Processes','Respiration The Human Respiratory System',''),(86,1,10,'Science','Life Processes','Transportation Blood Flow through the Heart',''),(87,1,11,'Physics','Motion in a Straight Line','Relative Velocity Relative motion',''),(88,1,11,'Physics','Waves','The speed of a travelling wave The Speed of Sound',''),(89,1,11,'Chemistry','Structure of Atom','Quantum Mechanical Aufbau Principle',''),(90,1,11,'Chemistry','Equilibrium','Ionization of Acids and Bases pH of a Solution',''),(91,1,11,'Biology','Human Physiology','Neural Control and Coordination Central Neural System Human brain',''),(92,1,11,'Biology','Human Physiology','Neural Control and Coordination Sensory Reception and Eye',''),(93,1,11,'Biology','Human Physiology','Neural Control and Coordination Sensory Reception and Ear',''),(94,1,11,'Biology','Human Physiology','Breathing and Exchange of Gases Respiratory Organs Anatomy of Respiratory System',''),(95,1,11,'Biology','Diversity in The Living World','The Living World Taxonomical Aids Dichotomous Keys',''),(96,1,11,'Mathematics','SETS','Operation on sets Venn Diagram',''),(97,1,11,'Mathematics','INTRODUCTION TO THREE DIMENSIONAL GEOMETRY','Coordinate Axes and Coordinate Planes in Three Introduction to 3d Coordinate plane',''),(98,1,11,'Mathematics','PERMUTATIONS AND COMBINATIONS','Fundamental Principle of Counting Fundamental principle of counting',''),(99,1,11,'Mathematics','SETS','Operation on sets Sets',''),(100,1,11,'Mathematics','CONIC SECTIONS','Ellipse Ellipse',''),(101,1,12,'Physics','Magnetism and Matter','Permanent Magnets and Electromagnets Electromagnet',''),(102,1,12,'Physics','Magnetism and Matter','Magnetic Properties of Materials Magnetic Domain',''),(103,1,12,'Chemistry','Solutions','Types of Solutions Types of solutions',''),(104,1,12,'Chemistry','Solutions','Colligative Properties and Determination of Molar Mass Boiling Point Elevation',''),(105,1,12,'Chemistry','The Solid State','Electrical Properties Semiconductors',''),(106,1,12,'Chemistry','Chemical Kinetics','Factors Influencing Rate of a Reaction Concentration, Pressure and Reaction Rates',''),(107,1,12,'Biology','Reproduction','Human Reproduction Structure of sperm',''),(108,1,12,'Biology','Genetics and Evolution','Molecular Basis of Inheritance The DNA Structure of DNA',''),(109,1,12,'Biology','Ecology','Ecosystem Ecological Pyramids Ecological pyramid',''),(110,1,12,'Biology','Biotechnology','Biotechnology and its Applications Biotechnological Applications Genetic Engineering',''),(111,1,12,'Mathematics','VECTOR ALGEBRA','Addition of Vectors Introduction to Vectors',''),(112,1,12,'Mathematics','MATRICES','Types of Matrices Matrices',''),(113,1,12,'Mathematics','PROBABILITY','Random Variables and its Probability Distributions Waiting time distribution',''),(114,1,12,'Mathematics','RELATIONS AND FUNCTIONS','Composition of Functions and Invertible Composite Functions',''),(115,1,12,'Mathematics','PROBABILITY','Independent Events Probability of dependent and independent event','');
/*!40000 ALTER TABLE `k12s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `fk_user` varchar(25) NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fixed_time` float(4,2) NOT NULL DEFAULT '1.00',
  `all_markers` int NOT NULL DEFAULT '1',
  `agenda_interval` int NOT NULL DEFAULT '30',
  `agenda_start` time NOT NULL DEFAULT '00:00:01',
  `agenda_ending` time NOT NULL DEFAULT '23:59:59',
  `reminder_msg_event` varchar(400) DEFAULT ' ',
  `cat_color_active` int NOT NULL DEFAULT '1',
  `locked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (7,'sergiy','sergiy','2020-10-15 22:31:09','2020-10-25 00:00:00',2.00,1,1,'17:33:00','17:34:00','adf',1,1);
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `countrycode` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `regionname` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `action` int NOT NULL,
  `action_type` int NOT NULL,
  `action_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (0,1,1,1,'2020-10-02 04:57:21');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `CPF` varchar(70) DEFAULT NULL,
  `gender` int NOT NULL DEFAULT '0',
  `birthday` date NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `occupation` varchar(100) NOT NULL,
  `comments` text,
  `picture` mediumblob,
  `fk_license` varchar(25) NOT NULL,
  `deleted` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_1` (`fk_license`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (8,'new','CPF',1,'2024-04-03','n@n.com','sdfds',NULL,'','sdf',2);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `contentid` varchar(255) DEFAULT NULL,
  `license` tinyint(1) DEFAULT NULL,
  `customerid` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` int DEFAULT NULL,
  `description` text,
  `published` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professionals`
--

DROP TABLE IF EXISTS `professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professionals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `gender` int NOT NULL DEFAULT '0',
  `birthday` date NOT NULL,
  `email` varchar(80) NOT NULL,
  `comment` text,
  `picture` varchar(200) DEFAULT NULL,
  `deleted` int NOT NULL,
  `fk_license` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionals`
--

LOCK TABLES `professionals` WRITE;
/*!40000 ALTER TABLE `professionals` DISABLE KEYS */;
INSERT INTO `professionals` VALUES (51,'sergiy',1,'2020-10-14','customer@admin.com','asdf','',2,'adf'),(52,'customer',2,'2020-10-15','aaa@gmail.com','sdf','',1,'adf');
/*!40000 ALTER TABLE `professionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (4,'ROLE_TESTER'),(5,'ROLE_TARGET_VIEW'),(6,'ROLE_TARGET_EDIT'),(7,'ROLE_TARGET_VIEW_DATA'),(8,'ROLE_PROF_VIEW'),(9,'ROLE_PROF_EDIT'),(10,'ROLE_PROF_VIEW_DATA'),(11,'ROLE_CAT_VIEW'),(12,'ROLE_CAT_EDIT'),(13,'ROLE_ROOM_VIEW'),(14,'ROLE_ROOM_EDIT'),(15,'ROLE_LOG_VIEW'),(16,'ROLE_EVENT_VIEW'),(17,'ROLE_EVENT_EDIT'),(18,'ROLE_EVENT_EDIT_RECEPTION'),(19,'ROLE_EVENT_EDIT_FINANCIAL'),(20,'ROLE_EVENT_EDIT_PROF'),(21,'ROLE_USER_VIEW'),(22,'ROLE_USER_EDIT'),(23,'ROLE_LIC_VIEW'),(24,'ROLE_LIC_EDIT'),(25,'ROLE_LIC_SYSADMIN'),(26,'ROLE_REPORT_VIEW'),(27,'ROLE_AGENDA_VIEW'),(28,'ROLE_LIC_OWN'),(29,'ROLE_AGENDA_EDIT'),(30,'ROLE_MIGRATION');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(200) NOT NULL,
  `lt_device_login` varchar(100) NOT NULL,
  `lt_content` varchar(100) NOT NULL,
  `duration` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (8,'Rohit','6','17/04/2024','Cartoon','100hrs'),(9,'PVT','6','15/04/2024','Maths','10hrs');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectlinks`
--

DROP TABLE IF EXISTS `subjectlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectlinks` (
  `subject_name` varchar(255) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectlinks`
--

LOCK TABLES `subjectlinks` WRITE;
/*!40000 ALTER TABLE `subjectlinks` DISABLE KEYS */;
INSERT INTO `subjectlinks` VALUES ('Mathematics',1),('Science',2),('Physics',3),('Chemistry',4),('Biology',5);
/*!40000 ALTER TABLE `subjectlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  `subjects` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_usergroup_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
INSERT INTO `usergroup` VALUES (1,'admin'),(46,'customer'),(50,'Student'),(49,'supplier');
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup_role`
--

DROP TABLE IF EXISTS `usergroup_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroup_role` (
  `usergroup_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`usergroup_id`,`role_id`),
  KEY `fk_usergrouprole_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup_role`
--

LOCK TABLES `usergroup_role` WRITE;
/*!40000 ALTER TABLE `usergroup_role` DISABLE KEYS */;
INSERT INTO `usergroup_role` VALUES (1,4),(1,5),(49,5),(1,6),(1,7),(49,7),(1,8),(46,8),(1,9),(46,9),(1,10),(46,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(50,27),(1,28),(1,29),(46,30);
/*!40000 ALTER TABLE `usergroup_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlicenses`
--

DROP TABLE IF EXISTS `userlicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlicenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `used` int DEFAULT NULL,
  `unused` int DEFAULT NULL,
  `customerid` int NOT NULL,
  `customername` varchar(255) NOT NULL,
  `licensestartdate` datetime DEFAULT NULL,
  `licenseEnddate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `userlicenses_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlicenses`
--

LOCK TABLES `userlicenses` WRITE;
/*!40000 ALTER TABLE `userlicenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `initcode` varchar(250) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int NOT NULL DEFAULT '1',
  `master` int DEFAULT '0',
  `active` tinyint(1) DEFAULT '0',
  `fk_professional` varchar(25) DEFAULT NULL,
  `fk_license` varchar(25) DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `creation_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin@admin.com','$2a$12$Nm4ykoMuUfrm4yedvaCrR.x755UX0gizWdEK7UP6cFQUKpPcCdSem','asdfasdf','adsf','2020-12-01',1,1,NULL,'adf','adf',0,'2020-10-16 04:43:13'),(30,'customer','customer','customer@admin.com','$2a$12$Nm4ykoMuUfrm4yedvaCrR.x755UX0gizWdEK7UP6cFQUKpPcCdSem','adsfadf','adfd','2020-10-20',1,2,NULL,'adsfadsf','adf',0,'2020-10-16 04:43:58'),(34,'developer','developer','dev@gmail.com','$2a$12$Nm4ykoMuUfrm4yedvaCrR.x755UX0gizWdEK7UP6cFQUKpPcCdSem','adsf','asdfadsf','2020-10-14',2,1,NULL,'adsfads','fadf',0,'2020-10-16 05:31:59'),(35,'Rahul','Rahul','rahul@gmail.com','$2b$10$oqamcN7W4AUBgre0odFCd.CAojRbb1f.YQbIp68wqzOW2a0X1Jz3K','','','2024-06-06',1,2,NULL,'','',0,'2024-06-09 07:00:20');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_role`
--

DROP TABLE IF EXISTS `users_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_role` (
  `users_id` varchar(25) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`users_id`,`role_id`),
  KEY `fk_usersrole_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_role`
--

LOCK TABLES `users_role` WRITE;
/*!40000 ALTER TABLE `users_role` DISABLE KEYS */;
INSERT INTO `users_role` VALUES ('9',1),('9',2);
/*!40000 ALTER TABLE `users_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_usergroup`
--

DROP TABLE IF EXISTS `users_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_usergroup` (
  `users_id` int NOT NULL,
  `usergroup_id` int NOT NULL,
  PRIMARY KEY (`users_id`,`usergroup_id`),
  KEY `fk_usersusergroup_usergroup` (`usergroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_usergroup`
--

LOCK TABLES `users_usergroup` WRITE;
/*!40000 ALTER TABLE `users_usergroup` DISABLE KEYS */;
INSERT INTO `users_usergroup` VALUES (1,1),(30,46),(34,49),(35,49);
/*!40000 ALTER TABLE `users_usergroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18  7:09:06
