-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2025 lúc 06:41 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `harmic`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_account`
--

CREATE TABLE `tb_account` (
  `AccountId` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `LastLogin` char(10) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_adminmenu`
--

CREATE TABLE `tb_adminmenu` (
  `MenuId` int(11) NOT NULL,
  `Title` varchar(150) DEFAULT NULL,
  `Alias` varchar(150) DEFAULT NULL,
  `Icon` varchar(100) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Positon` int(11) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_adminmenu`
--

INSERT INTO `tb_adminmenu` (`MenuId`, `Title`, `Alias`, `Icon`, `ParentId`, `Positon`, `Description`, `IsActive`) VALUES
(1, 'Trang chủ', 'Home', 'fas fa-tachometer-alt', 0, 1, 'Trang chủ thôi', 1),
(2, 'Quản lý sản phẩm', '#', 'fas fa-carrot', 0, 2, 'Các cài đặt liên quan đến sản phẩm', 1),
(3, 'Danh mục sản phẩm', 'ProductCategories', 'fas fa-table', 2, 1, 'Danh mục', 1),
(4, 'Sản phẩm', 'Products', 'fas fa-apple-alt ', 2, 2, 'Sản phẩm', 1),
(5, 'Đánh giá', 'ProductReviews', 'fas fa-star', 2, 3, 'Quản lý đánh giá sản phẩm từ khách hàng', 1),
(6, 'Quản lý bài viết', '#', 'fas fa-newspaper', 0, 3, 'Quản lý bài viết', 1),
(7, 'Danh mục bài viết', 'Categories', 'fas fa-table', 6, 1, 'Danh mục bài viết', 1),
(8, 'Bài viết', 'Blogs', 'fas fa-newspaper', 6, 2, 'Bài viết', 1),
(9, 'Bình luận', 'BlogComments', 'fas fa-comment', 6, 3, 'Bình luận', 1),
(10, 'Đơn đặt hàng', 'Orders', 'fas fa-money-check-alt', 0, 4, 'Đơn hàng', 0),
(11, 'Menu', 'menus', 'fas fa-bars', 0, 5, 'menu cho giao diện người dùng', 1),
(12, 'Quản lý tệp', 'FileManager', 'fas fa-folder', 0, 6, 'Quản lý tệp', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_blog`
--

CREATE TABLE `tb_blog` (
  `BlogId` int(11) NOT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Alias` varchar(250) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Description` varchar(4000) DEFAULT NULL,
  `Detail` longtext DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `SeoTitle` varchar(250) DEFAULT NULL,
  `SeoDescription` varchar(500) DEFAULT NULL,
  `SeoKeywords` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_blogcomment`
--

CREATE TABLE `tb_blogcomment` (
  `CommentId` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Detail` varchar(200) DEFAULT NULL,
  `BlogId` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_cart`
--

CREATE TABLE `tb_cart` (
  `IdCart` int(11) NOT NULL,
  `IdProduct` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `IdCustomer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_cart`
--

INSERT INTO `tb_cart` (`IdCart`, `IdProduct`, `Quantity`, `IdCustomer`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_category`
--

CREATE TABLE `tb_category` (
  `CategoryId` int(11) NOT NULL,
  `Title` varchar(150) DEFAULT NULL,
  `Alias` varchar(150) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `SeoTitle` varchar(250) DEFAULT NULL,
  `SeoDescription` varchar(500) DEFAULT NULL,
  `SeoKeywords` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_checkout`
--

CREATE TABLE `tb_checkout` (
  `ID` int(11) NOT NULL,
  `OrderID` longtext DEFAULT NULL,
  `OrderInfo` longtext DEFAULT NULL,
  `FullName` longtext DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `DatePaid` datetime DEFAULT NULL,
  `Method` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_contact`
--

CREATE TABLE `tb_contact` (
  `ContactId` int(11) NOT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `IsRead` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_customer`
--

CREATE TABLE `tb_customer` (
  `CustomerId` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `Avatar` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_customer`
--

INSERT INTO `tb_customer` (`CustomerId`, `Username`, `Password`, `Birthday`, `Avatar`, `Phone`, `Email`, `LocationId`, `LastLogin`, `IsActive`, `RoleID`) VALUES
(1, 'Quang Lộc', '6b73c20e4a962d41cbc5cf2720230988', NULL, '/files/Avatars/1.jpg', NULL, 'QuangLoc@admin.com', NULL, '2025-06-22 04:08:48', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_menu`
--

CREATE TABLE `tb_menu` (
  `MenuId` int(11) NOT NULL,
  `Title` varchar(150) DEFAULT NULL,
  `Alias` varchar(150) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Levels` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_news`
--

CREATE TABLE `tb_news` (
  `NewsId` int(11) NOT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Alias` varchar(250) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Description` varchar(4000) DEFAULT NULL,
  `Detail` longtext DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `SeoTitle` varchar(250) DEFAULT NULL,
  `SeoDescription` varchar(500) DEFAULT NULL,
  `SeoKeywords` varchar(250) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_order`
--

CREATE TABLE `tb_order` (
  `OrderId` int(11) NOT NULL,
  `Code` char(10) DEFAULT NULL,
  `CustomerName` varchar(150) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `TotalAmount` int(11) DEFAULT NULL,
  `Quanlity` int(11) DEFAULT NULL,
  `OrderStatusId` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_orderdetail`
--

CREATE TABLE `tb_orderdetail` (
  `OrderDetailId` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_orderstatus`
--

CREATE TABLE `tb_orderstatus` (
  `OrderStatusId` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_product`
--

CREATE TABLE `tb_product` (
  `ProductId` int(11) NOT NULL,
  `Title` varchar(250) DEFAULT NULL,
  `Alias` varchar(250) DEFAULT NULL,
  `CategoryProductId` int(11) DEFAULT NULL,
  `Description` varchar(4000) DEFAULT NULL,
  `Detail` longtext DEFAULT NULL,
  `Image` varchar(500) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `PriceSale` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL,
  `IsNew` tinyint(1) NOT NULL,
  `IsBestSeller` tinyint(1) NOT NULL,
  `UnitInStock` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `Star` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_product`
--

INSERT INTO `tb_product` (`ProductId`, `Title`, `Alias`, `CategoryProductId`, `Description`, `Detail`, `Image`, `Price`, `PriceSale`, `Quantity`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsNew`, `IsBestSeller`, `UnitInStock`, `IsActive`, `Star`) VALUES
(1, 'Một túi lạc (Đậu phộng)', 'mot-tui-lac-dau-phong', 4, 'Lạc', '<p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">Đậu phộng hay còn gọi là lạc được xếp vào loại đậu cùng với các loại thực phẩm như đậu xanh, đậu nành và đậu lăng. Cây đậu phộng có nguồn gốc từ Nam Mỹ ở Brazil hoặc Peru. Đậu phộng được biết đến như nguồn cung cấp protein, chất béo, nhiều chất dinh dưỡng khác cho cơ thể đồng thời giúp giảm nguy cơ các bệnh liên quan đến tim mạch.</span></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><img src=\"/files/Products/1-1-112x124.jpg\" style=\"width: 50%;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\"><br></span></p><h2 id=\"heading-w6msqoquf\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 26px; vertical-align: baseline; font-weight: 600; position: relative; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">1. Lợi ích sức khỏe của đậu phộng</h2><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"></p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Nhiều người cho rằng đậu phộng không có giá trị dinh dưỡng cao như các loại hạt như:&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/gia-tri-dinh-duong-cua-hat-hanh-nhan-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">Hạnh nhân</span></a>, óc chó hoặc hạt điều. Tuy nhiên, đậu phộng có nhiều lợi ích sức khỏe tương tự như các loại hạt đắt tiền khác và sử dụng đậu phộng như một loại thực phẩm bổ dưỡng.</p><h3 id=\"heading-z5pjhqswr\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1. Sức khỏe tim mạch</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Người ta đã chú ý nhiều đến quả óc chó và hạnh nhân như những thực phẩm tốt cho tim mạch, do hàm lượng&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/nao-la-chat-beo-khong-bao-hoa-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">chất béo không bão hòa</span></a>&nbsp;cao của chúng. Nhưng các nghiên cứu cho thấy rằng đậu phộng tốt cho sức khỏe tim mạch ngang với các loại hạt đắt tiền.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Đậu phộng giúp ngăn ngừa bệnh tim bằng cách giảm mức cholesterol. Chúng cũng có thể ngăn chặn sự hình thành các cục máu đông nhỏ và giảm nguy cơ bị đau tim hoặc&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/dot-quy-vi-sao-nguy-hiem-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">đột quỵ</span></a>.</p><h3 id=\"heading-1kznx6lwy\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1.2. Giảm nguy cơ tiểu đường</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">Ăn lạc nhiều</span>&nbsp;có tác dụng gì? Lạc thuộc nhóm thực phẩm có chỉ số đường huyết thấp, có nghĩa khi ăn lạc sẽ không làm tăng đột biến&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/carbohydrate-va-luong-duong-trong-mau-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">lượng đường trong máu</span></a>&nbsp;của bạn. Các nghiên cứu đã chỉ ra rằng ăn đậu phộng có thể làm giảm nguy cơ mắc&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/meo-de-giam-nguy-co-mac-benh-tieu-duong-loai-2-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">bệnh tiểu đường loại 2</span></a>&nbsp;ở phụ nữ.</p><h3 id=\"heading-rnvpjs20d\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1.3. Đậu phộng giúp giảm viêm</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Lạc, nguồn cung cấp chất xơ dồi dào, giúp giảm viêm khắp cơ thể cũng như hỗ trợ hệ tiêu hóa của bạn.</p><h3 id=\"heading-l24tuu9wn\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1.4. Ngăn ngừa ung thư</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Nghiên cứu đã chứng minh rằng đối với những người lớn tuổi, ăn bơ đậu phộng có thể giúp giảm nguy cơ phát triển một loại&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/ung-thu-da-day-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">ung thư dạ dày</span></a>&nbsp;nhất định - ung thư biểu mô tuyến không tim.</p><h3 id=\"heading-hn66vsr1o\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1.5. Ngăn ngừa sỏi mật</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Sử dụng đậu phộng với hàm lượng 28,35 gam mỗi tuần sẽ giúp giảm 25% nguy cơ tiến triển&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/video-dung-chu-quan-voi-benh-ly-soi-mat-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">bệnh sỏi mật</span></a>.</p><h3 id=\"heading-61gaep22g\" style=\"margin-right: 0px; margin-bottom: 16px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; font-size: 18px; vertical-align: baseline; font-weight: 600; position: relative; text-indent: 30px; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">1.6. Ngăn ngừa và phòng chống trầm cảm</span></h3><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\">Thành phần dinh dưỡng của đậu phộng bao gồm acid amin tryptophan có vai trò quan trọng trong quá trình sản xuất serotonin, hợp chất có lợi cho não bộ đồng thời giúp cải thiện tâm trạng cũng như giảm&nbsp;<a href=\"https://www.vinmec.com/vie/bai-viet/tim-hieu-ve-benh-tram-cam-va-nhung-trieu-chung-vi\" style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(0, 118, 192); display: inline-block; font-weight: 600;\"><span style=\"margin: 0px; padding: 0px; text-rendering: geometricprecision; font-weight: bolder; border: 0px; vertical-align: baseline;\">chứng trầm cảm</span></a>.</p><p style=\"margin-right: 0px; margin-left: 0px; padding: 0px; text-rendering: geometricprecision; border: 0px; vertical-align: baseline; color: rgb(51, 51, 51); font-family: Inter, roboto, Arial, Helvetica, sans-serif; background-color: rgb(247, 247, 247);\"><br></p>', '/files/Products/1-1-112x124.jpg', 15000, 13500, 1, '2025-06-19 10:47:42', 'Quang Lộc', NULL, NULL, 1, 1, 40, 1, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_productcategory`
--

CREATE TABLE `tb_productcategory` (
  `CategoryProductId` int(11) NOT NULL,
  `Title` varchar(150) DEFAULT NULL,
  `Alias` varchar(150) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Icon` varchar(500) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(150) DEFAULT NULL,
  `ModifiedDate` datetime DEFAULT NULL,
  `ModifiedBy` varchar(150) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_productcategory`
--

INSERT INTO `tb_productcategory` (`CategoryProductId`, `Title`, `Alias`, `Description`, `Icon`, `Position`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`, `IsActive`) VALUES
(1, 'Trái cây', 'TraiCay', 'Các loại hoa quả', '/files/CategoryProduct/2.png', 2, '2025-06-17 06:08:27', 'Quang Lộc', NULL, NULL, 1),
(2, 'Rau', 'Rau', 'Cấc loại rau củ', '/files/CategoryProduct/3.png', 4, '2025-06-17 06:08:27', 'Quang Lộc', NULL, NULL, 1),
(3, 'Thịt', 'thit', 'Các loại thịt từ đóng hộp cho đến thịt tươi, hay các thực phẩm từ thịt', '/files/CategoryProduct/4.png', 6, '2025-06-19 10:12:10', 'Quang Lộc', NULL, NULL, 1),
(4, 'Lương thực', 'luongthuc', 'Các loại lương thực như lúa, gạo, khoai, sắn, ....', '/files/CategoryProduct/5.png', 1, '2025-06-19 10:12:54', 'Quang Lộc', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_productreview`
--

CREATE TABLE `tb_productreview` (
  `ProductReviewId` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `Detail` varchar(200) DEFAULT NULL,
  `Star` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_role`
--

CREATE TABLE `tb_role` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_role`
--

INSERT INTO `tb_role` (`RoleId`, `RoleName`, `Description`) VALUES
(1, 'Người dùng', 'Người dùng bình thường'),
(2, 'Quản trị viên', 'Toàn quyền'),
(3, 'Quản trị bài viết', 'Chỉnh sửa, thêm sửa xóa bài viết');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_wishlish`
--

CREATE TABLE `tb_wishlish` (
  `WishlishID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tb_wishlish`
--

INSERT INTO `tb_wishlish` (`WishlishID`, `AccountID`, `ProductID`) VALUES
(3, 1, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tb_account`
--
ALTER TABLE `tb_account`
  ADD PRIMARY KEY (`AccountId`),
  ADD KEY `FK_tb_Account_tb_Role` (`RoleId`);

--
-- Chỉ mục cho bảng `tb_adminmenu`
--
ALTER TABLE `tb_adminmenu`
  ADD PRIMARY KEY (`MenuId`);

--
-- Chỉ mục cho bảng `tb_blog`
--
ALTER TABLE `tb_blog`
  ADD PRIMARY KEY (`BlogId`),
  ADD KEY `FK_tb_Blog_tb_Account` (`AccountId`),
  ADD KEY `FK_tb_Blog_tb_Category` (`CategoryId`);

--
-- Chỉ mục cho bảng `tb_blogcomment`
--
ALTER TABLE `tb_blogcomment`
  ADD PRIMARY KEY (`CommentId`),
  ADD KEY `FK_tb_BlogComment_tb_Blog` (`BlogId`);

--
-- Chỉ mục cho bảng `tb_cart`
--
ALTER TABLE `tb_cart`
  ADD PRIMARY KEY (`IdCart`),
  ADD KEY `FK_tb_Cart_tb_Customer` (`IdCustomer`),
  ADD KEY `FK_tb_Cart_tb_Product` (`IdProduct`);

--
-- Chỉ mục cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Chỉ mục cho bảng `tb_checkout`
--
ALTER TABLE `tb_checkout`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  ADD PRIMARY KEY (`ContactId`);

--
-- Chỉ mục cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`CustomerId`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Chỉ mục cho bảng `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`MenuId`);

--
-- Chỉ mục cho bảng `tb_news`
--
ALTER TABLE `tb_news`
  ADD PRIMARY KEY (`NewsId`),
  ADD KEY `FK_tb_News_tb_Category` (`CategoryId`);

--
-- Chỉ mục cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`OrderId`),
  ADD KEY `FK_tb_Order_tb_Customer` (`CustomerId`),
  ADD KEY `FK_tb_Order_tb_OrderStatus` (`OrderStatusId`);

--
-- Chỉ mục cho bảng `tb_orderdetail`
--
ALTER TABLE `tb_orderdetail`
  ADD PRIMARY KEY (`OrderDetailId`),
  ADD KEY `FK_tb_OrderDetail_tb_Order` (`OrderId`);

--
-- Chỉ mục cho bảng `tb_orderstatus`
--
ALTER TABLE `tb_orderstatus`
  ADD PRIMARY KEY (`OrderStatusId`);

--
-- Chỉ mục cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`ProductId`),
  ADD KEY `FK_tb_Product_tb_ProductCategory` (`CategoryProductId`);

--
-- Chỉ mục cho bảng `tb_productcategory`
--
ALTER TABLE `tb_productcategory`
  ADD PRIMARY KEY (`CategoryProductId`);

--
-- Chỉ mục cho bảng `tb_productreview`
--
ALTER TABLE `tb_productreview`
  ADD PRIMARY KEY (`ProductReviewId`),
  ADD KEY `FK_tb_ProductReview_tb_Product` (`ProductId`);

--
-- Chỉ mục cho bảng `tb_role`
--
ALTER TABLE `tb_role`
  ADD PRIMARY KEY (`RoleId`);

--
-- Chỉ mục cho bảng `tb_wishlish`
--
ALTER TABLE `tb_wishlish`
  ADD PRIMARY KEY (`WishlishID`),
  ADD KEY `AccountID` (`AccountID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tb_account`
--
ALTER TABLE `tb_account`
  MODIFY `AccountId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_adminmenu`
--
ALTER TABLE `tb_adminmenu`
  MODIFY `MenuId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `tb_blog`
--
ALTER TABLE `tb_blog`
  MODIFY `BlogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_blogcomment`
--
ALTER TABLE `tb_blogcomment`
  MODIFY `CommentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_cart`
--
ALTER TABLE `tb_cart`
  MODIFY `IdCart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `CategoryId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_checkout`
--
ALTER TABLE `tb_checkout`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_contact`
--
ALTER TABLE `tb_contact`
  MODIFY `ContactId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `MenuId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_news`
--
ALTER TABLE `tb_news`
  MODIFY `NewsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_orderdetail`
--
ALTER TABLE `tb_orderdetail`
  MODIFY `OrderDetailId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_orderstatus`
--
ALTER TABLE `tb_orderstatus`
  MODIFY `OrderStatusId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `ProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tb_productcategory`
--
ALTER TABLE `tb_productcategory`
  MODIFY `CategoryProductId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tb_productreview`
--
ALTER TABLE `tb_productreview`
  MODIFY `ProductReviewId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tb_role`
--
ALTER TABLE `tb_role`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `tb_wishlish`
--
ALTER TABLE `tb_wishlish`
  MODIFY `WishlishID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tb_account`
--
ALTER TABLE `tb_account`
  ADD CONSTRAINT `FK_tb_Account_tb_Role` FOREIGN KEY (`RoleId`) REFERENCES `tb_role` (`RoleId`);

--
-- Các ràng buộc cho bảng `tb_blog`
--
ALTER TABLE `tb_blog`
  ADD CONSTRAINT `FK_tb_Blog_tb_Account` FOREIGN KEY (`AccountId`) REFERENCES `tb_account` (`AccountId`),
  ADD CONSTRAINT `FK_tb_Blog_tb_Category` FOREIGN KEY (`CategoryId`) REFERENCES `tb_category` (`CategoryId`);

--
-- Các ràng buộc cho bảng `tb_blogcomment`
--
ALTER TABLE `tb_blogcomment`
  ADD CONSTRAINT `FK_tb_BlogComment_tb_Blog` FOREIGN KEY (`BlogId`) REFERENCES `tb_blog` (`BlogId`);

--
-- Các ràng buộc cho bảng `tb_cart`
--
ALTER TABLE `tb_cart`
  ADD CONSTRAINT `FK_tb_Cart_tb_Customer` FOREIGN KEY (`IdCustomer`) REFERENCES `tb_customer` (`CustomerId`),
  ADD CONSTRAINT `FK_tb_Cart_tb_Product` FOREIGN KEY (`IdProduct`) REFERENCES `tb_product` (`ProductId`);

--
-- Các ràng buộc cho bảng `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD CONSTRAINT `tb_customer_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `tb_role` (`RoleId`);

--
-- Các ràng buộc cho bảng `tb_news`
--
ALTER TABLE `tb_news`
  ADD CONSTRAINT `FK_tb_News_tb_Category` FOREIGN KEY (`CategoryId`) REFERENCES `tb_category` (`CategoryId`);

--
-- Các ràng buộc cho bảng `tb_order`
--
ALTER TABLE `tb_order`
  ADD CONSTRAINT `FK_tb_Order_tb_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `tb_customer` (`CustomerId`),
  ADD CONSTRAINT `FK_tb_Order_tb_OrderStatus` FOREIGN KEY (`OrderStatusId`) REFERENCES `tb_orderstatus` (`OrderStatusId`);

--
-- Các ràng buộc cho bảng `tb_orderdetail`
--
ALTER TABLE `tb_orderdetail`
  ADD CONSTRAINT `FK_tb_OrderDetail_tb_Order` FOREIGN KEY (`OrderId`) REFERENCES `tb_order` (`OrderId`);

--
-- Các ràng buộc cho bảng `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `FK_tb_Product_tb_ProductCategory` FOREIGN KEY (`CategoryProductId`) REFERENCES `tb_productcategory` (`CategoryProductId`);

--
-- Các ràng buộc cho bảng `tb_productreview`
--
ALTER TABLE `tb_productreview`
  ADD CONSTRAINT `FK_tb_ProductReview_tb_Product` FOREIGN KEY (`ProductId`) REFERENCES `tb_product` (`ProductId`);

--
-- Các ràng buộc cho bảng `tb_wishlish`
--
ALTER TABLE `tb_wishlish`
  ADD CONSTRAINT `tb_wishlish_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `tb_customer` (`CustomerId`),
  ADD CONSTRAINT `tb_wishlish_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `tb_product` (`ProductId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
