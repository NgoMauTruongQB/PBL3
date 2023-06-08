-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 04:07 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trai_tre_mo_coi`
--

-- --------------------------------------------------------

--
-- Table structure for table `adopter`
--

CREATE TABLE `adopter` (
  `apdoterID` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `cmnd` varchar(20) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adopter`
--

INSERT INTO `adopter` (`apdoterID`, `name`, `phonenumber`, `address`, `cmnd`, `note`) VALUES
('NN1231', 'Lê Trọng Nghĩa', '0921233231', 'Hải Châu, Đà Nẵng', '092113331', NULL),
('NN1234', 'Cù Thị Huyền Trang ', '0935412321', 'Liên Chiểu, Đà Nẵng ', '0431233312', NULL),
('NN1235', 'Thái Khắc Dược', '0354123184', 'Điện Bàn, Quảng Nam', '012111221', NULL),
('NN1236', 'Nguyễn Đức Dũng', '0915432189', 'Lộc Hà, Hà Tĩnh', '0452021121', NULL),
('NN1238', 'Nguyễn Thu Hà', '012122165', 'Đồng Hới, Quảng Bình', '044199001121', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `adoption`
--

CREATE TABLE `adoption` (
  `adoptionID` varchar(10) NOT NULL,
  `adopterID` varchar(10) NOT NULL,
  `orphanID` varchar(10) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `date_adoption` date NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoption`
--

INSERT INTO `adoption` (`adoptionID`, `adopterID`, `orphanID`, `state`, `date_adoption`, `note`) VALUES
('A002', 'NN1236', 'C11224', 'Đang xử lí', '2023-02-27', NULL),
('A003', 'NN1235', 'C11000', 'Thành công', '2020-09-02', 'Bé theo gia đình mới đi Mỹ'),
('A004', 'NN1238', 'C11221', 'Đang hoàn thiện hồ sơ', '2021-03-11', 'Không');

-- --------------------------------------------------------

--
-- Table structure for table `caring_relationship`
--

CREATE TABLE `caring_relationship` (
  `id` varchar(50) NOT NULL DEFAULT 'AUTO_INCREMENT',
  `staffID` varchar(10) DEFAULT NULL,
  `ophanID` varchar(10) DEFAULT NULL,
  `relationship_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caring_relationship`
--

INSERT INTO `caring_relationship` (`id`, `staffID`, `ophanID`, `relationship_type`) VALUES
('1122111', '123331', 'C22012', 'Chăm sóc'),
('1231121', 'ST12111', 'C11224', 'Hướng dẫn học tập');

-- --------------------------------------------------------

--
-- Table structure for table `charity_activities`
--

CREATE TABLE `charity_activities` (
  `activityID` varchar(10) NOT NULL,
  `name_of_activity` varchar(512) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `money_collected` double NOT NULL DEFAULT 0,
  `purpose_of_activity` text DEFAULT NULL,
  `staffID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charity_activities`
--

INSERT INTO `charity_activities` (`activityID`, `name_of_activity`, `date_begin`, `date_end`, `money_collected`, `purpose_of_activity`, `staffID`) VALUES
('HD1201', 'Ủng hộ trẻ em bị hở hàm ếch ', '2023-02-25', '2023-03-21', 32000000, NULL, '123331'),
('HD1202', '100K cùng bé đến trường', '1933-03-02', '1934-03-02', 20000000, 'Ủng hộ các bé ở Tỉnh Lào Cai', '111221'),
('HD1221', '\"Đem nắng về bản\"', '2023-05-03', '2023-05-30', 19000000, 'Ủng hộ đèn học cho các bạn nhỏ ở xã miền núi', 'ST12113');

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE `children` (
  `orphanID` varchar(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(5) NOT NULL,
  `reason` text DEFAULT NULL,
  `health_status` varchar(50) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`orphanID`, `name`, `date_of_birth`, `gender`, `reason`, `health_status`, `education`, `state`) VALUES
('C11000', 'Nguyễn Văn Nhật', '2022-04-02', 'Nam', 'Bị bỏ rơi ở cổng chùa', 'Tốt', '', 1),
('C11221', 'Nguyễn Thị A', '2022-02-21', 'Nữ', 'Mồ côi cha và mẹ', 'Tốt', NULL, 1),
('C11223', 'Ngô Văn Hải', '1970-01-01', 'Nam', 'Bố mẹ bị bệnh hiểm nghèo', 'Tim bẩm sinh', '11/12', 1),
('C11224', 'Nguyễn Hồng Hạnh', '1970-01-01', 'Nữ', 'Lạc bố mẹ', 'Tốt', '6/12', 1),
('C22012', 'Trần Văn B', '2008-01-05', 'Nam ', 'Môi côi cha', 'Bệnh hiểm nghèo', '7/12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donationID` varchar(10) NOT NULL,
  `amount_of_money` double NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `date_of_donation` date NOT NULL,
  `activityID` varchar(10) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donationID`, `amount_of_money`, `state`, `phoneNumber`, `date_of_donation`, `activityID`, `userID`) VALUES
('DN001', 200000, 'Đang xác thực', '0921233432', '2023-03-22', 'HD1221', 'U002'),
('DN002', 100000, 'Hoàn tất', '0921233432', '2023-03-22', 'HD1202', 'U003'),
('DN003', 30000, 'Hoàn tất', '0398683741', '2023-03-22', 'HD1221', 'U002');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventID` varchar(10) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `location` varchar(512) NOT NULL,
  `event_of_name` varchar(512) NOT NULL,
  `number_of_chidlren` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `staffID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventID`, `date_begin`, `date_end`, `location`, `event_of_name`, `number_of_chidlren`, `state`, `staffID`) VALUES
('E001', '2023-03-28', '2023-03-28', 'Đà Nẵng', 'Tham quan vườn bách thú', 25, 1, 'ST12112'),
('E002', '2023-04-28', '2023-04-28', 'Đà Nẵng', 'Picnic tại công viên 29/3', 20, 0, '123331'),
('E003', '2023-04-02', '2023-04-04', 'Hội An, Quảng Nam', 'Tham quan trải nghiệm làm gốm', 15, 0, '123331');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedbackID` varchar(10) NOT NULL,
  `date_of_feedback` date NOT NULL,
  `staffID` varchar(10) NOT NULL,
  `content_of_feedback` text DEFAULT NULL,
  `rating` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedbackID`, `date_of_feedback`, `staffID`, `content_of_feedback`, `rating`) VALUES
