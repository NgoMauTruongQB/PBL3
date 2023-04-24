-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2023 at 10:04 AM
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
('NN1235', 'Thái Khắc Dược', '0354123184', 'Điện Bàn, Quảng Nam', '012111221', 'Hiện đã đổi quốc tịch'),
('NN1236', 'Nguyễn Đức Dũng', '0915432189', 'Lộc Hà, Hà Tĩnh', '0452021121', ''),
('NN1238', 'Nguyễn Thị Thu Hà', '0945294657', 'Hội An, Quảng Nam', '01211211901', ''),
('NN16814405', 'Ngô Hải Văn', '0900921121', 'Hàm Nghi, Hải Châu, Đà Nẵng', '044098120121', ''),
('NN16818065', 'Nguyễn Hà Dịu Thảo', '098790687', 'Cầu Giấy, Hà Nội', '044098120122', ''),
('NN16818094', 'Nguyễn Hà Kiều Loan', '0945294657', 'Ba Đình, Hà Nội', '044098120109', 'Hoa Hậu Việt Nam'),
('NN16819274', 'Nguyễn Văn Sửu', '0815471721', 'Nha Trang, Khánh Hoà', '044098120432', '');

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
  `staffID` varchar(10) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charity_activities`
--

INSERT INTO `charity_activities` (`activityID`, `name_of_activity`, `date_begin`, `date_end`, `money_collected`, `purpose_of_activity`, `staffID`, `photo`) VALUES
('HD1201', 'Ủng hộ trẻ em bị hở hàm ếch ', '2023-02-25', '2023-03-21', 32000000, NULL, '123331', NULL),
('HD1202', '100K cùng bé đến trường', '1933-03-02', '1934-03-02', 20000000, 'Ủng hộ các bé ở Tỉnh Lào Cai', '111221', NULL),
('HD1221', 'Đem nắng về bản', '2023-05-03', '2023-05-30', 19000000, 'Ủng hộ đèn học cho các bạn nhỏ ở xã miền núi', 'ST12113', NULL),
('HD16821345', 'Nắng về Arui', '2023-04-22', '2023-05-22', 10000000, 'Mua đèn để bàn cho các bạn nhỏ ở huyện miền núi Arui Quảng Nam', 'ST16809422', 'NangVeArui.png'),
('HD16821360', 'Vì nụ cười trẻ thơ', '2023-04-30', '2023-12-05', 5000000, 'Chương trình giáo dục sức khoẻ răng miệng và trao tặng các phần quà gồm nước súc miệng, bàn chải, kem đánh răng.', 'ST16814345', 'NuCuoi.png'),
('HD16821361', 'Áo mới đến trường', '2023-07-27', '2023-08-15', 100000000, 'Chung tay ủng hộ tiền giúp các bạn nhỏ có áo mới đến trường trong học kì tới', 'ST12111', 'Ao Moi.png'),
('HD16821362', 'Sao yêu thương', '2023-04-10', '2023-04-12', 10000000, 'Đêm nhạc gây quỹ của các bạn nhỏ tại trung tâm, số tiền nhận được sẽ mua gạo ủng hộ các bạn nhỏ vùng sâu.', '16808885', 'SaoYeuThuong.png'),
('HD16821363', 'Nuôi trẻ tháng 5', '2023-05-01', '2023-05-30', 60000000, 'Kinh phí nuôi dưỡng các bạn nhỏ đang sống ở Happy House', '16808885', 'UHNT.png'),
('HD16822349', 'Nuôi trẻ tháng 6', '2023-01-06', '2023-06-30', 50000000, 'Cùng chúng tôi chung tay nuôi các bạn nhỏ ở trung tâm trong tháng 6', '16808885', 'UHNT2.png');

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
  `state` tinyint(4) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `children`
--

INSERT INTO `children` (`orphanID`, `name`, `date_of_birth`, `gender`, `reason`, `health_status`, `education`, `state`, `photo`) VALUES
('C11000', 'Nguyễn Văn Nhật', '2015-04-02', 'Nam', 'Bị bỏ rơi ở cổng chùa', 'Tốt', '', 0, 'mm8.png'),
('C11221', 'Nguyễn Thị A', '2022-02-21', 'Nữ', 'Mồ côi cha và mẹ', 'Tốt', NULL, 1, NULL),
('C11223', 'Ngô Văn Hải', '2008-01-01', 'Nam', 'Bố mẹ bị bệnh hiểm nghèo', 'Tim bẩm sinh', '11/12', 1, 'mm5.png'),
('C11224', 'Nguyễn Hồng Hạnh', '2007-09-10', 'Nữ', 'Lạc bố mẹ', 'Tốt', '6/12', 1, 'mm7.png'),
('C16809741', 'Lê Gia Huy', '2017-12-21', 'Nam', 'Bố bị tai nạn đã qua đời, mẹ bị u xơ vú và vôi hóa cột sống nên không thể lao động có thu nhập để nuôi 4 đứa con ăn học, hoàn cảnh gia đình rất khó khăn', 'Tốt', '2/12', 1, 'mm6.png'),
('C16809743', 'Nguyễn Bảo Bảo', '2013-12-04', 'Nam', 'Cháu Bảo 2 mắt bị viễn thị bẩm sinh có nguy cơ nhược thị. Nhà có em nhỏ học lớp 1 và bà nội già yếu.', 'Viễn thị', '4/12', 1, 'mm3.png'),
('C16809754', 'Cao Gia Anh', '2012-03-01', 'Nam', 'Bố vào Nam làm ăn nên cháu sinh ra và lớn lên ở Đông Nai. Khi được 4 tuổi, bố bị bệnh suy thận nặng phải chạy thận nhân tạo. Gia cảnh khó khăn nên mẹ cháu bỏ chồng bỏ con đi đâu không rõ. Do ốm đau không nuôi được con nên bố cháu gửi về cho Ông nội (năm nay đã 76 tuổi) nuôi để tiếp tục ở lại điều trị chạy thận nhân tạo tại Đồng Nai. Cháu tìm được mẹ trên Facebook nhưng mẹ không nhận kết bạn và đổi tên nên vẫn không liên lạc được với mẹ. Thuộc diện hộ nghèo.', 'Bị suy thận nặng', '5/12', 1, 'mm4.png'),
('C16809829', 'Dương Thanh Đạt', '2003-02-27', 'Nam', '', 'Suy tim', '12/12', 1, 'mm2.png'),
('C22012', 'Trần Văn B', '2008-01-05', 'Nam', 'Môi côi cha', 'Bệnh hiểm nghèo', '7/12', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `donationID` varchar(10) NOT NULL,
  `amount_of_money` double NOT NULL,
  `state` tinyint(4) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `date_of_donation` date NOT NULL,
  `activityID` varchar(10) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `donation`
--

INSERT INTO `donation` (`donationID`, `amount_of_money`, `state`, `phoneNumber`, `date_of_donation`, `activityID`, `userID`) VALUES
('DN001', 200000, 1, '0921233432', '2023-03-22', 'HD1221', 'U002'),
('DN002', 100000, 1, '0921233432', '2023-03-22', 'HD1202', 'U003'),
('DN003', 30000, 1, '0398683741', '2023-03-22', 'HD1221', 'U002'),
('DN004\r\n', 150000, 1, '0921233432', '2023-04-23', 'HD1221', 'U16801004'),
('DN005', 10000000, 1, '0845298612', '2023-04-24', 'HD1221', 'U16797371'),
('DN006', 500000, 0, '0765121212', '2023-04-24', 'HD1201', 'U16802482');

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
  `staffID` varchar(10) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventID`, `date_begin`, `date_end`, `location`, `event_of_name`, `number_of_chidlren`, `state`, `staffID`, `content`) VALUES
