-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 01:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `Salesclerk_ID` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `Sales_Item_Price` float DEFAULT NULL,
  `Total_Amount` float NOT NULL,
  `Sales_Item_ID` int(11) DEFAULT NULL,
  `Sales_Item_Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cheque`
--

CREATE TABLE `cheque` (
  `id` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `Currency` float DEFAULT NULL,
  `Invoice_Id` int(11) DEFAULT NULL,
  `Generated_when` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `Review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price_per_Unit` float DEFAULT NULL,
  `Threshold_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `Ingredient_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT 100,
  `Total_Amount` float NOT NULL,
  `Price_per_Unit` float NOT NULL,
  `Purchase_order_id` int(11) DEFAULT NULL,
  `Generated_At` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Phone_no` varchar(20) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Role_id` int(11) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Notification` varchar(50) DEFAULT NULL,
  `Report_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price_per_Unit` float NOT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Quantity` int(11) DEFAULT 20,
  `Sales_item_id` int(11) DEFAULT NULL,
  `Sales_Item_Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id` int(11) NOT NULL,
  `Ingredient_id` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT 100,
  `Price_per_Unit` float NOT NULL,
  `Ingredient_Name` varchar(200) DEFAULT NULL,
  `Generated_At` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `Type` varchar(300) NOT NULL,
  `Generated_By` varchar(100) NOT NULL,
  `Generated_At` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salesclerk`
--

CREATE TABLE `salesclerk` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Phone_no` varchar(20) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Role_id` int(11) DEFAULT NULL,
  `Notification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_item`
--

CREATE TABLE `sales_item` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Ingredient` varchar(200) DEFAULT NULL,
  `Price_per_Unit` float NOT NULL,
  `Quantity` int(11) DEFAULT 20,
  `Menu_id` int(11) DEFAULT NULL,
  `Bill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Salesclerk_ID` (`Salesclerk_ID`),
  ADD KEY `Sales_Item_ID` (`Sales_Item_ID`);

--
-- Indexes for table `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Invoice_Id` (`Invoice_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ingredient_ID` (`Ingredient_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Purchase_order_id` (`Purchase_order_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Role_id` (`Role_id`),
  ADD KEY `Report_Id` (`Report_Id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Sales_item_id` (`Sales_item_id`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Ingredient_id` (`Ingredient_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salesclerk`
--
ALTER TABLE `salesclerk`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Role_id` (`Role_id`);

--
-- Indexes for table `sales_item`
--
ALTER TABLE `sales_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Menu_id` (`Menu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cheque`
--
ALTER TABLE `cheque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salesclerk`
--
ALTER TABLE `salesclerk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_item`
--
ALTER TABLE `sales_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Salesclerk_ID`) REFERENCES `salesclerk` (`ID`),
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`Sales_Item_ID`) REFERENCES `sales_item` (`id`);

--
-- Constraints for table `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`Invoice_Id`) REFERENCES `invoice` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Ingredient_ID`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Purchase_order_id`) REFERENCES `purchase_order` (`id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `manager_ibfk_2` FOREIGN KEY (`Report_Id`) REFERENCES `report` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`Sales_item_id`) REFERENCES `sales_item` (`id`);

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`Ingredient_id`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `salesclerk`
--
ALTER TABLE `salesclerk`
  ADD CONSTRAINT `salesclerk_ibfk_1` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `sales_item`
--
ALTER TABLE `sales_item`
  ADD CONSTRAINT `sales_item_ibfk_1` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