('FB1123', '2023-03-26', '123331', 'Nhân viên hướng dẫn tận tình', 5),
('FB1221', '2023-02-25', '111221', 'Thái độ phục vụ tốt', 5),
('FB1222', '2022-01-15', 'ST12112', 'Chất lượng phục vụ kém', 1),
('FB3212', '2024-01-12', 'ST12113', 'Tốt', 4),
('FB3223', '2023-02-01', 'ST12113', '', 0),
('FB4512', '3923-03-27', '123331', 'Bảo vệ khó tính', 2),
('FB4513', '3923-04-27', '123331', 'Thân thiện', 5);

-- --------------------------------------------------------

--
-- Table structure for table `introducter`
--

CREATE TABLE `introducter` (
  `introducterID` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `address` varchar(150) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `introducter`
--

INSERT INTO `introducter` (`introducterID`, `name`, `phonenumber`, `address`, `note`) VALUES
('11112211', 'Phạm Thành Vinh ', '0912385781', 'Hội An, Quảng Nam ', NULL),
('11122100', 'Huỳnh Hải Đăng', '0922322112', 'Thanh Khê, Đà Nẵng', NULL),
('GT001', 'Phạm Thị Linh', '098122131', 'Thành phố Huế, Thừa Thiên Huế', NULL),
('GT002', 'Phan Thị Ánh Ngọc', '0923278191', 'Quảng Ninh, Quảng Bình', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `introduction`
--

CREATE TABLE `introduction` (
  `introductionID` varchar(10) NOT NULL,
  `orphanID` varchar(10) NOT NULL,
  `introducterID` varchar(10) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `date_introduction` date NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `introduction`
--

INSERT INTO `introduction` (`introductionID`, `orphanID`, `introducterID`, `state`, `date_introduction`, `note`) VALUES
('123123', 'C11224', 'GT001', 'Thành công', '2022-03-02', NULL),
('45312', 'C11224', 'GT001', 'Chưa hoàn thành', '2022-03-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `position` varchar(255) NOT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `fullname`, `date_of_birth`, `gender`, `position`, `state`) VALUES
('111221', 'Nguyễn Phạm Nhật Vỹ', '2003-04-27', 'Nữ', 'Nhân viên chăm sóc', 1),
('123331', 'Nguyễn Viết Hoài Bảo ', '1998-12-28', 'Nam', 'Bảo vệ', 1),
('ST12111', 'Trần Lê Minh', '2000-11-10', 'Nam', 'Nhân viên chăm sóc', 1),
('ST12112', 'Lê Trong Nghĩa', '1998-12-28', 'Nam', 'Bảo vệ', 1),
('ST12113', 'Hoàng Thị Vân', '1999-07-25', 'Nữ', 'Nhân viên vệ sinh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `fullname`, `role`, `state`) VALUES
('U001', 'admin01', 'truongngo2707@gmail.com', 'ad1234', '', 'admin', 1),
('U002', 'kimhieu', 'kimhieu@gmail.com', 'hieu123', 'Trần Kim Hiếu', 'user', 1),
('U003', 'nmt03', 'ngomautruong2707@gmail.com', 'truong123', 'Ngô Mậu Trường', 'user', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adopter`
--
ALTER TABLE `adopter`
  ADD PRIMARY KEY (`apdoterID`);

--
-- Indexes for table `adoption`
--
ALTER TABLE `adoption`
  ADD PRIMARY KEY (`adoptionID`) USING BTREE,
  ADD KEY `FK_adoption_adopters` (`adopterID`),
  ADD KEY `FK_adoption_orphan` (`orphanID`);

--
-- Indexes for table `caring_relationship`
--
ALTER TABLE `caring_relationship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__orphanage_children` (`ophanID`),
  ADD KEY `FK_caring_relationship_orphanage_staff` (`staffID`);

--
-- Indexes for table `charity_activities`
--
ALTER TABLE `charity_activities`
  ADD PRIMARY KEY (`activityID`),
  ADD KEY `FK_charity_activities_staff` (`staffID`);

--
-- Indexes for table `children`
--
ALTER TABLE `children`
  ADD PRIMARY KEY (`orphanID`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD PRIMARY KEY (`donationID`),
  ADD KEY `FK_donation_charity_activities` (`activityID`),
  ADD KEY `FK_donation_user` (`userID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventID`) USING BTREE,
  ADD KEY `FK_event_staff` (`staffID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackID`),
  ADD KEY `FK_feedback_orphanage_staff` (`staffID`);

--
-- Indexes for table `introducter`
--
ALTER TABLE `introducter`
  ADD PRIMARY KEY (`introducterID`);

--
-- Indexes for table `introduction`
--
ALTER TABLE `introduction`
  ADD PRIMARY KEY (`introductionID`),
  ADD KEY `FK__orphan` (`orphanID`),
  ADD KEY `FK__introducter` (`introducterID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `FK_adoption_adopters` FOREIGN KEY (`adopterID`) REFERENCES `adopter` (`apdoterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_adoption_orphan` FOREIGN KEY (`orphanID`) REFERENCES `children` (`orphanID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `caring_relationship`
--
ALTER TABLE `caring_relationship`
  ADD CONSTRAINT `FK__orphanage_children` FOREIGN KEY (`ophanID`) REFERENCES `children` (`orphanID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_caring_relationship_orphanage_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `charity_activities`
--
ALTER TABLE `charity_activities`
  ADD CONSTRAINT `FK_charity_activities_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donation`
--
ALTER TABLE `donation`
  ADD CONSTRAINT `FK_donation_charity_activities` FOREIGN KEY (`activityID`) REFERENCES `charity_activities` (`activityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_donation_user` FOREIGN KEY (`userID`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FK_event_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_feedback_orphanage_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staff_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `introduction`
--
ALTER TABLE `introduction`
  ADD CONSTRAINT `FK__introducter` FOREIGN KEY (`introducterID`) REFERENCES `introducter` (`introducterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK__orphan` FOREIGN KEY (`orphanID`) REFERENCES `children` (`orphanID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