('E001', '2023-03-28', '2023-03-28', 'Đà Nẵng', 'Tham quan vườn bách thú', 25, 1, 'ST12112', NULL),
('E002', '2023-04-28', '2023-04-28', 'Thanh Khê, Đà Nẵng', 'Picnic tại công viên 29/3', 20, 0, 'ST16809833', ''),
('E003', '2023-04-02', '2023-04-04', 'Hội An, Quảng Nam', 'Tham quan trải nghiệm làm gốm', 15, 0, '123331', ''),
('E16820678', '2023-04-30', '2023-05-01', 'Lệ Thuỷ, Quảng Bình', 'Thăm nhà Đại Tướng Võ Nguyên Giáp', 5, 0, '16808885', 'Các bạn trẻ có thành tích học tập tốt sẽ được chọn để đi thăm nhà Đại Tướng Võ Nguyên Giáp ở Quảng Bình. '),
('E16820680', '2023-04-22', '2023-04-22', 'Hoà Hiệp, Liên Chiểu, Đà Nẵng', 'Đời đời nhớ ơn', 30, 0, 'ST16808887', 'Tất cả các bạn nhỏ tại trung tâm sẽ được đến thăm và thắp hương cho các anh hùng liệt sĩ đã ngã xuống bảo vệ độc lập, chủ quyền cho dân tộc. Các bạn nhỏ sẽ cầm theo dụng cụ về sinh để vệ sinh nghĩa trang trước khi thăm hương.');

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
('FB4223', '2023-04-21', '123331', 'Thái độ phục vụ tệ', 2),
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
('GT16818337', 'Phan Thị Ánh Ngọc', '045689512', 'An Thuỷ, Lệ Thuỷ, Quảng Bình', ''),
('GT16818338', 'Dương Thị Trang', '098712112', 'Mai Thuỷ, Lệ Thuỷ, Quảng Bình', 'Đang định cư tại Hàn Quốc'),
('GT16818347', 'Nguyễn Thị Mỹ Duyên', '0815471721', 'Hải Châu, Đà Nẵng', ''),
('GT16819285', 'Hồ Nguyễn Hoài Anh', '0845294512', 'Cầu Giấy, Hà Nội', '');

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
  `state` tinyint(4) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `fullname`, `date_of_birth`, `gender`, `position`, `state`, `phone`, `email`, `photo`) VALUES
('111221', 'Nguyễn Phạm Nhật Vỹ', '2003-04-27', 'Nữ', 'Nhân viên chăm sóc', 0, '0921341231', 'nhatvyx@gmail.com', ''),
('123331', 'Nguyễn Viết Hoài Bảo ', '1998-12-28', 'Nam', 'Giáo viên', 1, '0398683741', 'hoaibao@gmail.com', ''),
('16808858', 'Hạo Nam', '2002-12-12', 'Nam', 'Chăm sóc trẻ', 1, '0392112321', 'chinhduong@gmail.com', '7.png'),
('16808885', 'Cù Thị Huyền Trang', '2003-07-09', 'Nữ', 'Kế toán', 1, '0921231234', 'tranghuyen@gmail.com', '2.png'),
('ST12111', 'Trần Lê Minh', '2000-11-10', 'Nam', 'Bảo vệ', 1, '0914123123', 'leminhml@gmail.com', ''),
('ST12112', 'Lê Trong Nghĩa', '1998-12-28', 'Nam', 'Bảo vệ', 1, '0121111432', 'lemon@gmail.com', 'TVU_0877_as_Smart_Object1.jpg'),
('ST12113', 'Hoàng Thị Vân', '1999-07-25', 'Nữ', 'Nhân viên vệ sinh', 1, '0354777121', 'vanhoang@gmail.com', '1.png'),
('ST1680886', 'Maria Jenny', '2000-12-03', 'Nữ', 'Nhân viên chăm trẻ', 1, '0911221121', 'jenny@gmail.com', 'img10.jpg'),
('ST16808887', 'Nguyễn Thị Hương', '2003-03-26', 'Nữ', 'Giáo viên', 1, '0815412864', 'huonghuong2603@gmail.com', 'huong.jpg'),
('ST16809422', 'Jennifer Nguyen', '1999-12-03', 'Nữ', 'Giáo viên tiếng anh', 1, '0900921121', 'janiferusa@yahoo.com', 'img9.jpg'),
('ST16809465', 'Vương Nữ Thu Thuỷ', '2000-12-05', 'Nữ', 'Nhân viên chăm trẻ', 1, '084548223', 'thuthuy@gmail.com', '5.png'),
('ST16809833', 'Nguyễn Thị Phương Nhi', '2001-12-23', 'Nữ', 'Nhân viên chăm trẻ', 1, '0915294516', 'phuongnhibts@gmail.com', '11.png'),
('ST16814345', 'Nguyễn Trương Anh Minh', '2003-07-07', 'Nam', 'Nhân viên kĩ thuật', 1, '039857712', 'anhminh123@gmail.com', '8.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `fullname`, `role`, `state`) VALUES
('U002', 'hieukhongsay', 'kimhieu@gmail.com', 'hieu12345', 'Trần Kim Hiếu', 'staff', 0),
('U003', 'nmt03', 'ngomautruong2707@gmail.com', 'truong123', 'Ngô Mậu Trường', 'user', 1),
('U16797091', 'thienkim', 'thienkim@uhn.vn', 'thienkim0011', 'Trần Thiên Kim ', 'user', 1),
('U16797174', 'leminh', 'leminhQB@gmail.com', 'leminhqb', 'Phan Lê Minh', 'user', 1),
('U16797368', 'nguoiyeuanh', 'thinhha2607@gmail.com', 'thinh123', 'Hà Cường Thịnh', 'user', 0),
('U16797371', 'bndthao', 'dieuthao2112@gmail.com', 'thao1234', 'Ngô Nguyễn Diệu Thảo', 'user', 1),
('U16797372', 'dathao', 'daothao@gmail.com', 'thao1234', 'Nguyễn Thị Dạ Thảo', 'user', 1),
('U16797483', 'maiipung', 'phuongmai@gmail.com', 'phuongmaii', 'Mai Thu Phương', 'user', 0),
('U16797489', 'dtvan.03', 'dtvan0203@gmail.com', 'van12345', 'Đặng Tường Vân ', 'user', 1),
('U16801004', 'admin01', 'truongngo2707@gmail', 'ad1234', '', 'admin', 1),
('U16801005', 'qtnghia03', 'nguyennghiax@gmail.com', 'nghia12312', 'Nguyễn Quốc Trọng Nghĩa', 'user', 1),
('U16801551', 'haien2210', 'haiyen2210@gmail.com', 'haiyen1234', 'Dương Thị Hải Yến', 'user', 1),
('U16801611', 'baogia', 'baogia@gmail.com', 'baogia121', 'Nguyễn Gia Bảo', 'user', 1),
('U16802473', 'hoangcat', 'nhathohoangcat@gmail.com', 'hoangcatvn', 'Hoàng Cát', 'staff', 1),
('U16802474', 'balui', 'contactforwwork@gmail.com', 'mottienbalui', 'Huỳnh Thới Ngọc Thảo', 'staff', 1),
('U16802482', 'van056', 'vananh@yahoo.com', 'vananh121', 'Ngô Vân Anh', 'user', 1),
('U16802728', 'daitruongbui', 'daitruongbui@gmail.com', 'daitruong12221', 'Bùi Đại Trường', 'staff', 0),
('U16807167', 'hoabui', 'hoabui@gmail.com', 'nghia12312', 'Bùi Quỳnh Hoa', 'user', 1),
('U16819178', 'tbinh0104', 'thanhbinh@gmail.com', 'thanhbinh123', 'Nguyễn Thanh Bình', 'user', 1);

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
