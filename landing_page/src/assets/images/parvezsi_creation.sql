-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2023 at 05:13 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parvezsi_creation`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Islami Bank Bangladesh Limited', 'IBBL', 1, '2023-04-08 10:54:56', '2023-04-08 10:54:56'),
(2, 'IFIC Bank', 'IFIC', 1, '2023-05-20 11:06:46', '2023-05-20 11:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  `ac_no` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `last_transaction_date` date DEFAULT NULL,
  `initial_balance` double(8,2) NOT NULL DEFAULT 0.00,
  `type` varchar(255) NOT NULL DEFAULT 'Credit',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `routing_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_id`, `ac_name`, `ac_no`, `branch`, `address`, `contact_no`, `last_transaction_date`, `initial_balance`, `type`, `status`, `created_at`, `updated_at`, `routing_no`) VALUES
(1, 2, 'Creation', '0200291835001', 'Salimullah Road Upashakha', 'Salimullah Road, Mohammadpur', '01711000000', '2023-05-25', 204020.00, 'Credit', 1, '2023-05-26 04:26:44', '2023-05-26 04:26:44', '120263280');

-- --------------------------------------------------------

--
-- Table structure for table `bank_loans`
--

CREATE TABLE `bank_loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_type` varchar(255) NOT NULL DEFAULT 'CC',
  `bank_id` int(11) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `ac_title` varchar(255) NOT NULL,
  `ac_id` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `opening_date` date NOT NULL,
  `limiting_balance` double(12,2) NOT NULL,
  `interest_rate` double(10,2) NOT NULL,
  `other_charge` double(10,2) DEFAULT NULL,
  `principal_balance` double(12,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_loan_transactions`
--

CREATE TABLE `bank_loan_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_loan_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `particular` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_transactions`
--

CREATE TABLE `bank_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` double(12,2) NOT NULL,
  `particular` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `transactor` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `related_model` varchar(255) DEFAULT NULL,
  `related_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_transactions`
--

INSERT INTO `bank_transactions` (`id`, `account_id`, `title`, `amount`, `particular`, `note`, `transactor`, `contact`, `related_model`, `related_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Deposit', 50000.00, 'Received from Transba Medical for Dhaka Meditex Expo-2023', NULL, 'Transba Medical', '.', 'ClientPayment', '9', 1, '2023-05-23 18:00:00', '2023-05-30 11:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `bank_transaction_items`
--

CREATE TABLE `bank_transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wood', 'W', 1, '2023-03-30 07:24:55', '2023-03-30 07:24:55'),
(2, 'Board', 'B', 1, '2023-05-03 05:58:13', '2023-05-03 05:58:13'),
(3, 'Thai', 'TH', 1, '2023-05-03 05:58:32', '2023-05-03 05:58:32'),
(5, 'Glass', 'G', 1, '2023-05-03 05:58:41', '2023-05-10 07:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `chalans`
--

CREATE TABLE `chalans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `signatory_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chalans`
--

INSERT INTO `chalans` (`id`, `client_id`, `project_id`, `note`, `signatory_id`, `creator_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, NULL, 2, 1, 1, '2023-06-26 16:51:58', '2023-06-26 16:53:54'),
(2, NULL, NULL, NULL, NULL, 1, 2, '2023-07-18 10:54:01', '2023-07-18 10:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `chalan_details`
--

CREATE TABLE `chalan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chalan_id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `qty` double(10,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chalan_details`
--

INSERT INTO `chalan_details` (`id`, `chalan_id`, `item`, `qty`, `unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Crest', 10.00, 3, '2023-06-26 16:52:45', '2023-06-26 16:52:45'),
(2, 1, 'Cout Pin', 70.00, 3, '2023-06-26 16:53:11', '2023-06-26 16:53:11'),
(3, 1, 'Ambush Paper', 20.00, 3, '2023-06-26 16:53:40', '2023-06-26 16:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `category` varchar(191) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `initial_balance` double(12,2) NOT NULL DEFAULT 0.00,
  `balance_type` varchar(255) NOT NULL DEFAULT 'Credit',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `type`, `category`, `name`, `mobile`, `address`, `initial_balance`, `balance_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'Corporate', 'Thinking Scrap', '01686011965', 'Lalmatia, Dhaka-1207', 0.00, 'Credit', 1, '2023-05-09 11:12:35', '2023-05-10 14:00:13'),
(2, 'Customer', 'Corporate', 'JBS Holdings Ltd.', '01701651220', 'Dhanmondi, Dhaka-1207', 0.00, 'Credit', 1, '2023-05-09 13:49:47', '2023-05-09 13:49:47'),
(3, 'Customer', 'Corporate', 'JBS Holdings Ltd.', '01722454519', 'Bashundhara R/A, Dhaka', 0.00, 'Credit', 1, '2023-05-10 06:46:22', '2023-05-10 06:46:22'),
(4, 'Customer', 'Individual', 'R M H K H S Alumni Association', '01818914811', 'Motiganj, Sonagazi, Feni.', 0.00, 'Credit', 1, '2023-05-10 10:20:37', '2023-05-10 10:20:37'),
(5, 'Customer', 'Corporate', 'Thinking Scrap', '01686011965', 'Lalmatia, Mohammadpur, Dhaka-1207', 0.00, 'Credit', 1, '2023-05-10 13:45:00', '2023-05-10 13:45:00'),
(6, 'Customer', 'Corporate', 'TAS Group', '01321203277', 'Erectors House (Level 5 & 11), 18 Kemal Ataturk Avenue, Banani C/A, Dhaka-1213', 0.00, 'Credit', 1, '2023-05-14 05:31:02', '2023-05-14 05:31:02'),
(7, 'Customer', 'Corporate', 'Galaxy', '01755555101', 'Taj Marriot, 5th Floor, 25 Gulshan Avenue, Dhaka-1212', 0.00, 'Credit', 1, '2023-05-14 10:06:36', '2023-05-14 10:06:36'),
(8, 'Customer', 'Corporate', 'DERA Resort & Spa', '01913531380', 'House-12, Road-53, Gulshan-2, Dhaka-1212', 0.00, 'Credit', 1, '2023-05-14 13:08:51', '2023-05-14 13:08:51'),
(9, 'Customer', 'Corporate', 'Transcom Distribution Company Ltd.', '.', '53 Gulshan North Ave, Dhaka 1212', 0.00, 'Credit', 1, '2023-05-15 05:29:49', '2023-05-15 05:29:49'),
(10, 'Customer', 'Corporate', 'Dot Creat', '.', '1/2 Asad Avenue, Dhaka-1207', 0.00, 'Credit', 1, '2023-05-15 10:26:57', '2023-05-15 10:26:57'),
(11, 'Customer', 'Corporate', 'Telerad Medical System Ltd.', '.', 'Monipuri Para, Dhaka.', 0.00, 'Credit', 1, '2023-05-15 15:48:24', '2023-05-15 15:48:24'),
(12, 'Customer', 'Corporate', 'Medikit International', '.', 'Chad Uddyan, Dhaka.', 0.00, 'Credit', 1, '2023-05-18 06:14:13', '2023-05-18 06:14:13'),
(13, 'Customer', 'Corporate', 'Exotica Homes Ltd.', '.', 'Banani, Dhaka', 0.00, 'Credit', 1, '2023-05-28 14:05:56', '2023-05-28 14:05:56'),
(14, 'Customer', 'Corporate', 'Transba Medical', '.', 'Topkhana Road, Dhaka-1000', 0.00, 'Credit', 1, '2023-05-30 11:10:44', '2023-05-30 11:10:44'),
(15, 'Customer', 'Corporate', 'Transco Medical System', '.', 'Khilgaon, Dhaka.', 0.00, 'Credit', 1, '2023-05-31 05:29:09', '2023-05-31 05:29:09'),
(16, 'Customer', 'Corporate', 'Bank Asia Ltd.', '.', '32 & 34 Kazi Nazrul Islam Avenue', 0.00, 'Credit', 1, '2023-06-19 08:38:27', '2023-06-19 08:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `client_payments`
--

CREATE TABLE `client_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `row_id` int(11) DEFAULT NULL,
  `amount` double(16,2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `media` varchar(255) NOT NULL DEFAULT 'Cash',
  `bank_payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_payments`
--

INSERT INTO `client_payments` (`id`, `client_id`, `project_id`, `payment_type`, `model`, `row_id`, `amount`, `title`, `media`, `bank_payment_id`, `user_id`, `discount`, `note`, `created_at`, `updated_at`) VALUES
(1, 4, NULL, 'Received', 'RawQuotation', 3, 0.00, 'Debit', 'Cash', NULL, 1, NULL, NULL, '2023-05-10 11:01:58', '2023-05-10 11:01:58'),
(2, 1, 4, 'Received', 'RawQuotation', 4, 480000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-11 12:16:35', '2023-05-11 12:16:35'),
(3, 1, 5, 'Received', 'RawQuotation', 5, 130000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-12 10:41:24', '2023-05-12 10:41:24'),
(4, 1, 6, 'Received', 'RawQuotation', 6, 60000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-12 10:41:51', '2023-05-12 10:41:51'),
(5, 4, 3, 'Received', 'RawQuotation', 3, 0.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-13 04:54:11', '2023-05-13 04:54:11'),
(6, 8, 10, 'Received', 'RawQuotation', 10, 70000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-17 14:40:40', '2023-05-17 14:40:40'),
(7, 3, 2, 'Received', 'RawQuotation', 2, 300000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-18 05:03:48', '2023-05-18 05:03:48'),
(8, 12, 15, 'Received', 'RawQuotation', 15, 65000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-19 18:00:00', '2023-05-20 11:28:27'),
(9, 14, 17, 'Received', 'RawQuotation', 17, 50000.00, 'Debit', 'Bank', 1, 1, NULL, 'Advance', '2023-05-23 18:00:00', '2023-05-30 11:55:33'),
(10, 15, 18, 'Received', 'RawQuotation', 18, 30000.00, 'Debit', 'Cash', NULL, 1, NULL, 'Advance', '2023-05-23 18:00:00', '2023-05-31 05:41:12'),
(11, 8, 10, 'Received', 'RawQuotation', NULL, 30000.00, 'Debit', 'Cash', NULL, 1, NULL, NULL, '2023-06-19 07:17:29', '2023-06-19 07:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `client_types`
--

CREATE TABLE `client_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `bn_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_types`
--

INSERT INTO `client_types` (`id`, `name`, `bn_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Customer', 'Customer', 1, '2023-03-30 07:23:15', '2023-05-09 15:00:36'),
(2, 'Supplier', 'Supplier', 1, '2023-03-30 07:23:49', '2023-05-09 04:45:24'),
(3, 'Vendor', 'Vendor', 1, '2023-03-30 07:24:09', '2023-05-09 04:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_groups`
--

CREATE TABLE `item_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) NOT NULL,
  `row_id` int(11) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `ledger` varchar(255) NOT NULL,
  `final_table` varchar(255) DEFAULT NULL,
  `unique_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measurement_categories`
--

CREATE TABLE `measurement_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `measurement_categories`
--

INSERT INTO `measurement_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'All', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2018_12_23_120000_create_shoppingcart_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2022_04_01_064856_create_categories_table', 1),
(8, '2022_04_01_065249_create_countries_table', 1),
(9, '2022_04_01_065344_create_brands_table', 1),
(10, '2022_04_01_065426_create_units_table', 1),
(11, '2022_04_01_065547_create_products_table', 1),
(12, '2022_04_01_065802_create_clients_table', 1),
(13, '2022_04_01_065952_create_transactions_table', 1),
(14, '2022_04_01_070924_create_site_infos_table', 1),
(15, '2022_06_27_165107_create_sub_categories_table', 1),
(16, '2022_07_17_034842_create_product_stocks_table', 1),
(17, '2022_07_29_075257_create_client_types_table', 1),
(18, '2022_07_30_015033_create_measurement_categories_table', 1),
(19, '2022_07_30_015110_create_unit_conversions_table', 1),
(20, '2022_08_03_064113_create_banks_table', 1),
(21, '2022_08_03_064353_create_bank_transactions_table', 1),
(22, '2022_08_03_065128_create_transaction_sectors_table', 1),
(23, '2022_08_03_065154_create_transaction_items_table', 1),
(24, '2022_08_03_065252_create_bank_loans_table', 1),
(25, '2022_08_03_065327_create_bank_loan_transactions_table', 1),
(26, '2022_08_03_065552_create_bank_transaction_items_table', 1),
(27, '2022_08_06_082417_create_sessions_table', 1),
(28, '2022_08_07_062547_create_bank_accounts_table', 1),
(29, '2022_08_08_041802_create_purchases_table', 1),
(30, '2022_08_09_054843_create_journals_table', 1),
(31, '2022_08_09_055043_create_client_payments_table', 1),
(32, '2022_08_10_085942_create_sales_table', 1),
(33, '2022_08_10_090047_create_sale_details_table', 1),
(34, '2022_08_22_235847_create_role_users_table', 1),
(35, '2022_08_22_235909_create_roles_table', 1),
(36, '2022_09_08_235338_create_purchase_details_table', 1),
(37, '2022_12_25_004212_create_product_types_table', 1),
(38, '2022_12_25_040335_add_initial_pcs_into_products_table', 1),
(39, '2022_12_25_124511_add_rate_to_sub_categories_table', 1),
(40, '2022_12_27_084157_create_product_details_table', 1),
(41, '2022_12_27_151913_add_purchase_type_to_purchases_table', 1),
(42, '2023_01_05_105914_add_sale_purchase_date_to_products_table', 1),
(43, '2023_01_08_121909_add_barcode_to_products_table', 1),
(44, '2023_01_10_193957_create_item_groups_table', 1),
(45, '2023_01_10_203204_add_group_id_to_product_types_table', 1),
(46, '2023_01_11_104940_add_group_id_to_products_table', 1),
(51, '2023_04_01_054149_create_quotation_items_table', 2),
(52, '2023_04_01_054230_create_quotation_units_table', 2),
(53, '2023_04_01_054246_create_project_types_table', 2),
(54, '2023_04_01_054309_create_signatories_table', 2),
(55, '2023_04_01_062831_create_raw_quotations_table', 3),
(56, '2023_04_01_161048_create_raw_quotation_details_table', 4),
(57, '2023_04_06_104434_create_vendor_types_table', 5),
(58, '2023_04_08_004219_create_vendor_type_clients_table', 6),
(60, '2023_04_08_145910_create_project_vendors_table', 7),
(61, '2023_04_10_073806_create_product_supplies_table', 8),
(62, '2023_04_10_074147_create_product_supply_details_table', 9),
(63, '2023_05_11_112303_create_project_additional_infos_table', 10),
(64, '2023_05_17_094628_add_routing_no_to_bank_accounts_table', 11),
(65, '2023_05_17_100012_add_bank_account_id_to_raw_quotations_table', 11),
(66, '2023_05_18_171253_add_more_info_to_project_additional_infos_table', 11),
(67, '2023_06_11_011515_add_columns_to_project_types_table', 12),
(68, '2023_06_14_221957_create_sub_projects_table', 12),
(69, '2023_06_15_031139_add_sub_project_id_to_raw_quotation_details_table', 12),
(70, '2023_06_15_111654_create_chalans_table', 12),
(71, '2023_06_15_111721_create_chalan_details_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `symptom` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(11) DEFAULT NULL,
  `initial_quantity` double(12,3) NOT NULL DEFAULT 0.000,
  `rate` double(10,2) NOT NULL DEFAULT 0.00,
  `sale_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `img_url` varchar(255) DEFAULT NULL,
  `cost_price` int(11) NOT NULL DEFAULT 0,
  `sale_price` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `detail_description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `quantity` double(10,3) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `cost` double(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_supplies`
--

CREATE TABLE `product_supplies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `supply_date` date DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_supply_details`
--

CREATE TABLE `product_supply_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supply_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` double(10,2) DEFAULT NULL,
  `cost` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_additional_infos`
--

CREATE TABLE `project_additional_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_type_id` int(11) NOT NULL,
  `quotation_number` varchar(255) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_no` varchar(191) DEFAULT NULL,
  `advance_amount` double(10,2) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `bank_payment_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_signatory_id` int(11) DEFAULT NULL,
  `show_bank_account` tinyint(4) DEFAULT NULL,
  `account_contact_person` varchar(255) DEFAULT NULL,
  `account_contact_person_designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_additional_infos`
--

INSERT INTO `project_additional_infos` (`id`, `project_id`, `project_type_id`, `quotation_number`, `invoice_date`, `invoice_no`, `advance_amount`, `media`, `bank_payment_id`, `status`, `created_at`, `updated_at`, `account_signatory_id`, `show_bank_account`, `account_contact_person`, `account_contact_person_designation`) VALUES
(1, 6, 1, 'EX004', '2023-05-11', '0004', 60000.00, 'Cash', NULL, 1, '2023-05-11 11:49:49', '2023-05-12 10:41:51', 2, NULL, NULL, NULL),
(2, 4, 1, 'EX002', '2023-05-11', '0002', 480000.00, 'Cash', NULL, 1, '2023-05-11 12:16:35', '2023-05-11 12:16:35', 2, NULL, NULL, NULL),
(3, 5, 1, 'EX003', '2023-05-11', '0003', 130000.00, 'Cash', NULL, 1, '2023-05-12 10:41:24', '2023-05-12 10:41:24', 2, NULL, NULL, NULL),
(4, 3, 2, 'EV002', '2023-05-11', '0001', 0.00, 'Cash', NULL, 1, '2023-05-13 04:53:10', '2023-05-13 04:54:11', 2, NULL, NULL, NULL),
(5, 7, 1, 'EX005', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-14 05:35:04', '2023-05-14 05:35:04', NULL, NULL, NULL, NULL),
(6, 8, 1, 'EX006', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-14 10:09:04', '2023-05-14 10:09:04', NULL, NULL, NULL, NULL),
(7, 9, 1, 'EX007', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-14 11:42:31', '2023-05-14 11:42:31', NULL, NULL, NULL, NULL),
(8, 10, 1, 'EX008', '2023-05-17', '0005', 70000.00, 'Cash', NULL, 1, '2023-05-14 13:09:55', '2023-05-17 14:40:40', 2, NULL, NULL, NULL),
(9, 11, 1, 'EX009', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-15 05:37:18', '2023-05-15 05:37:18', NULL, NULL, NULL, NULL),
(10, 12, 1, 'DT00023', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-15 11:12:55', '2023-05-15 11:12:55', NULL, NULL, NULL, NULL),
(11, 13, 1, 'EX011', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-15 15:48:27', '2023-05-15 15:48:27', NULL, NULL, NULL, NULL),
(12, 14, 1, 'EX012', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-16 05:36:16', '2023-05-16 05:36:16', NULL, NULL, NULL, NULL),
(13, 2, 2, 'EV001', '2023-05-18', '0006', 300000.00, 'Cash', NULL, 1, '2023-05-18 05:03:48', '2023-05-18 05:03:48', 2, NULL, NULL, NULL),
(14, 15, 1, 'EX013', '2023-05-20', '0007', 65000.00, 'Cash', NULL, 1, '2023-05-18 06:14:11', '2023-05-20 11:28:27', 2, NULL, NULL, NULL),
(15, 16, 1, 'EX014', NULL, NULL, NULL, NULL, NULL, 2, '2023-05-30 06:17:12', '2023-05-30 06:17:12', NULL, NULL, NULL, NULL),
(16, 17, 1, 'EX015', '2023-05-24', '0008', 50000.00, 'Bank', NULL, 1, '2023-05-30 11:21:53', '2023-05-30 11:55:33', 2, NULL, NULL, NULL),
(17, 18, 1, 'EX015', '2023-05-24', '0009', 30000.00, 'Cash', NULL, 1, '2023-05-31 05:30:57', '2023-05-31 05:41:12', 2, NULL, NULL, NULL),
(18, 19, 2, 'EV003', NULL, NULL, NULL, NULL, NULL, 2, '2023-06-19 08:53:46', '2023-06-19 08:53:46', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE `project_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `day_status` tinyint(4) NOT NULL DEFAULT 2,
  `sub_project_status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_types`
--

INSERT INTO `project_types` (`id`, `name`, `code`, `status`, `day_status`, `sub_project_status`, `created_at`, `updated_at`) VALUES
(1, 'Expo', 'Ex', 1, 2, 2, '2023-05-09 11:13:49', '2023-05-09 11:13:49'),
(2, 'Event', 'Ev', 1, 2, 2, '2023-05-09 11:14:04', '2023-05-09 11:14:04'),
(3, 'Flat Interior', 'FI', 1, 2, 2, '2023-05-09 11:14:15', '2023-05-09 11:14:15'),
(4, 'Production', 'P', 1, 2, 2, '2023-05-09 11:14:27', '2023-05-09 11:14:27'),
(5, 'Office Interior', 'OI', 1, 2, 2, '2023-05-09 11:14:43', '2023-05-09 11:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `project_vendors`
--

CREATE TABLE `project_vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `vendor_type_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `budget` int(11) NOT NULL DEFAULT 0,
  `advance` int(11) NOT NULL DEFAULT 0,
  `via` varchar(255) NOT NULL DEFAULT 'Cash',
  `bank_transaction_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_type` varchar(255) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_mobile` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `warehouse` varchar(255) DEFAULT NULL,
  `product_cost` double(16,2) NOT NULL DEFAULT 0.00,
  `transport_cost` double(12,2) NOT NULL DEFAULT 0.00,
  `labour_cost` double(12,2) NOT NULL DEFAULT 0.00,
  `total` double(16,2) NOT NULL DEFAULT 0.00,
  `discount` double(12,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `weight_in_mg` int(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `quantity` double(16,3) NOT NULL,
  `rate_per_gram` double(10,2) NOT NULL DEFAULT 0.00,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_items`
--

INSERT INTO `quotation_items` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Structure', 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages (40\' x20\')', 1, '2023-05-09 11:31:06', '2023-05-09 11:31:06'),
(2, 'Reciption table', 'Wooden & Board made reception table', 1, '2023-05-09 11:31:58', '2023-05-09 11:31:58'),
(3, 'Pipe', 'Pipe with setting and ms frame', 1, '2023-05-09 11:32:39', '2023-05-09 11:32:39'),
(4, 'Raised Floor', 'Raised Floor(40\' x20\') High raise floor', 1, '2023-05-09 11:33:00', '2023-05-09 11:33:00'),
(5, 'Cutout', 'Branding cutout', 1, '2023-05-09 11:33:42', '2023-05-09 11:33:42'),
(6, 'Acrylic Logo', 'Acrylic logo for inner wall', 1, '2023-05-09 11:37:05', '2023-05-09 11:37:05'),
(7, 'Rack', 'Board & Wooden Made Rack', 1, '2023-05-09 11:37:23', '2023-05-09 11:59:30'),
(8, 'Aclyric logo lettering', 'Aclyric logo lettering (Pipe wall) with board', 1, '2023-05-09 12:00:02', '2023-05-09 12:00:02'),
(9, 'Paint', 'All Paint Work', 1, '2023-05-09 12:00:52', '2023-05-09 12:00:52'),
(10, 'Carpet', 'Red Color Carpet', 1, '2023-05-09 12:01:16', '2023-05-09 12:01:16'),
(11, 'Grass Carpet', 'Green Color Grass Carpet', 1, '2023-05-09 12:01:45', '2023-05-09 12:01:45'),
(12, 'Sofa', 'Two Seater Sofa', 1, '2023-05-09 12:08:18', '2023-05-09 12:08:18'),
(13, 'Bar Tool', 'SS Stand Black Color Bar Tool', 1, '2023-05-09 12:09:00', '2023-05-09 12:09:00'),
(14, 'Tea Table', 'Round Tea Table With 8mm Clear Glass', 1, '2023-05-09 12:11:21', '2023-05-09 12:11:21'),
(15, 'Sofa Corner bo', 'Board Made Sofa Corner box', 1, '2023-05-09 12:11:56', '2023-05-09 12:11:56'),
(16, 'Light', 'Spot Light/Track Light/Streep Light', 1, '2023-05-09 12:13:32', '2023-05-09 12:13:32'),
(17, 'Chanel moving light', 'Chanel moving light', 1, '2023-05-09 12:14:13', '2023-05-09 12:14:13'),
(18, 'Strip Light', 'Strip light for raised floor', 1, '2023-05-09 12:14:43', '2023-05-09 12:14:43'),
(19, 'Strip Light', 'Strip light for product rack', 1, '2023-05-09 12:15:11', '2023-05-09 12:15:11'),
(20, 'Glass', 'Glass for rack', 1, '2023-05-09 12:15:26', '2023-05-09 12:15:26'),
(21, 'Sticker', 'Vinyle Sticker print With pest', 1, '2023-05-09 12:15:47', '2023-05-09 12:15:47'),
(22, 'Inject Sticker', 'Inject Sticker print with lamination and pesting', 1, '2023-05-09 12:16:29', '2023-05-09 12:16:29'),
(23, 'Brand Promoter', 'Brand Promoter for 3 days', 1, '2023-05-09 12:17:19', '2023-05-09 12:17:19'),
(24, 'Transportation', 'Transportation expenses', 1, '2023-05-09 12:18:40', '2023-05-09 12:18:40'),
(25, 'Lubber', 'Board Made Lubber', 1, '2023-05-09 12:20:04', '2023-05-09 12:20:04'),
(26, 'Acrylic Logo', 'Acrylic Logo (Navana)', 1, '2023-05-09 14:02:08', '2023-05-09 14:02:08'),
(27, 'Vinyle Print', 'Vinyle Print with sticker', 1, '2023-05-09 14:10:36', '2023-05-09 14:10:36'),
(28, 'Dismantle', 'Dismantle of stall', 1, '2023-05-09 14:12:00', '2023-05-09 14:12:00'),
(29, 'Design', 'Creative Design 2D & 3D', 1, '2023-05-10 07:56:03', '2023-05-10 07:56:03'),
(30, 'Invitation Card', 'Design & Creative (2D & 3D)', 1, '2023-05-10 08:35:39', '2023-05-10 08:35:39'),
(31, 'Project Unvail', 'Project opening unvail cutout with base', 1, '2023-05-10 09:01:56', '2023-05-10 09:01:56'),
(32, 'LED', 'Backdrop LED (20\'x10\')', 1, '2023-05-10 09:03:22', '2023-05-10 09:03:22'),
(33, 'Backdrop LED Wing', 'Backdrop LED Wing (6\'x10\')', 1, '2023-05-10 09:05:35', '2023-05-10 09:05:35'),
(34, 'Backdrop Frame Wing', '6\'x10\' Backdrop Frame Wing', 1, '2023-05-10 09:07:57', '2023-05-10 09:07:57'),
(35, 'Font Fesia', 'Stage Font Fesia', 1, '2023-05-10 09:09:03', '2023-05-10 09:09:03'),
(36, 'LED Wing', '8\'x6\' LED Wing', 1, '2023-05-10 09:10:31', '2023-05-10 09:10:31'),
(37, 'LED Wing Base', '8\'x3\' LED Wing Base', 1, '2023-05-10 09:12:30', '2023-05-10 09:12:30'),
(38, 'Board Frame', 'LED Wing Board Frame (10\'x11\')', 1, '2023-05-10 09:13:59', '2023-05-10 09:13:59'),
(39, 'Standee', '4\'x8\' Standee', 1, '2023-05-10 09:15:26', '2023-05-10 09:15:26'),
(40, 'Diamond Cut', 'Diamond Cut Cutout', 1, '2023-05-10 09:16:34', '2023-05-10 09:16:34'),
(41, 'Gate', 'Main Entrance, Hotel Entrance & Hall Room Entrance Gate', 1, '2023-05-10 09:23:40', '2023-05-10 09:23:40'),
(42, 'Welcome Booth', '12\'x8\' Welcome Booth with Mnemonic Cutout', 1, '2023-05-10 09:24:59', '2023-05-10 09:24:59'),
(43, 'Photo Booth', '12\'x8\' Photo Booth with Mnemonic Cutout', 1, '2023-05-10 09:26:12', '2023-05-10 09:26:12'),
(44, 'Indicator', 'Aero Shape Indicator', 1, '2023-05-10 09:27:51', '2023-05-10 09:27:51'),
(45, 'Facebook Live', 'Facebook Live Telecast', 1, '2023-05-10 09:29:03', '2023-05-10 09:29:03'),
(46, 'Online Switcher', 'Online Switcher for FB Live', 1, '2023-05-10 09:29:55', '2023-05-10 09:29:55'),
(47, 'Sound System', '4 Pair Sound System', 1, '2023-05-10 09:31:29', '2023-05-10 09:31:29'),
(48, 'Pyro & Confeti', 'Pyro & Confetti Set', 1, '2023-05-10 09:36:51', '2023-05-10 09:36:51'),
(49, 'Photography', 'Professional Photographer with Modern Equipment', 1, '2023-05-10 09:38:10', '2023-05-10 09:38:10'),
(50, 'Videoghaphy', 'Professional Videographer with Modern Equipment', 1, '2023-05-10 09:39:32', '2023-05-10 09:39:32'),
(51, 'EMC', 'Female EMC', 1, '2023-05-10 09:40:28', '2023-05-10 09:40:28'),
(52, 'Usher', 'Female Usher', 1, '2023-05-10 09:41:06', '2023-05-10 09:41:06'),
(53, 'Costume', 'Costume for Female Usher (Orange Sharee)', 1, '2023-05-10 09:47:06', '2023-05-10 09:47:06'),
(54, 'ID Card', 'ID Card with lase and opening fabrics, lase', 1, '2023-05-10 09:48:24', '2023-05-10 09:48:24'),
(55, 'Flower Stick', 'Flower stick for all guests', 1, '2023-05-10 09:50:29', '2023-05-10 09:50:29'),
(56, 'Flower Bucket', 'Flower bucket for all guests & delegates', 1, '2023-05-10 09:51:01', '2023-05-10 09:51:01'),
(57, 'Backdrop Banner', 'Stage Backdrop Banner', 1, '2023-05-10 10:22:30', '2023-05-10 10:22:30'),
(58, 'Stage Wing', 'Black Media Stage Wing PVC (2pc)', 1, '2023-05-10 10:36:02', '2023-05-10 10:36:02'),
(59, 'Member Banner', 'Alumni Committee Black Media PVC (2pc)', 1, '2023-05-10 10:47:27', '2023-05-10 10:47:27'),
(60, 'Gate Banner', 'Bus Stand Gate black media pvc', 1, '2023-05-10 10:50:16', '2023-05-10 10:50:16'),
(61, 'Registration Booth Banner', 'Online Registration Booth Black Media Pvc', 1, '2023-05-10 10:53:13', '2023-05-10 10:53:13'),
(62, 'Vinyl Sticker', 'Vinyl Sticker with lamination & 3mm pvc pesting', 1, '2023-05-10 10:54:48', '2023-05-10 10:54:48'),
(63, 'PVC Print', 'Black media PVC print & Inject sticker print with pasting.', 1, '2023-05-10 14:47:22', '2023-05-10 14:47:22'),
(64, 'Chair', 'Tulip Chair for the stall.', 1, '2023-05-10 14:50:28', '2023-05-10 14:50:28'),
(65, 'LED Screen', '20\'x8\' LED Screen with wooden frame.', 1, '2023-05-10 14:51:56', '2023-05-10 14:51:56'),
(66, 'LED TV', '43\" LED TV', 1, '2023-05-10 14:56:55', '2023-05-10 14:56:55'),
(67, 'Glass Wall', 'Glass wall with frosted paper.', 1, '2023-05-10 14:57:55', '2023-05-10 14:57:55'),
(68, 'Cutout Logo', 'Cutout Loto', 1, '2023-05-10 15:00:02', '2023-05-10 15:00:02'),
(69, 'Brochure Stand', 'Stainless steel Brochure Stand', 1, '2023-05-10 15:01:09', '2023-05-10 15:01:09'),
(70, 'Tree', 'Natural & Artificial Trees', 1, '2023-05-10 15:01:40', '2023-05-10 15:01:40'),
(71, 'Painting Canvas', 'Drawing Easels for Painting Canvas', 1, '2023-05-11 06:51:36', '2023-05-11 06:51:36'),
(72, 'Table', 'Laptop Table', 1, '2023-05-11 06:54:02', '2023-05-11 06:54:02'),
(73, 'Tube', 'Acrylic Clear Tube', 1, '2023-05-11 12:02:54', '2023-05-11 12:02:54'),
(74, 'Base', 'Base for Tube', 1, '2023-05-11 12:08:58', '2023-05-11 12:08:58'),
(75, 'Supervision Charge', 'Agency supervision charge', 1, '2023-05-14 06:30:39', '2023-05-14 06:30:39'),
(76, 'Floor Mat', 'Wooden color mat', 1, '2023-05-14 10:13:29', '2023-05-14 10:13:29'),
(77, 'Side Wall Cutout', '4\' x 2\' Side Wall Cutout', 1, '2023-05-14 10:19:25', '2023-05-14 10:19:25'),
(78, 'Basketball Running Way', 'Board & Wooden made with soft floor mat  Running Way', 1, '2023-05-15 10:43:25', '2023-05-15 10:43:25'),
(79, 'MS Pipe', '4 Inches & 2 Inches MS Pipe for ceiling.', 1, '2023-05-15 10:59:58', '2023-05-15 10:59:58'),
(80, 'Dart Board', 'Dart board for back wall', 1, '2023-05-15 11:01:26', '2023-05-15 11:01:26'),
(81, 'Basketball Hoop', 'Basketball Hoop for back wall', 1, '2023-05-15 11:02:21', '2023-05-15 11:02:21'),
(82, 'Question Mark Standee', 'Board & Wooden Made Question Mark Standee', 1, '2023-05-15 11:04:51', '2023-05-15 11:04:51'),
(83, 'Golf Court', 'One Golf Court', 1, '2023-05-15 15:31:09', '2023-05-15 15:31:09'),
(84, 'Additional Expense', 'One Additional PVC Print (16\' x 8\') & Carpenter Cost, Transportation & All other accessories.', 1, '2023-05-21 08:24:36', '2023-05-21 08:24:36'),
(85, 'Product Base', 'Board & Wood made product base table.', 1, '2023-05-30 11:45:07', '2023-05-30 11:45:07'),
(86, 'Round Table', 'Round high glass table', 1, '2023-05-30 11:48:24', '2023-05-30 11:48:24'),
(87, 'Additional Work', 'Additional Structure, paint work, light work, PVC & Sticker and others logistics', 1, '2023-06-06 09:05:42', '2023-06-06 09:05:42'),
(88, 'Stage Backdrop', 'The size is 24 ft X 8 ft Good quality 4 pass print in Black Media and wooden framed.', 1, '2023-06-19 08:48:59', '2023-06-19 08:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_units`
--

CREATE TABLE `quotation_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_units`
--

INSERT INTO `quotation_units` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Square Feet', 'sq. ft.', 1, '2023-04-01 16:23:30', '2023-04-01 16:23:30'),
(2, 'KB', 'KB', 1, '2023-05-03 14:21:16', '2023-05-03 14:21:16'),
(3, 'Peice', 'Pcs', 1, '2023-05-03 14:23:56', '2023-05-10 06:33:06'),
(4, 'Galon', 'Galon', 1, '2023-05-09 11:17:59', '2023-05-10 06:33:15'),
(5, 'Person', 'Person', 1, '2023-05-09 11:18:09', '2023-05-10 06:34:01'),
(6, 'Set', 'Set', 1, '2023-05-09 11:18:36', '2023-05-09 11:18:36'),
(7, 'Package', 'Package', 1, '2023-05-09 11:19:06', '2023-05-09 11:19:06'),
(8, 'Job', 'Job', 1, '2023-05-10 06:32:18', '2023-05-10 06:32:18'),
(9, 'Pair', 'Pair', 1, '2023-05-10 06:34:35', '2023-05-10 06:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `raw_quotations`
--

CREATE TABLE `raw_quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_type_id` int(11) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `proposal_date` date DEFAULT NULL,
  `quotation_no` varchar(255) DEFAULT NULL,
  `quotation_title` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `contact_person_designation` varchar(255) DEFAULT NULL,
  `contact_person_number` varchar(255) DEFAULT NULL,
  `signatory_id` int(11) DEFAULT NULL,
  `mode_of_payment` mediumtext DEFAULT NULL,
  `bill_type` varchar(255) DEFAULT NULL,
  `terms_and_conditions` mediumtext DEFAULT NULL,
  `payment_conditions` longtext DEFAULT NULL,
  `proposed_total_amount` int(11) DEFAULT NULL,
  `approved_total_amount` int(11) DEFAULT NULL,
  `vat_type` varchar(255) DEFAULT NULL,
  `vat_amount` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_quotations`
--

INSERT INTO `raw_quotations` (`id`, `creator_id`, `client_id`, `project_type_id`, `project_name`, `proposal_date`, `quotation_no`, `quotation_title`, `contact_person`, `contact_person_designation`, `contact_person_number`, `signatory_id`, `mode_of_payment`, `bill_type`, `terms_and_conditions`, `payment_conditions`, `proposed_total_amount`, `approved_total_amount`, `vat_type`, `vat_amount`, `status`, `created_at`, `updated_at`, `bank_account_id`) VALUES
(1, 1, 2, 1, 'Stall Installation IPF Fair', '2023-05-09', 'EX001', 'Stall Installation IPF Fair 2023', 'Selim Ullah', 'Managing Director', '01711000000', 2, NULL, 'Detail', '<p>1. 70% Advance Payment along with work order.</p><p>2. 20% Payment When starting the project.</p><p>3. Rest payment will be made after completing the project.</p><p>4. All are on a rental basis.</p><p><br></p>', NULL, 697915, NULL, 'excluding', 0, 3, '2023-05-09 11:13:10', '2023-05-10 07:34:52', NULL),
(2, 1, 3, 2, 'JBS Corporate Night-2023', '2023-05-01', 'EV001', 'JBS Corporate Night Program (Venue Branding)', 'Mr. Mamun', 'Manager', '01711000000', 1, NULL, 'Detail', '<p>1. 70% Advance payment along with work order.</p><p>2. Rest amount of 30% will be made after completing the work.</p><p><br></p>', NULL, 695540, NULL, 'excluding', 0, 1, '2023-05-09 14:58:50', '2023-05-18 05:03:48', NULL),
(3, 1, 4, 2, 'EID Reunion Program', '2023-04-15', 'EV002', 'Branding of  EID Reunion Program-2023', 'Md. Israfil Masud', 'General Secretary', '01818914811', 1, NULL, 'Detail', '<p>1. 70% Advance payment along with work order.</p><p>2. Rest 30 amount will be made after completing the event. </p>', NULL, 22382, NULL, 'excluding', 0, 1, '2023-05-10 10:09:44', '2023-05-13 04:54:11', NULL),
(4, 1, 1, 1, 'WPSA Fair- 2023', '2023-03-02', 'EX002', 'Stall Installation of WPSA Fair- 2023 (48\'x16\')', 'Mr. Turaj', 'Concern', '01686011965', 1, NULL, 'Lump sum', '<p>1. 70% Advance has to make along with work order.</p><p>2. 30% payment during the project implementation.</p><p>3. All equipment are rental base.&nbsp;</p><p>4. All prices Excluding VAT and Tax.&nbsp;</p>', NULL, 700000, NULL, 'excluding', 0, 1, '2023-05-10 13:30:08', '2023-05-11 12:16:35', NULL),
(5, 1, 1, 1, 'Lit Fest-2023', '2023-01-04', 'EX003', 'Stall Installation of Lit fest-2023', 'Mr. Turaj', 'Concern', '01686011965', 1, NULL, 'Lump sum', '<p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">1. 70% Advance has to make along with work order.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">2. 30% payment during the project implementation.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">3. All equipment are rental base.&nbsp;</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">4. All prices Excluding VAT and Tax.&nbsp;</p>', NULL, 174000, NULL, 'excluding', 0, 1, '2023-05-11 06:29:32', '2023-05-12 10:41:24', NULL),
(6, 1, 1, 1, 'Hope Fest-2023', '2023-02-02', 'EX004', 'Stall Logistics Support', 'Mr. Turaj', 'Concern', '01686011965', 1, NULL, 'Lump sum', '<p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">1. 70% Advance has to make along with work order.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">2. 30% payment during the project implementation.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">3. All equipment are rental base.&nbsp;</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">4. All prices Excluding VAT and Tax.</p>', NULL, 114000, NULL, 'excluding', 0, 1, '2023-05-11 07:01:21', '2023-05-12 10:41:51', NULL),
(7, 1, 6, 1, 'Dhaka Travel Mart-2023', '2023-05-14', 'EX005', 'Dhaka Travel Mart-2023 (Air Asia 16\'x8\')', 'MD. IMRAN HAROON', 'Senior Executive, Marketing & Branding', '01321203277', 1, NULL, 'Detail', '<p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">1. 70% Advance payment along with work order.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">2. Rest amount of 30% will be made after completing the work.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">3. All equipment are rental base.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">4. All prices excluding VAT & Tax </p>', NULL, 203180, NULL, 'excluding', 0, 3, '2023-05-11 14:09:21', '2023-05-14 10:10:57', NULL),
(8, 1, 7, 1, 'Dhaka Travel Mart-2023', '2023-05-14', 'EX006', 'Dhaka Travel Mart-2023 (Galaxy 16\' x 16)', 'Mr. Aminur Rahman Sarkar', 'In Charge, Business Intelligence', '01755555101', 1, NULL, 'Lump sum', '<p>1. 70% Advance payment along with work order.<br>\r\n2. Rest amount of 30% will be made after completing the work.<br>\r\n3. All equipment are rental base.<br>\r\n4. All prices excluding VAT &amp; Tax </p>', NULL, 276855, NULL, 'excluding', 0, 3, '2023-05-14 10:04:33', '2023-05-14 11:34:36', NULL),
(9, 1, 7, 1, 'Dhaka Travel Mart-2023', '2023-05-14', 'EX007', 'Dhaka Travel Mart-2023 (Bluesky 16\' x 8\')', 'Mr. Aminur Rahman Sarkar', 'Taj Marriot, 5th Floor, 25 Gulshan Avenue, Dhaka-1212', '01755555101', 1, NULL, 'Lump sum', '<p><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">4. All prices excluding VAT &amp; Tax</span><br></p>', NULL, 143710, NULL, 'excluding', 0, 3, '2023-05-14 11:28:02', '2023-05-14 12:01:32', NULL),
(10, 1, 8, 1, 'Dhaka Travel Mart-2023', '2023-05-21', 'EX008', 'Dhaka Travel Mart-2023 DERA 16\' x 8\' (Final)', 'Mr. Mahfuzur Rahman', 'Concern', '01913531380', 2, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT & Tax</span><br></p>', NULL, 100000, NULL, 'excluding', 0, 1, '2023-05-14 13:04:31', '2023-06-19 07:16:44', NULL),
(11, 1, 9, 1, 'Bogra Meditex Expo-2023', '2023-05-15', 'EX009', 'Bogra Meditex Expo-2023 (Transcom 20\' x 10\')', 'Managing Director', 'Concern', '.', 1, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT &amp; Tax</span><br></p>', NULL, 228302, NULL, 'excluding', 0, 3, '2023-05-15 05:01:48', '2023-05-15 06:13:39', NULL),
(12, 1, 10, 1, 'Stall Installation', '2023-05-15', 'DT00023', 'Stall Installation for DOT CREAT (25\' x 12\')', '...........', 'Concern', '.', 1, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT & Tax</span><br></p>', NULL, 132500, NULL, 'excluding', 0, 3, '2023-05-15 10:26:24', '2023-05-30 11:40:02', NULL),
(13, 1, 11, 1, 'Dhaka Meditex Expo-2023', '2023-05-15', 'EX011', 'Dhaka Meditex Expo-2023 (Telerad 16\' x 16\')', 'Mr. Moktar', 'Concern', '.', 1, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT &amp; Tax</span><br></p>', NULL, 122080, NULL, 'excluding', 0, 3, '2023-05-15 15:45:23', '2023-05-16 08:41:38', NULL),
(14, 1, 9, 1, 'Bogra Expo-2023', '2023-05-16', 'EX012', 'Bogra Meditex Expo-2023 (Transcom 20\' x 10\')', 'Mr. Monjurul', 'Concern', '01711790424', 1, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT & Tax</span></p><p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><br></span><br></p>', NULL, 130788, NULL, 'excluding', 0, 3, '2023-05-16 05:27:48', '2023-05-16 06:10:32', NULL),
(15, 1, 12, 1, 'Dhaka Meditex Expo-2023', '2023-05-30', 'EX013', 'Dhaka Meditex Expo-2023 (32\' x 8\')', '...', 'Managing Director', '.', 2, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT & Tax</span><br></p>', NULL, 135010, NULL, 'excluding', 0, 1, '2023-05-18 06:07:26', '2023-06-06 10:41:57', NULL),
(16, 1, 14, 5, 'BD Finance Stall Installation', '2023-05-20', 'EX014', 'Stall Installation for Bangladesh Finance Ltd (25\' x 10\')', 'Managing Director', '.', '.', 1, NULL, 'Lump sum', '<p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">1. 70% Advance Payment along with work order.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">2. 20% Payment When starting the project.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">3. Rest payment will be made after completing the project.</p><p style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px; margin-bottom: 5px !important;\">4. All are on a rental basis.</p>', NULL, 0, NULL, 'excluding', 0, 3, '2023-05-20 06:53:51', '2023-05-30 11:19:25', NULL),
(17, 1, 14, 1, 'Dhaka Meditex Expo-2023', '2023-05-31', 'EX015', 'Stall Installation of Dhaka Meditex-2023  (Transba (24\' x 8\')', 'Managing Director', '.', '.', 1, NULL, 'Lump sum', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT & Tax</span><br></p>', NULL, 130000, NULL, 'excluding', 0, 1, '2023-05-30 11:17:20', '2023-05-31 05:24:47', NULL),
(18, 1, 15, 1, 'Dhaka Meditex Expo-2023', '2023-04-30', 'EX015', 'Stall Installation of Meditex Expo-2023 (Transco 20\' x 10\')', 'Managing Director', '.', '.', 1, NULL, 'Lump sum', '<p><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"color: rgb(0, 0, 0); font-family: SolaimanLipi, sans-serif; font-size: 15px;\">4. All prices excluding VAT &amp; Tax</span><br></p>', NULL, 80000, NULL, 'excluding', 0, 1, '2023-05-31 05:27:16', '2023-05-31 05:41:12', NULL),
(19, 1, 16, 2, ': Smart App Interface Launching', '2023-06-19', 'EV003', 'Smart App Interface Launching', 'Mohsin Reza Maruf', 'Brand Communication', '.', 1, NULL, 'Detail', '<p><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">1. 70% Advance payment along with work order.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">2. Rest amount of 30% will be made after completing the work.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">3. All equipment are rental base.</span><br style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\"><span style=\"font-family: SolaimanLipi, sans-serif; color: rgb(0, 0, 0); font-size: 15px;\">4. All prices excluding VAT &amp; Tax</span><br></p>', NULL, 14200, NULL, 'excluding', 0, 3, '2023-05-31 14:51:55', '2023-06-19 08:53:46', NULL),
(20, 1, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2023-06-26 16:49:09', '2023-06-26 16:49:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `raw_quotation_details`
--

CREATE TABLE `raw_quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `raw_quotation_id` int(11) NOT NULL,
  `sub_project_id` int(11) DEFAULT NULL,
  `quotation_item_id` int(11) DEFAULT NULL,
  `item_description` longtext DEFAULT NULL,
  `quotation_unit_id` int(11) DEFAULT NULL,
  `no_of_day` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` float(10,2) DEFAULT NULL,
  `proposed_amount` int(11) DEFAULT NULL,
  `approved_amount` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_quotation_details`
--

INSERT INTO `raw_quotation_details` (`id`, `raw_quotation_id`, `sub_project_id`, `quotation_item_id`, `item_description`, `quotation_unit_id`, `no_of_day`, `quantity`, `rate`, `proposed_amount`, `approved_amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages (40\' x20\')', 1, 4, 1955, 85.00, 166175, NULL, 1, '2023-05-09 11:39:13', '2023-05-09 13:54:54'),
(2, 1, NULL, 2, 'Wooden & Board made reception table', 3, 4, 1, 7000.00, 7000, NULL, 1, '2023-05-09 13:55:24', '2023-05-09 13:55:24'),
(3, 1, NULL, 3, 'Pipe with setting and ms frame', 6, 4, 1, 105000.00, 105000, NULL, 1, '2023-05-09 13:56:21', '2023-05-09 13:56:21'),
(4, 1, NULL, 4, 'Raised Floor(40\' x20\') High raise floor', 3, 4, 1100, 60.00, 66000, NULL, 1, '2023-05-09 13:56:54', '2023-05-09 13:56:54'),
(5, 1, NULL, 5, 'Branding cutout', 1, 4, 50, 120.00, 6000, NULL, 1, '2023-05-09 13:57:21', '2023-05-09 13:57:21'),
(6, 1, NULL, 6, 'Acrylic logo for inner wall', 3, 4, 3, 8000.00, 24000, NULL, 1, '2023-05-09 13:57:50', '2023-05-09 13:57:50'),
(7, 1, NULL, 7, 'Board & Wooden Made Rack', 1, 4, 550, 125.00, 68750, NULL, 1, '2023-05-09 13:58:19', '2023-05-09 13:58:19'),
(8, 1, NULL, 8, 'Aclyric logo lettering (Pipe wall) with board', 3, 4, 2, 15000.00, 30000, NULL, 1, '2023-05-09 14:00:39', '2023-05-09 14:00:39'),
(9, 1, NULL, 26, 'Acrylic Logo (Navana)', 3, 4, 2, 12000.00, 24000, NULL, 1, '2023-05-09 14:02:44', '2023-05-09 14:02:44'),
(10, 1, NULL, 9, 'All Paint Work', 1, 4, 1955, 20.00, 39100, NULL, 1, '2023-05-09 14:03:29', '2023-05-09 14:03:29'),
(11, 1, NULL, 10, 'Red Color Carpet', 1, 4, 800, 35.00, 28000, NULL, 1, '2023-05-09 14:04:05', '2023-05-09 14:04:05'),
(12, 1, NULL, 12, 'Two Seater Sofa', 3, 4, 2, 1800.00, 3600, NULL, 1, '2023-05-09 14:04:31', '2023-05-09 14:04:31'),
(13, 1, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 4, 4, 800.00, 3200, NULL, 1, '2023-05-09 14:04:54', '2023-05-09 14:04:54'),
(14, 1, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 4, 1, 2500.00, 2500, NULL, 1, '2023-05-09 14:05:13', '2023-05-09 14:05:29'),
(15, 1, NULL, 15, 'Board Made Sofa Corner box', 3, 4, 1, 3000.00, 3000, NULL, 1, '2023-05-09 14:05:54', '2023-05-09 14:05:54'),
(16, 1, NULL, 16, 'Spot Light/Track Light/Streep Light', 3, 4, 80, 250.00, 20000, NULL, 1, '2023-05-09 14:06:40', '2023-05-09 14:06:40'),
(17, 1, NULL, 17, 'Chanel moving light', 3, 4, 2, 7000.00, 14000, NULL, 1, '2023-05-09 14:07:11', '2023-05-09 14:07:11'),
(18, 1, NULL, 18, 'Strip light for raised floor', 7, 4, 1, 10000.00, 10000, NULL, 1, '2023-05-09 14:07:42', '2023-05-09 14:07:42'),
(19, 1, NULL, 19, 'Strip light for product rack', 7, 4, 1, 15000.00, 15000, NULL, 1, '2023-05-09 14:08:08', '2023-05-09 14:08:08'),
(20, 1, NULL, 20, 'Glass for rack', 7, 4, 1, 10000.00, 10000, NULL, 1, '2023-05-09 14:08:41', '2023-05-09 14:08:41'),
(21, 1, NULL, 27, 'Vinyle Print with sticker', 1, 4, 902, 45.00, 40590, NULL, 1, '2023-05-09 14:10:58', '2023-05-09 14:10:58'),
(22, 1, NULL, 24, 'Transportation expenses', 7, 4, 1, 8000.00, 8000, NULL, 1, '2023-05-09 14:11:27', '2023-05-09 14:11:27'),
(23, 1, NULL, 28, 'Dismantle of stall', 7, 4, 1, 4000.00, 4000, NULL, 1, '2023-05-09 14:13:47', '2023-05-09 14:13:47'),
(24, 2, NULL, 29, 'Creative Design 2D & 3D', 8, 0, 1, 20000.00, 20000, NULL, 1, '2023-05-10 08:31:04', '2023-05-10 08:31:04'),
(25, 2, NULL, 30, 'Invitation Card print with envelope', NULL, 0, 350, 30.00, 10500, NULL, 1, '2023-05-10 08:36:24', '2023-05-10 08:37:09'),
(26, 2, NULL, 31, 'Project opening unvail cutout with base', 3, 0, 1, 5000.00, 5000, NULL, 1, '2023-05-10 09:02:15', '2023-05-10 09:02:15'),
(27, 2, NULL, 32, 'Backdrop LED (20\'x10\')', 1, 0, 200, 350.00, 70000, NULL, 1, '2023-05-10 09:03:57', '2023-05-10 09:03:57'),
(28, 2, NULL, 33, 'Backdrop LED Wing (6\'x10\')', 1, 0, 120, 75.00, 9000, NULL, 1, '2023-05-10 09:07:02', '2023-05-10 09:07:02'),
(29, 2, NULL, 34, '6\'x10\' Backdrop Frame Wing', NULL, 0, 4, 9000.00, 36000, NULL, 1, '2023-05-10 09:08:22', '2023-05-10 09:08:22'),
(30, 2, NULL, 35, 'Stage Font Fesia', 1, 0, 204, 75.00, 15300, NULL, 1, '2023-05-10 09:09:37', '2023-05-10 09:09:37'),
(31, 2, NULL, 36, '8\'x6\' LED Wing', 1, 0, 96, 350.00, 33600, NULL, 1, '2023-05-10 09:11:22', '2023-05-10 09:11:22'),
(32, 2, NULL, 37, '8\'x3\' LED Wing Base', 3, 0, 2, 4000.00, 8000, NULL, 1, '2023-05-10 09:13:10', '2023-05-10 09:13:10'),
(33, 2, NULL, 38, 'LED Wing Board Frame (10\'x11\')', 1, 0, 144, 110.00, 15840, NULL, 1, '2023-05-10 09:14:39', '2023-05-10 09:14:39'),
(34, 2, NULL, 39, '4\'x8\' Standee', 3, 0, 14, 2500.00, 35000, NULL, 1, '2023-05-10 09:15:58', '2023-05-10 09:15:58'),
(35, 2, NULL, 40, 'Diamond Cut Cutout', 3, 0, 20, 650.00, 13000, NULL, 1, '2023-05-10 09:17:06', '2023-05-10 09:17:06'),
(36, 2, NULL, 41, 'Main Entrance, Hotel Entrance & Hall Room Entrance Gate', 6, 0, 3, 20000.00, 60000, NULL, 1, '2023-05-10 09:24:04', '2023-05-10 09:24:04'),
(37, 2, NULL, 42, '12\'x8\' Welcome Booth with Mnemonic Cutout', 3, 0, 1, 7000.00, 7000, NULL, 1, '2023-05-10 09:25:26', '2023-05-10 09:25:26'),
(38, 2, NULL, 43, '12\'x8\' Photo Booth with Mnemonic Cutout', 3, 0, 1, 12000.00, 12000, NULL, 1, '2023-05-10 09:26:46', '2023-05-10 09:26:46'),
(39, 2, NULL, 5, 'Branding cutout', 3, 0, 2, 4500.00, 9000, NULL, 1, '2023-05-10 09:27:21', '2023-05-10 09:27:21'),
(40, 2, NULL, 44, 'Aero Shape Indicator', 3, 0, 4, 1200.00, 4800, NULL, 1, '2023-05-10 09:28:22', '2023-05-10 09:28:22'),
(41, 2, NULL, 45, 'Facebook Live Telecast', 8, 0, 1, 15000.00, 15000, NULL, 1, '2023-05-10 09:29:23', '2023-05-10 09:30:34'),
(42, 2, NULL, 46, 'Online Switcher for FB Live', 8, 0, 1, 10000.00, 10000, NULL, 1, '2023-05-10 09:30:48', '2023-05-10 09:30:48'),
(43, 2, NULL, 47, '4 Pair Sound System', 9, 0, 4, 12000.00, 48000, NULL, 1, '2023-05-10 09:31:53', '2023-05-10 09:31:53'),
(44, 2, NULL, 16, 'Sharfee, Parkan, Laser with full set', 6, 0, 1, 80000.00, 80000, NULL, 1, '2023-05-10 09:32:45', '2023-05-10 09:36:05'),
(45, 2, NULL, 48, 'Pyro & Confetti Set', 7, 0, 1, 20000.00, 20000, NULL, 1, '2023-05-10 09:37:09', '2023-05-10 09:37:09'),
(46, 2, NULL, 49, 'Professional Photographer with Modern Equipment', 3, 0, 1, 8000.00, 8000, NULL, 1, '2023-05-10 09:38:50', '2023-05-10 09:38:50'),
(47, 2, NULL, 50, 'Professional Videographer with Modern Equipment', 3, 0, 2, 10000.00, 20000, NULL, 1, '2023-05-10 09:40:07', '2023-05-10 09:56:36'),
(48, 2, NULL, 51, 'Female EMC', 5, 0, 1, 35000.00, 35000, NULL, 1, '2023-05-10 09:40:50', '2023-05-10 09:40:50'),
(49, 2, NULL, 52, 'Female Usher', 5, 0, 6, 3000.00, 18000, NULL, 1, '2023-05-10 09:41:32', '2023-05-10 09:41:32'),
(50, 2, NULL, 53, 'Costume for Female Usher (Orange Sharee)', 5, 0, 6, 1000.00, 6000, NULL, 1, '2023-05-10 09:47:29', '2023-05-10 09:47:29'),
(51, 2, NULL, 54, 'ID Card with lase and opening fabrics, lase', 8, 0, 1, 1500.00, 1500, NULL, 1, '2023-05-10 09:48:52', '2023-05-10 09:48:52'),
(52, 2, NULL, 55, 'Flower stick for all guests', 3, 0, 300, 50.00, 15000, NULL, 1, '2023-05-10 09:52:53', '2023-05-10 09:52:53'),
(53, 2, NULL, 56, 'Flower bucket for all guests & delegates', 3, 0, 10, 3000.00, 30000, NULL, 1, '2023-05-10 09:53:16', '2023-05-10 09:53:16'),
(54, 2, NULL, 24, 'Carrying & Lifting', 8, 0, 1, 25000.00, 25000, NULL, 1, '2023-05-10 09:53:37', '2023-05-10 09:53:58'),
(55, 3, NULL, 57, 'Black Media Stage Backdrop Banner PVC', 1, 0, 112, 26.00, 2912, NULL, 1, '2023-05-10 10:28:39', '2023-05-10 10:38:52'),
(56, 3, NULL, 58, 'Black Media Stage Wing PVC (2pc)', 1, 0, 80, 26.00, 2080, NULL, 1, '2023-05-10 10:37:26', '2023-05-10 10:37:26'),
(57, 3, NULL, 39, '4\'x8\' Black Media Standee PVC (4pc)', 1, 0, 128, 26.00, 3328, NULL, 1, '2023-05-10 10:38:21', '2023-05-10 10:46:26'),
(58, 3, NULL, 59, 'Alumni Committee Black Media PVC (2pc)', 1, 0, 44, 26.00, 1144, NULL, 1, '2023-05-10 10:47:57', '2023-05-10 10:48:26'),
(59, 3, NULL, 35, 'Stage Font Fesia', 1, 0, 72, 26.00, 1872, NULL, 1, '2023-05-10 10:49:32', '2023-05-10 10:49:32'),
(60, 3, NULL, 60, 'Bus Stand School Road Gate black media pvc (2pc)', 1, 0, 75, 26.00, 1950, NULL, 1, '2023-05-10 10:50:37', '2023-05-10 10:51:44'),
(61, 3, NULL, 43, '12\'x8\' Photo Booth Black media pvc', 1, 0, 96, 26.00, 2496, NULL, 1, '2023-05-10 10:52:09', '2023-05-10 10:52:34'),
(62, 3, NULL, 61, 'Online Registration Booth Black Media Pvc', 1, 0, 15, 26.00, 390, NULL, 1, '2023-05-10 10:53:32', '2023-05-10 10:53:32'),
(63, 3, NULL, 62, 'Vinyl Sticker with lamination & 3mm pvc pesting', 1, 0, 7, 30.00, 210, NULL, 1, '2023-05-10 10:56:29', '2023-05-10 10:56:29'),
(64, 3, NULL, 29, 'Creative Design Charge', 8, 0, 1, 6000.00, 6000, NULL, 1, '2023-05-10 10:56:51', '2023-05-10 10:57:10'),
(65, 4, NULL, 4, '3/4 ply board raised floor (48\'x16\') with wooden frame.', 1, 3, 768, 76.00, 58368, NULL, 1, '2023-05-10 14:33:43', '2023-05-10 15:04:01'),
(66, 4, NULL, 10, 'Red Color Carpet', 1, 3, 768, 30.00, 23040, NULL, 1, '2023-05-10 14:36:54', '2023-05-10 14:36:54'),
(67, 4, NULL, 1, 'Back wall- 6mm gorjon ply board & wooden frame. Side wall- 6mm gorjon ply board with wooden framej & ceiling- 6mm gorjon ply board wihg wooden frame.', 7, 3, 1, 300000.00, 300000, NULL, 1, '2023-05-10 14:39:33', '2023-05-10 14:42:30'),
(68, 4, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 8, 3, 1, 50000.00, 50000, NULL, 1, '2023-05-10 14:48:01', '2023-05-10 15:03:23'),
(69, 4, NULL, 2, 'Wooden & Board made reception table', 3, 3, 3, 8000.00, 24000, NULL, 1, '2023-05-10 14:48:44', '2023-05-10 14:48:44'),
(70, 4, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 3, 3, 3000.00, 9000, NULL, 1, '2023-05-10 14:49:17', '2023-05-10 14:49:17'),
(71, 4, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 3, 1500.00, 4500, NULL, 1, '2023-05-10 14:50:50', '2023-05-10 14:50:50'),
(72, 4, NULL, 65, '20\'x8\' LED Screen with wooden frame.', 1, 0, 160, 250.00, 40000, NULL, 1, '2023-05-10 14:53:35', '2023-05-10 14:53:35'),
(73, 4, NULL, 12, 'Two Seater Sofa', 3, 3, 2, 2000.00, 4000, NULL, 1, '2023-05-10 14:55:38', '2023-05-10 14:55:38'),
(74, 4, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 4, 3000.00, 12000, NULL, 1, '2023-05-10 14:56:31', '2023-05-10 14:56:31'),
(75, 4, NULL, 66, '43\" LED TV', 3, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-10 14:57:12', '2023-05-10 14:57:12'),
(76, 4, NULL, 67, 'Glass wall with frosted paper.', 7, 3, 1, 60000.00, 60000, NULL, 1, '2023-05-10 14:58:20', '2023-05-10 14:58:20'),
(77, 4, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 17000.00, 17000, NULL, 1, '2023-05-10 14:58:52', '2023-05-10 15:05:11'),
(78, 4, NULL, 6, 'Acrylic logo for inner wall', 6, 3, 4, 8500.00, 34000, NULL, 1, '2023-05-10 14:59:20', '2023-05-10 15:04:23'),
(79, 4, NULL, 5, 'Branding cutout', 6, 3, 3, 5500.00, 16500, NULL, 1, '2023-05-10 15:00:25', '2023-05-10 15:04:54'),
(80, 4, NULL, 69, 'Stainless steel Brochure Stand', 3, 3, 2, 4500.00, 9000, NULL, 1, '2023-05-10 15:02:07', '2023-05-10 15:02:07'),
(81, 4, NULL, 70, 'Natural & Artificial Trees', 3, 3, 2, 10000.00, 20000, NULL, 1, '2023-05-10 15:02:32', '2023-05-10 15:02:32'),
(82, 4, NULL, 24, 'Transportation expenses', 8, 3, 1, 11592.00, 11592, NULL, 1, '2023-05-10 15:02:53', '2023-05-10 15:06:17'),
(83, 5, NULL, 1, 'Wooden & Board Wall, Side Wall and Ceiling with carpenter wages (16\' x8\')', 1, 3, 128, 450.00, 57600, NULL, 1, '2023-05-11 06:35:58', '2023-05-11 06:59:05'),
(84, 5, NULL, 4, '16\' x8 Raised Floor', 1, 3, 128, 80.00, 10240, NULL, 1, '2023-05-11 06:37:21', '2023-05-11 06:57:06'),
(85, 5, NULL, 10, 'Ash Color Carpet', 1, 3, 128, 40.00, 5120, NULL, 1, '2023-05-11 06:38:52', '2023-05-11 06:46:32'),
(86, 5, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 7, 3, 1, 17000.00, 17000, NULL, 1, '2023-05-11 06:41:11', '2023-05-11 06:59:41'),
(88, 5, NULL, 66, '42\" LED TV', 3, 3, 1, 10000.00, 10000, NULL, 1, '2023-05-11 06:42:19', '2023-05-11 07:23:39'),
(89, 5, NULL, 68, 'Cutout Loto', 3, 3, 2, 10000.00, 20000, NULL, 1, '2023-05-11 06:42:53', '2023-05-11 06:59:14'),
(90, 5, NULL, 16, 'Spot Light, Track Light & Hanging Light', 7, 3, 1, 18500.00, 18500, NULL, 1, '2023-05-11 06:43:24', '2023-05-11 06:57:48'),
(91, 5, NULL, 6, 'Acrylic logo & Setup', 6, 3, 1, 15000.00, 15000, NULL, 1, '2023-05-11 06:44:42', '2023-05-11 06:57:56'),
(93, 5, NULL, 71, 'Drawing Easels for Painting Canvas', 3, 3, 1, 3000.00, 3000, NULL, 1, '2023-05-11 06:54:18', '2023-05-11 06:58:06'),
(94, 5, NULL, 72, 'Laptop Table', 3, 3, 1, 9500.00, 9500, NULL, 1, '2023-05-11 06:55:37', '2023-05-11 07:00:13'),
(95, 5, NULL, 24, 'Transportation expenses', 8, 3, 1, 8040.00, 8040, NULL, 1, '2023-05-11 06:56:31', '2023-05-11 07:00:19'),
(96, 6, NULL, 10, 'Red Color Carpet', 8, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-11 11:50:41', '2023-05-11 12:14:35'),
(97, 6, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 8, 3, 1, 15000.00, 15000, NULL, 1, '2023-05-11 11:51:11', '2023-05-11 11:51:11'),
(98, 6, NULL, 2, 'Wooden & Board made reception table', 3, 3, 3, 5000.00, 15000, NULL, 1, '2023-05-11 11:56:11', '2023-05-11 12:10:55'),
(99, 6, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 6, 2000.00, 12000, NULL, 1, '2023-05-11 11:59:03', '2023-05-11 12:14:20'),
(100, 6, NULL, 66, '43\" LED TV', 3, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-11 11:59:46', '2023-05-11 11:59:46'),
(101, 6, NULL, 68, 'Cutout Loto', 3, 3, 2, 9000.00, 18000, NULL, 1, '2023-05-11 12:00:27', '2023-05-11 12:00:27'),
(102, 6, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 14000.00, 14000, NULL, 1, '2023-05-11 12:00:59', '2023-05-11 12:14:43'),
(103, 6, NULL, 26, 'Acrylic Logo (Navana)', 6, 3, 4, NULL, 0, NULL, 1, '2023-05-11 12:02:16', '2023-05-11 12:13:09'),
(104, 6, NULL, 73, 'Acrylic Clear Tube', 3, 3, 2, 3000.00, 6000, NULL, 1, '2023-05-11 12:03:18', '2023-05-11 12:03:18'),
(105, 6, NULL, 69, 'Stainless steel Brochure Stand', 3, 3, 1, 6000.00, 6000, NULL, 1, '2023-05-11 12:04:00', '2023-05-11 14:17:21'),
(106, 6, NULL, 74, 'Base for Tube', 3, 3, 2, 3000.00, 6000, NULL, 1, '2023-05-11 12:09:34', '2023-05-11 12:09:34'),
(107, 6, NULL, 24, 'Transportation expenses', 8, 3, 1, 6000.00, 6000, NULL, 1, '2023-05-11 12:10:00', '2023-05-11 12:10:00'),
(108, 7, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages', 1, 3, 850, 135.00, 114750, NULL, 1, '2023-05-14 05:35:48', '2023-05-14 06:23:24'),
(109, 7, NULL, 4, 'Raised Floor(16\' x8\') High raise floor', 1, 3, 128, 80.00, 10240, NULL, 1, '2023-05-14 05:38:06', '2023-05-14 06:03:37'),
(110, 7, NULL, 10, 'Red Color Carpet (16\' x8\')', 1, 3, 128, 36.00, 4608, NULL, 1, '2023-05-14 05:38:27', '2023-05-14 06:03:57'),
(111, 7, NULL, 63, 'Black media PVC print print with pasting.', 1, 3, 256, 30.00, 7680, NULL, 1, '2023-05-14 05:59:08', '2023-05-14 06:04:16'),
(112, 7, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-14 05:59:26', '2023-05-14 06:04:37'),
(113, 7, NULL, 7, 'Board & Wooden Made Rack', 3, 3, 2, 8500.00, 17000, NULL, 1, '2023-05-14 06:00:02', '2023-05-14 06:05:08'),
(114, 7, NULL, 22, 'Inject Sticker print with lamination and pesting', 3, 3, 2, 200.00, 400, NULL, 1, '2023-05-14 06:06:07', '2023-05-14 06:06:07'),
(115, 7, NULL, 6, 'Acrylic logo for Fesia', 3, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-14 06:06:33', '2023-05-14 06:08:27'),
(116, 7, NULL, 66, '42\' LED TV', 3, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-14 06:07:03', '2023-05-14 06:08:21'),
(117, 7, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 9, 1500.00, 13500, NULL, 1, '2023-05-14 06:07:26', '2023-05-14 06:07:26'),
(118, 7, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 2, 1500.00, 3000, NULL, 1, '2023-05-14 06:08:02', '2023-05-14 06:22:54'),
(120, 7, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-14 06:18:08', '2023-05-14 06:22:33'),
(121, 7, NULL, 24, 'Transportation expenses', 8, 3, 1, 3000.00, 3000, NULL, 1, '2023-05-14 06:18:46', '2023-05-14 06:22:42'),
(122, 7, NULL, 29, 'Creative Design 2D & 3D', 8, 3, 1, 1.00, 1, NULL, 1, '2023-05-14 06:29:38', '2023-05-14 06:29:38'),
(123, 7, NULL, 75, 'Agency supervision charge', 8, 3, 1, 1.00, 1, NULL, 1, '2023-05-14 06:30:53', '2023-05-14 06:30:53'),
(124, 8, NULL, 1, 'Wooden & Board Wall, Side Ceiling with carpenter wages (16\' x16\')', 1, 3, 597, 135.00, 80595, NULL, 1, '2023-05-14 10:11:08', '2023-05-14 10:36:53'),
(125, 8, NULL, 4, 'Raised Floor (16\' x16\') High raise floor', 1, 3, 256, 80.00, 20480, NULL, 1, '2023-05-14 10:11:37', '2023-05-14 10:37:53'),
(126, 8, NULL, 76, 'Wooden color mat', 1, 3, 256, 25.00, 6400, NULL, 1, '2023-05-14 10:14:04', '2023-05-14 10:14:04'),
(127, 8, NULL, 65, '14\'x6.5\' LED Screen with wooden frame.', 1, 3, 91, 900.00, 81900, NULL, 1, '2023-05-14 10:16:40', '2023-05-14 11:33:33'),
(128, 8, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 1, 3, 256, 30.00, 7680, NULL, 1, '2023-05-14 10:18:30', '2023-05-14 10:38:35'),
(129, 8, NULL, 77, '4\' x 2\' Side Wall Cutout', 3, 3, 6, 2000.00, 12000, NULL, 1, '2023-05-14 10:20:48', '2023-05-14 10:20:48'),
(130, 8, NULL, 68, 'Cutout Loto', 3, 3, 5, 1500.00, 7500, NULL, 1, '2023-05-14 10:21:15', '2023-05-14 10:21:15'),
(131, 8, NULL, 6, 'Acrylic logo for inner wall', 3, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-14 10:21:37', '2023-05-14 10:21:37'),
(132, 8, NULL, 3, 'Pipe with setting and ms frame', 3, 3, 2, 2000.00, 4000, NULL, 1, '2023-05-14 10:22:19', '2023-05-14 10:22:19'),
(133, 8, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 9000.00, 9000, NULL, 1, '2023-05-14 10:22:57', '2023-05-14 10:22:57'),
(134, 8, NULL, 2, '2 Side Wooden & Board made reception table', 3, 3, 1, 10000.00, 10000, NULL, 1, '2023-05-14 10:23:40', '2023-05-14 10:23:56'),
(135, 8, NULL, 12, 'Two Seater Sofa', 3, 3, 2, 2000.00, 4000, NULL, 1, '2023-05-14 10:24:16', '2023-05-14 10:24:16'),
(136, 8, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 1, 1500.00, 1500, NULL, 1, '2023-05-14 10:24:33', '2023-05-14 10:24:33'),
(137, 8, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 2, 1200.00, 2400, NULL, 1, '2023-05-14 10:24:55', '2023-05-14 10:24:55'),
(138, 8, NULL, 70, 'Natural & Artificial Trees', 3, 3, 4, 350.00, 1400, NULL, 1, '2023-05-14 10:25:24', '2023-05-14 10:25:24'),
(139, 8, NULL, 29, 'Creative Design 2D & 3D', 8, 3, 1, 5000.00, 5000, NULL, 1, '2023-05-14 10:26:00', '2023-05-14 10:28:08'),
(140, 8, NULL, 75, 'Agency supervision charge', 8, 3, 1, 10000.00, 10000, NULL, 1, '2023-05-14 10:26:23', '2023-05-14 11:34:36'),
(141, 8, NULL, 24, 'Transportation expenses', 8, 3, 1, 5000.00, 5000, NULL, 1, '2023-05-14 10:26:43', '2023-05-14 10:28:45'),
(142, 9, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages', 1, 3, 401, 130.00, 52130, NULL, 1, '2023-05-14 11:42:57', '2023-05-14 12:01:53'),
(143, 9, NULL, 4, 'Raised Floor (16\' x 8\') High raise floor', 1, 3, 128, 80.00, 10240, NULL, 1, '2023-05-14 11:47:52', '2023-05-14 12:02:50'),
(144, 9, NULL, 10, 'Ash Color Carpet (16\' x 8\')', 1, 3, 128, 30.00, 3840, NULL, 1, '2023-05-14 11:49:15', '2023-05-14 12:03:11'),
(145, 9, NULL, 63, 'Black media PVC print with pasting.', 1, 3, 184, 30.00, 5520, NULL, 1, '2023-05-14 11:51:47', '2023-05-14 11:55:46'),
(146, 9, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 8500.00, 8500, NULL, 1, '2023-05-14 11:52:35', '2023-05-14 11:52:54'),
(147, 9, NULL, 66, '42\" LED TV', 1, 3, 3, 8000.00, 24000, NULL, 1, '2023-05-14 11:53:38', '2023-05-14 11:55:35'),
(148, 9, NULL, 12, 'Two Seater Sofa (Ash Color)', 3, 3, 2, 2000.00, 4000, NULL, 1, '2023-05-14 11:54:00', '2023-05-14 11:54:35'),
(149, 9, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 1, 1500.00, 1500, NULL, 1, '2023-05-14 11:54:51', '2023-05-14 12:01:32'),
(150, 9, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 1, 1500.00, 1500, NULL, 1, '2023-05-14 11:55:08', '2023-05-14 11:55:08'),
(151, 9, NULL, 22, 'Inject Sticker print with lamination and pesting', 1, 3, 12, 40.00, 480, NULL, 1, '2023-05-14 11:56:56', '2023-05-14 11:56:56'),
(152, 9, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 10000.00, 10000, NULL, 1, '2023-05-14 11:58:03', '2023-05-14 11:58:03'),
(153, 9, NULL, 6, 'Acrylic logo for inner wall', 3, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-14 11:58:23', '2023-05-14 11:58:23'),
(154, 9, NULL, 29, 'Creative Design 2D & 3D', 8, 3, 1, 3500.00, 3500, NULL, 1, '2023-05-14 11:58:51', '2023-05-14 12:01:23'),
(155, 9, NULL, 75, 'Agency supervision charge', 8, 3, 1, 9000.00, 6000, NULL, 1, '2023-05-14 11:59:05', '2023-05-14 12:00:41'),
(156, 9, NULL, 24, 'Transportation expenses', 8, 3, 1, 4500.00, 4500, NULL, 1, '2023-05-14 11:59:35', '2023-05-14 11:59:35'),
(157, 10, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages', 1, 3, 596, 80.00, 47680, NULL, 1, '2023-05-14 13:16:09', '2023-05-14 13:29:48'),
(158, 10, NULL, 4, 'Raised Floor(16\' x8\') High raise floor', 1, 3, 128, 60.00, 7680, NULL, 1, '2023-05-14 13:18:41', '2023-05-14 13:29:07'),
(159, 10, NULL, 10, 'Green Color Carpet (16\' x8\')', 1, 3, 128, 26.00, 3328, NULL, 1, '2023-05-14 13:19:08', '2023-05-14 13:29:28'),
(160, 10, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 4672.00, 4672, NULL, 1, '2023-05-14 13:19:40', '2023-06-19 07:16:44'),
(161, 10, NULL, 63, 'Black media PVC  print with pasting.', 1, 3, 288, 30.00, 8640, NULL, 1, '2023-05-14 13:20:57', '2023-05-14 13:29:43'),
(162, 10, NULL, 68, 'Cutout Loto', 3, 3, 2, 3000.00, 6000, NULL, 1, '2023-05-14 13:22:25', '2023-05-14 13:22:25'),
(163, 10, NULL, 12, 'Two Seater Sofa', 3, 3, 2, 1500.00, 3000, NULL, 1, '2023-05-14 13:23:16', '2023-05-14 13:23:16'),
(164, 10, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 1, 1500.00, 1500, NULL, 1, '2023-05-14 13:23:51', '2023-05-14 13:23:51'),
(165, 10, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 2, 1000.00, 2000, NULL, 1, '2023-05-14 13:24:13', '2023-05-14 13:24:13'),
(167, 10, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 5000.00, 5000, NULL, 1, '2023-05-14 13:25:23', '2023-05-14 13:27:47'),
(168, 10, NULL, 70, 'Natural & Artificial Trees', 1, 3, 10, 150.00, 1500, NULL, 1, '2023-05-14 13:26:06', '2023-05-14 13:26:06'),
(170, 10, NULL, 66, '42\" LED TV', 3, 3, 1, 6000.00, 6000, NULL, 1, '2023-05-14 13:28:16', '2023-06-19 07:09:27'),
(171, 10, NULL, 24, 'Transportation expenses', 8, 3, 1, 3000.00, 3000, NULL, 1, '2023-05-14 13:28:36', '2023-05-14 13:28:36'),
(172, 11, NULL, 1, 'Wooden & Board Wall, Side Ceiling, front side top lubber with carpenter wages', 1, 3, 750, 150.00, 112500, NULL, 1, '2023-05-15 05:37:49', '2023-05-15 06:09:43'),
(173, 11, NULL, 4, 'Raised Floor(20\' x10\') High raise floor', 1, 3, 200, 80.00, 16000, NULL, 1, '2023-05-15 05:41:32', '2023-05-15 05:48:51'),
(174, 11, NULL, 10, 'Blue Color Carpet (20\' x10\')', 1, 3, 200, 40.00, 8000, NULL, 1, '2023-05-15 05:41:52', '2023-05-15 05:49:06'),
(175, 11, NULL, 2, 'Wooden & Board made reception table', 3, 3, 2, 500.00, 1000, NULL, 1, '2023-05-15 05:42:30', '2023-05-15 05:42:30'),
(176, 11, NULL, 63, 'Black media PVC print with pasting.', 1, 3, 600, 30.00, 18000, NULL, 1, '2023-05-15 05:45:47', '2023-05-15 05:48:39'),
(177, 11, NULL, 68, 'Cutout Logo with backlit', 3, 3, 1, 6000.00, 6000, NULL, 1, '2023-05-15 05:46:43', '2023-05-15 05:47:09'),
(178, 11, NULL, 5, 'Branding cutout', 3, 3, 4, 750.00, 3000, NULL, 1, '2023-05-15 05:47:45', '2023-05-15 05:47:45'),
(179, 11, NULL, 22, 'Inject Sticker print with lamination and pesting', 3, 3, 6, 800.00, 4800, NULL, 1, '2023-05-15 05:48:19', '2023-05-15 05:48:19'),
(180, 11, NULL, 16, 'Spot Light/Track Light/Strip Light', 7, 3, 1, 12000.00, 12000, NULL, 1, '2023-05-15 05:50:02', '2023-05-15 06:12:50'),
(181, 11, NULL, 64, 'Tulip Chair for the stall.', 6, 3, 10, 1500.00, 15000, NULL, 1, '2023-05-15 05:51:05', '2023-05-15 05:51:05'),
(182, 11, NULL, 14, 'Wooden framed Round Tea Table With 8mm Clear Glass', 3, 3, 2, 2500.00, 5000, NULL, 1, '2023-05-15 05:51:30', '2023-05-15 05:52:16'),
(183, 11, NULL, 70, 'Artificial Trees', 3, 3, 4, 500.00, 2000, NULL, 1, '2023-05-15 05:53:01', '2023-05-15 06:09:32'),
(185, 11, NULL, 7, 'Board & Wooden Made two double side Rack', 3, 3, 2, 1.00, 2, NULL, 1, '2023-05-15 06:10:15', '2023-05-15 06:13:39'),
(186, 11, NULL, 24, 'Transportation & Toll expenses', 8, 3, 1, 25000.00, 25000, NULL, 1, '2023-05-15 06:10:31', '2023-05-15 06:10:45'),
(187, 12, NULL, 1, 'Structure back wall- 6mm gorjon ply board, Wooden frame side wall & Cealing- 6mm gorjon ply board.', 7, 1, 950, 100.00, 95000, NULL, 1, '2023-05-15 10:32:00', '2023-05-30 05:56:15'),
(188, 12, NULL, 4, 'Raised Floor(25\' x10\') High raise floor', 1, 1, 250, 80.00, 20000, NULL, 1, '2023-05-15 10:34:51', '2023-05-30 05:56:16'),
(189, 12, NULL, 10, 'Blue Color Carpet (25\' x10\')', 1, 1, 250, 70.00, 17500, NULL, 1, '2023-05-15 10:35:12', '2023-05-30 05:56:20'),
(204, 13, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages (40\' x20\')', 1, 3, 350, 130.00, 45500, NULL, 1, '2023-05-15 15:50:41', '2023-05-15 15:56:10'),
(205, 13, NULL, 4, 'Raised Floor(40\' x20\') High raise floor', 1, 3, 256, 70.00, 17920, NULL, 1, '2023-05-15 15:51:27', '2023-05-15 15:56:13'),
(206, 13, NULL, 10, 'Red Color Carpet', 1, 3, 256, 30.00, 7680, NULL, 1, '2023-05-15 15:51:48', '2023-05-15 15:56:37'),
(207, 13, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 1, 3, 128, 35.00, 4480, NULL, 1, '2023-05-15 15:52:15', '2023-05-15 15:52:15'),
(208, 13, NULL, 7, 'Board & Wooden Made Rack', 3, 3, 2, 4000.00, 8000, NULL, 1, '2023-05-15 15:52:32', '2023-05-15 15:53:06'),
(209, 13, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 3000.00, 3000, NULL, 1, '2023-05-15 15:53:20', '2023-05-15 15:53:20'),
(210, 13, NULL, 5, 'Branding cutout', 3, 3, 1, 4000.00, 4000, NULL, 1, '2023-05-15 15:53:48', '2023-05-15 15:53:48'),
(211, 13, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 6, 1500.00, 6000, NULL, 1, '2023-05-15 15:54:24', '2023-05-16 08:41:26'),
(212, 13, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 1, 1500.00, 1500, NULL, 1, '2023-05-15 15:54:38', '2023-05-15 15:54:38'),
(214, 13, NULL, 70, 'Natural & Artificial Trees', 3, 3, 2, 500.00, 1000, NULL, 1, '2023-05-15 15:55:11', '2023-05-15 15:55:11'),
(215, 13, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-15 15:55:38', '2023-05-15 15:55:38'),
(220, 14, NULL, 1, 'Wooden & Board Wall, Side Ceiling & all complete with carpenter wages', NULL, 3, 550, 116.00, 63800, NULL, 1, '2023-05-16 05:39:36', '2023-05-16 06:05:05'),
(221, 14, NULL, 4, 'Raised Floor High raise floor (20\' x10\')', 1, 3, 200, 70.00, 14000, NULL, 1, '2023-05-16 05:42:53', '2023-05-16 06:03:01'),
(222, 14, NULL, 10, 'Blue Color Carpet', 1, 3, 200, 30.00, 6000, NULL, 1, '2023-05-16 05:51:13', '2023-05-16 05:51:22'),
(223, 14, NULL, 7, 'Board & Wooden Made Rack', 3, 3, 2, 500.00, 1000, NULL, 1, '2023-05-16 05:51:39', '2023-05-16 06:03:44'),
(224, 14, NULL, 2, 'Wooden & Board made reception table', 3, 3, 2, 3500.00, 7000, NULL, 1, '2023-05-16 05:52:13', '2023-05-16 06:03:44'),
(225, 14, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 3, 2, 1200.00, 2400, NULL, 1, '2023-05-16 05:52:58', '2023-05-16 06:03:45'),
(226, 14, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 4, 1000.00, 4000, NULL, 1, '2023-05-16 05:53:18', '2023-05-16 06:04:01'),
(227, 14, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 1, 1000.00, 1000, NULL, 1, '2023-05-16 05:54:40', '2023-05-16 06:09:14'),
(228, 14, NULL, 63, 'Black media PVC print  with pasting.', 1, 3, 288, 26.00, 7488, NULL, 1, '2023-05-16 05:55:59', '2023-05-16 06:08:59'),
(229, 14, NULL, 68, 'Cutout Loto', 1, 3, 1, 2000.00, 2000, NULL, 1, '2023-05-16 05:58:03', '2023-05-16 05:58:03'),
(230, 14, NULL, 22, 'Inject Sticker print with lamination and pesting', 3, 3, 6, 350.00, 2100, NULL, 1, '2023-05-16 05:58:35', '2023-05-16 06:10:09'),
(231, 14, NULL, 16, 'Spot Light/Track Light/', 7, 3, 1, 6000.00, 6000, NULL, 1, '2023-05-16 06:00:54', '2023-05-16 06:04:17'),
(232, 14, NULL, 24, 'Transportation & Toll expenses', 8, 3, 1, 14000.00, 14000, NULL, 1, '2023-05-16 06:01:16', '2023-05-16 06:04:41'),
(233, 13, NULL, 72, 'Product Table', 3, 3, 3, 3000.00, 9000, NULL, 1, '2023-05-16 08:39:01', '2023-05-16 08:39:37'),
(234, 13, NULL, 24, 'Transportation expenses', 8, 3, 1, 4000.00, 4000, NULL, 1, '2023-05-16 08:39:56', '2023-05-16 08:39:56'),
(235, 15, NULL, 1, 'Wooden & Board Wall, Side Ceiling & Partition all complete with carpenter wages', 1, 3, 610, 93.00, 56730, NULL, 1, '2023-05-18 06:14:54', '2023-05-20 11:15:32'),
(236, 15, NULL, 4, 'Raised Floor High raise floor (32\' x 8\')', 1, 3, 256, 60.00, 15360, NULL, 1, '2023-05-18 06:15:16', '2023-05-20 11:09:16'),
(237, 15, NULL, 10, 'Blue Color Carpet (32\' x 8\')', 1, 3, 256, 30.00, 7680, NULL, 1, '2023-05-18 06:15:36', '2023-05-20 11:11:04'),
(238, 15, NULL, 7, 'Board & Wooden Made Rack', 3, 3, 5, 2320.00, 11600, NULL, 1, '2023-05-18 06:16:17', '2023-05-20 11:27:30'),
(239, 15, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 8000.00, 8000, NULL, 1, '2023-05-18 06:16:32', '2023-05-18 06:16:32'),
(240, 15, NULL, 63, 'Black media PVC print t with pasting.', 1, 3, 320, 27.00, 8640, NULL, 1, '2023-05-18 06:16:51', '2023-05-20 11:09:42'),
(241, 15, NULL, 21, 'Inject Sticker print With pasting.', 1, 3, 100, 30.00, 3000, NULL, 1, '2023-05-18 06:17:04', '2023-05-20 11:09:47'),
(242, 15, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 6, 1000.00, 6000, NULL, 1, '2023-05-18 06:17:36', '2023-05-20 11:14:12'),
(243, 15, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 3, 2, 1000.00, 2000, NULL, 1, '2023-05-18 06:17:54', '2023-05-20 11:14:21'),
(244, 15, NULL, 14, 'Round Tea Table With 8mm Clear Glass', 3, 3, 2, 1000.00, 2000, NULL, 1, '2023-05-18 06:18:12', '2023-05-18 06:22:48'),
(245, 15, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 4000.00, 4000, NULL, 1, '2023-05-18 06:18:36', '2023-05-20 11:14:04'),
(246, 15, NULL, 70, 'Artificial Trees', 3, 3, 4, 500.00, 2000, NULL, 1, '2023-05-18 06:18:56', '2023-05-18 06:29:43'),
(247, 15, NULL, 24, 'Transportation expenses', 8, 3, 1, 3000.00, 3000, NULL, 1, '2023-05-18 06:19:37', '2023-05-20 11:10:52'),
(249, 12, NULL, 3, 'Pipe with setting and ms frame', 1, 1, 1, 1000.00, 1000, NULL, 1, '2023-05-30 07:09:10', '2023-05-30 07:09:10'),
(250, 12, NULL, 7, 'Board & Wooden Made Rack', 3, 1, 1, 1000.00, 1000, NULL, 1, '2023-05-30 07:09:33', '2023-05-30 07:09:33'),
(251, 17, NULL, 1, 'Back wall- 6mm gorgon ply board with wooden frame side wall, Side Wall- 6mm gorgon ply board with wooden frame, Ceiling- 6mm gorgon ply board with wooden frame.', 1, 3, 750, 80.00, 60000, NULL, 1, '2023-05-30 11:22:46', '2023-05-30 11:51:02'),
(252, 17, NULL, 4, '24\' x 8\' Raised floor with 3/4 ply board & wooden frame.', 1, 3192, 192, 70.00, 13440, NULL, 1, '2023-05-30 11:40:33', '2023-05-30 11:51:13'),
(253, 17, NULL, 10, 'Red Color Carpet', 1, 3, 192, 30.00, 5760, NULL, 1, '2023-05-30 11:42:40', '2023-05-30 11:51:19'),
(254, 17, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 5000.00, 5000, NULL, 1, '2023-05-30 11:43:18', '2023-05-30 11:51:24'),
(255, 17, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 3, 1, 2000.00, 2000, NULL, 1, '2023-05-30 11:43:57', '2023-05-30 11:43:57'),
(256, 17, NULL, 85, 'Board & Wood made product base table.', 3, 3, 2, 3500.00, 7000, NULL, 1, '2023-05-30 11:45:07', '2023-05-30 11:51:37'),
(257, 17, NULL, 7, 'Board & Wooden Made Product Rack', 3, 3, 2, 4000.00, 8000, NULL, 1, '2023-05-30 11:45:42', '2023-05-30 11:51:43'),
(258, 17, NULL, 64, 'Tulip Chair for the stall.', 3, 3, 3, 1000.00, 3000, NULL, 1, '2023-05-30 11:46:22', '2023-05-30 11:51:47'),
(259, 17, NULL, 12, 'Two Seater Sofa', 3, 3, 2, 1500.00, 3000, NULL, 1, '2023-05-30 11:46:49', '2023-05-30 11:51:52'),
(260, 17, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-30 11:47:07', '2023-05-30 11:52:01'),
(261, 17, NULL, 86, 'Round high glass table', 3, 3, 1, 2000.00, 2000, NULL, 1, '2023-05-30 11:48:24', '2023-05-30 11:52:07'),
(262, 17, NULL, 63, 'Black media PVC print & Inject sticker print with pasting.', 1, 3, 192, 30.00, 5760, NULL, 1, '2023-05-30 11:49:00', '2023-05-30 11:52:15'),
(263, 17, NULL, 21, 'Vinyle Sticker for table & fesia  With print & pest', 3, 3, 8, 150.00, 1200, NULL, 1, '2023-05-30 11:49:32', '2023-05-30 11:52:20'),
(264, 17, NULL, 24, 'Transportation expenses', 8, 3, 1, 6840.00, 6840, NULL, 1, '2023-05-30 11:50:42', '2023-05-30 11:52:56'),
(265, 18, NULL, 1, 'Back wall- 6mm gorgon ply board with wooden frame side wall, Side Wall- 6mm gorgon ply board with wooden frame, Ceiling- 6mm gorgon ply board with wooden frame.', 1, 3, 420, 70.00, 29400, NULL, 1, '2023-05-31 05:32:11', '2023-05-31 05:39:42'),
(266, 18, NULL, 4, '20\' x 10\' high raised floor with wooden frame.', 1, 3, 200, 70.00, 14000, NULL, 1, '2023-05-31 05:32:41', '2023-05-31 05:38:13'),
(267, 18, NULL, 10, '20\' x 10\' Ash Color Carpet', 1, 3, 200, 35.00, 7000, NULL, 1, '2023-05-31 05:34:10', '2023-05-31 05:38:33'),
(268, 18, NULL, 2, 'Wooden & Board made reception table', 3, 3, 1, 4000.00, 4000, NULL, 1, '2023-05-31 05:34:51', '2023-05-31 05:38:52'),
(269, 18, NULL, 63, 'Black media PVC print  with pasting.', 1, 3, 100, 30.00, 3000, NULL, 1, '2023-05-31 05:35:29', '2023-05-31 05:35:47'),
(270, 18, NULL, 13, 'SS Stand Black Color Bar Tool', 3, 3, 2, 1000.00, 2000, NULL, 1, '2023-05-31 05:36:10', '2023-05-31 05:36:10'),
(271, 18, NULL, 16, 'Spot Light/Track Light/Streep Light', 7, 3, 1, 7000.00, 7000, NULL, 1, '2023-05-31 05:36:34', '2023-05-31 05:36:34'),
(272, 18, NULL, 6, 'Acrylic logo for inner wall', 6, 3, 1, 5000.00, 5000, NULL, 1, '2023-05-31 05:36:57', '2023-05-31 05:38:21'),
(273, 18, NULL, 68, 'Cutout Loto', 6, 3, 3, 1000.00, 3000, NULL, 1, '2023-05-31 05:37:34', '2023-05-31 05:38:43'),
(274, 18, NULL, 24, 'Transportation expenses', 8, 3, 1, 5600.00, 5600, NULL, 1, '2023-05-31 05:37:53', '2023-05-31 05:39:48'),
(275, 15, NULL, 87, 'Additional Structure, paint work, light work, PVC & Sticker and others logistics', 8, 3, 1, 5000.00, 5000, NULL, 1, '2023-06-06 09:06:37', '2023-06-06 10:41:57'),
(276, 19, NULL, 88, 'The size is 24 ft X 8 ft Good quality 4 pass print in Black Media and wooden framed.', 1, 1, 192, 30.00, 5760, NULL, 1, '2023-06-19 08:48:59', '2023-06-19 08:48:59'),
(277, 19, NULL, 5, '4 Feet X 2 Feet Cutout, Inkjet Sticker, Matt Lamination', 3, 1, 8, 40.00, 320, NULL, 1, '2023-06-19 08:49:33', '2023-06-19 08:50:39'),
(278, 19, NULL, 68, '1.5 Feet X 1.5 Feet Cutout, Inkjet Sticker, Matt Lamination', 3, 1, 3, 40.00, 120, NULL, 1, '2023-06-19 08:50:08', '2023-06-19 08:51:03'),
(279, 19, NULL, 47, '1 pair sound  with 2 cordless', 9, 1, 1, 8000.00, 8000, NULL, 1, '2023-06-19 08:51:41', '2023-06-19 08:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'developer', 1, '2022-09-08 18:19:25', '2022-09-08 18:19:25'),
(2, 'Super Admin', 's_admin', 1, '2022-09-08 18:19:25', '2022-09-08 18:19:25'),
(3, 'Admin', 'admin', 1, '2022-09-08 18:20:32', '2022-09-08 18:20:32'),
(4, 'Manager', 'manager', 1, '2022-09-08 18:20:55', '2022-09-08 18:20:55'),
(5, 'User', 'user', 1, '2022-09-08 18:21:18', '2022-09-08 18:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_type` varchar(255) NOT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_mobile` varchar(255) DEFAULT NULL,
  `product_cost` double(16,2) NOT NULL DEFAULT 0.00,
  `transport_cost` double(12,2) NOT NULL DEFAULT 0.00,
  `labour_cost` double(12,2) NOT NULL DEFAULT 0.00,
  `total` double(16,2) NOT NULL DEFAULT 0.00,
  `discount` double(12,2) NOT NULL DEFAULT 0.00,
  `vat` double(12,2) NOT NULL DEFAULT 0.00,
  `note` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `weight_in_mg` int(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `quantity` double(16,3) NOT NULL,
  `rate_per_gram` double(10,2) NOT NULL DEFAULT 0.00,
  `cost_rate_per_gram` double(10,2) NOT NULL DEFAULT 0.00,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0CbVbspYFIig9a6vw15S2dAKIRJb5sNIskwmjGZ9', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWdIQzl1NzBLcFk1QkRVVkUxNWdMRmFBbW9RRk5Uc2VxMnFoVTRRbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9vZmZpY2UuY3JlYXRpb25iZC5uZXQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689532555),
('0xKKabgSBV8yBNhKUnMFQxHCTObdLeFIFwFPBm6v', 1, '123.253.214.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRVVaRWhvZXVyYmhweWkwSkRnYVNGWlNnTlhPaWR1Vk1EckplWG1GUCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUwOiJodHRwczovL29mZmljZS5jcmVhdGlvbmJkLm5ldC9kdWUtdHJhbnNhY3Rpb24tZm9ybSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1689494727),
('CiRLSdqXgzTTYK1WR8srLfBNAap6SRg8JBIYYd3A', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRm9WS1NiYUx0dzloU1FhMXJUMG5oc2RZMVNjRnQ1c0ZiaEhVNWhmNSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cub2ZmaWNlLmNyZWF0aW9uYmQubmV0Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3Lm9mZmljZS5jcmVhdGlvbmJkLm5ldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1689538409),
('efS94Lziig3LNDvHbkCz11shIz9PyIZSj8XtC1Dl', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzNnM2ZHbWN4TWVpdGQ5aWlqU0hhUHZYajN0RXZicXV4dGtORWd6RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHBzOi8vd3d3Lm9mZmljZS5jcmVhdGlvbmJkLm5ldC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1689538413),
('GKj2oYgIj0AAvE0PRcTZZmF4ZCAD1acKGofgvfHB', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxwRVZIUHlET3AzR1dvQmQxVTRMTVpyYmdoZFRFU2UwVXQyNDJkUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly9vZmZpY2UuY3JlYXRpb25iZC5uZXQvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689532558),
('kEcmhujHEt0Ok02VfJUeA5SqZcdWERJWTdeQNnm1', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicU5CcVZuWFowcnlGSTUzc2VzS3NJQW9jaDVQY0poUUR2cmpaYlA4TiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689532554),
('lLHZVHISCzvjcFpkBJPDYFtXtTiroit4Sqt7LmcU', NULL, '87.236.176.143', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUXVabmVvNnJFVlpjSk5DVmtyR1kwRUwwb2VZWHpIMFFzSVlIUHd6dyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cHM6Ly9vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689487643),
('mGMvk1MQQdtuwgMRlbZ36Kxzi2XanRoRP1XdrGcI', NULL, '87.236.176.143', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidU9iMDNEV0lmblZKWllUa2ZmN2ljUFZsRXFwb2pkTUtuOTVVY2huQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHBzOi8vb2ZmaWNlLmNyZWF0aW9uYmQubmV0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1689487643),
('pht4wDairidembC1fM1Fgau7vbBlIGQe26yaFaPy', NULL, '183.136.225.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSFRiTWFqVjBHRk9WdFpsV0txaWJWM3JOR1NzNTRXT0tvbEpsWU5yYyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689531778),
('RGGDcMDU1BGpsCzp04EJoKcftTYuXRpSc5idiLAI', 1, '123.253.214.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSDRkU3djbDdTZ2N2dXozNXRTUjhFT2RBTzB3WWR0Y1lwZVBrZHIzZCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwczovL29mZmljZS5jcmVhdGlvbmJkLm5ldC9jaGFsYW4tcmVwb3J0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1689677855),
('riwurrjV5TYTuQ3Deh1tmK3gfP5o66XUE4eRLPhB', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2VRb3VKQmdsblpWQ1dVYzZpQ0E0MjFIcVdvTFRZMjRWSUpPMjB4ZiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL29mZmljZS5jcmVhdGlvbmJkLm5ldCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vb2ZmaWNlLmNyZWF0aW9uYmQubmV0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1689532554),
('TD7JEih9U064N70dqlDL6tvkRnkVQUnZ3oY08uYt', NULL, '183.136.225.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSE51anQzcEhzT1pMMmNwUjA5eEdIOU5ZbzJxQ3NYakZTNmI5NUFsVSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL29mZmljZS5jcmVhdGlvbmJkLm5ldCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vb2ZmaWNlLmNyZWF0aW9uYmQubmV0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1689531774),
('TTnPZkntyvYU85zUMVFlCG3u5HpbjDPmfQxLZdC4', NULL, '183.136.225.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQVFXbWtQMWFiWUw4WEkyS24xS1BQem5uRjc1Z2cwSXlVWHRGem9ERiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMjoiaHR0cDovL3d3dy5vZmZpY2UuY3JlYXRpb25iZC5uZXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1689523855),
('uANDbTh4cBvcSQTkU4hpDwXifR5yUMHXXdJgSEVX', NULL, '183.136.225.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZmNkMDJzcERnVUV1dTZ2bUZLNEw1NWtDNkZBUFdMdUh1TDhtV2tWMiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMzoiaHR0cHM6Ly93d3cub2ZmaWNlLmNyZWF0aW9uYmQubmV0Ijt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vd3d3Lm9mZmljZS5jcmVhdGlvbmJkLm5ldCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1689537606),
('UvLqIq9BGQBi7McBPMZU1XR9oUoPoDurDyM0CwTX', NULL, '183.136.225.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicDNhUUFXQ003SzZOalFtN2xFNEpNb1ByT09DS2hmVmlNRVU1MUIzUyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyODoiaHR0cDovL29mZmljZS5jcmVhdGlvbmJkLm5ldCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI4OiJodHRwOi8vb2ZmaWNlLmNyZWF0aW9uYmQubmV0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1689523855),
('YLNa5oRkMFVTDUCE3VkpX1vOsWy0cjcZSLwwOTPS', NULL, '183.136.225.44', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTMyQmhUcVltcFBrcm5sdngyWThNYUhnUENENHRCbW1jalJ5cEZNSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly93d3cub2ZmaWNlLmNyZWF0aW9uYmQubmV0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1689532584);

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `signatories`
--

CREATE TABLE `signatories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `signature` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `signatories`
--

INSERT INTO `signatories` (`id`, `name`, `mobile`, `email`, `designation`, `signature`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rajib Kanti Nath', '01676026451', 'Creationbd55@gmail.com', 'Managing Director', 'assets/app/signatory/1683634915_Picture1.png', 1, '2023-05-09 12:21:55', '2023-05-09 12:21:55'),
(2, 'Fakrul Islam Jewel', '01811007580', 'jeweldu2010@gmail.com', 'Manager, HR & Accounts', 'assets/app/signatory/1683635806_Signature.jpg', 1, '2023-05-09 12:36:46', '2023-05-16 10:05:14');

-- --------------------------------------------------------

--
-- Table structure for table `site_infos`
--

CREATE TABLE `site_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_infos`
--

INSERT INTO `site_infos` (`id`, `property`, `value`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'name', 'Creation', 'text', 1, '2023-03-30 07:19:58', '2023-05-07 07:28:35'),
(2, 'short_name', 'Creation', 'text', 1, '2023-03-30 07:19:58', '2023-05-07 07:28:48'),
(3, 'title', 'Site Title', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(4, 'tag_line', 'Tag Line', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(5, 'logo', 'assets/app/images/1683641711_Logo.png', 'file', 1, '2023-03-30 07:19:58', '2023-05-09 14:15:11'),
(6, 'small_logo', 'assets/app/images/1683641751_Logo.png', 'file', 1, '2023-03-30 07:19:58', '2023-05-09 14:15:51'),
(7, 'favicon', 'assets/app/images/favicon.png', 'file', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(8, 'address', 'I/22, Block# E, Kazi Nazrul Islam Road, Lalmatia, Mohammadpur, Dhaka-1207', 'text', 1, '2023-03-30 07:19:58', '2023-05-10 11:51:45'),
(9, 'mobile', '01676026451', 'text', 1, '2023-03-30 07:19:58', '2023-05-09 04:43:30'),
(10, 'powered_text', 'Tech Intelligence', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(11, 'powered_link', 'https://www.techintelligencebd.com', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(12, 'powered_mobile', '01728437436', 'text', 1, '2023-03-30 07:19:58', '2023-05-03 05:06:51'),
(13, 'initial_cash', '0', 'number', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(14, 'language', 'english', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(15, 'powered_text_separator', '|', 'text', 1, '2023-03-30 07:19:58', '2023-03-30 07:19:58'),
(16, 'vat_percent', '15', 'number', 1, '2023-04-03 06:32:42', '2023-04-03 06:32:42'),
(17, 'email', 'creationbd55@gmail.com', 'email', 1, '2023-04-03 13:57:41', '2023-05-16 10:04:21'),
(18, 'owner', 'Razib Kanti Nath', 'text', 1, '2023-05-02 04:44:48', '2023-05-07 07:29:08'),
(19, 'invoice_with_header', 'no', 'text', 1, '2023-05-10 07:26:44', '2023-05-10 07:27:19'),
(20, 'main_logo_position_left', '0', 'number', 1, '2023-05-10 07:26:44', '2023-05-10 07:27:42'),
(21, 'main_logo_print_position_left', '5', 'number', 1, '2023-05-10 07:26:44', '2023-05-10 07:57:22'),
(22, 'invoice_main_logo_height', '', 'number', 1, '2023-05-10 07:26:44', '2023-05-10 07:26:44'),
(23, 'secondary_logo_position_right', '10', 'number', 1, '2023-05-10 07:26:44', '2023-05-19 05:43:43'),
(24, 'secondary_logo_print_position_right', '10', 'number', 1, '2023-05-10 07:26:44', '2023-05-19 05:43:50'),
(25, 'invoice_secondary_logo_height', '125', 'number', 1, '2023-05-10 07:26:44', '2023-05-19 05:43:56'),
(26, 'invoice_header_height', '1.3', 'number', 1, '2023-05-10 07:26:44', '2023-05-19 05:44:28'),
(27, 'invoice_title_font_size', '25', 'number', 1, '2023-05-10 12:07:23', '2023-05-10 12:07:23'),
(28, 'invoice_secondary_logo', 'assets/app/images/1684475000_icon-removebg-preview.png', 'file', 1, '2023-05-19 05:34:40', '2023-05-19 05:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `purchase_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `sale_rate` double(10,2) NOT NULL DEFAULT 0.00,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_projects`
--

CREATE TABLE `sub_projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `transaction_sector_id` int(11) NOT NULL,
  `transaction_item_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `amount` double(8,2) NOT NULL,
  `transaction_title` varchar(255) NOT NULL,
  `via` varchar(255) DEFAULT NULL,
  `bank_payment_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `transaction_type`, `transaction_sector_id`, `transaction_item_id`, `project_id`, `amount`, `transaction_title`, `via`, `bank_payment_id`, `remark`, `created_at`, `updated_at`) VALUES
(1, 'Expense', 2, 2, 2, 600.00, 'Debit', 'Cash', NULL, 'Jewel', '2023-05-13 05:11:00', '2023-05-18 05:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaction_sector_id` int(11) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `related_table` varchar(255) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `transaction_limit` double(12,2) DEFAULT NULL,
  `account_type` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `transaction_sector_id`, `account_name`, `mobile`, `address`, `related_table`, `table_id`, `transaction_limit`, `account_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Salary', NULL, NULL, NULL, NULL, NULL, 'Credit', 1, '2023-05-12 14:24:43', '2023-05-12 14:24:43'),
(2, 2, 'Conveyance', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-18 05:09:06', '2023-05-18 05:09:06'),
(3, 2, 'Food', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:38:45', '2023-05-30 04:38:45'),
(4, 2, 'Pickup Hire', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:39:08', '2023-05-30 04:39:08'),
(5, 1, 'Office Rent', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:39:25', '2023-05-30 04:45:16'),
(6, 2, 'Furniture Hire', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:41:44', '2023-05-30 04:41:44'),
(7, 2, 'Agent Commission', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:41:59', '2023-05-30 04:41:59'),
(8, 2, 'Extra Executor', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:42:28', '2023-05-30 04:42:28'),
(9, 2, 'Brand Promotor (BP)', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:42:46', '2023-05-30 04:42:46'),
(10, 2, 'BP Costume', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:42:57', '2023-05-30 04:42:57'),
(11, 2, 'Others Logistics', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:43:18', '2023-05-30 04:43:18'),
(12, 2, 'Design Charge (3D)', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:43:48', '2023-05-30 04:43:48'),
(13, 2, 'Creative Design Charge', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:44:07', '2023-05-30 04:44:07'),
(14, 1, 'Office Rent', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:45:49', '2023-05-30 04:45:49'),
(15, 1, 'Office Service Charge', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:46:07', '2023-05-30 04:46:07'),
(16, 1, 'Electric Bill', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:46:23', '2023-05-30 04:46:23'),
(17, 1, 'Gas Bill', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:46:32', '2023-05-30 04:46:32'),
(18, 1, 'Internet Bill', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:46:43', '2023-05-30 04:46:43'),
(19, 1, 'Ware House Rent', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:47:16', '2023-05-30 04:47:16'),
(20, 3, 'Computer Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:50:18', '2023-05-30 04:50:18'),
(21, 3, 'IT Goods', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:52:15', '2023-05-30 04:52:15'),
(22, 3, 'Laptop Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:55:11', '2023-05-30 04:55:11'),
(23, 4, 'VAT/Tax', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:56:05', '2023-05-30 04:56:05'),
(24, 4, 'Trade License Renewal Charge', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:56:40', '2023-05-30 04:56:40'),
(25, 3, 'Boss Chair Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:57:38', '2023-05-30 04:57:38'),
(26, 3, 'Executive Chair Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:58:02', '2023-05-30 04:58:02'),
(27, 3, 'Tulip Chair Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:58:51', '2023-05-30 04:58:51'),
(28, 3, 'Bar Tool Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 04:59:12', '2023-05-30 04:59:12'),
(29, 3, 'Two Seater Sofa Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:01:10', '2023-05-30 05:01:10'),
(30, 3, 'Single Seater Sofa', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:01:33', '2023-05-30 05:01:33'),
(31, 3, 'Tea Table Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:02:38', '2023-05-30 05:02:38'),
(32, 3, 'Round Table Purchase', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:02:55', '2023-05-30 05:02:55'),
(33, 5, 'Pen', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:04:08', '2023-05-30 05:04:08'),
(34, 5, 'Note Book', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:04:35', '2023-05-30 05:04:35'),
(35, 5, 'Stapler', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:05:15', '2023-05-30 05:05:15'),
(36, 5, 'Stapler Pin', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:05:27', '2023-05-30 05:05:27'),
(37, 5, 'Pen Folder', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:05:48', '2023-05-30 05:05:48'),
(38, 5, 'Office File', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:06:02', '2023-05-30 05:06:02'),
(39, 5, 'Offset Paper', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:06:20', '2023-05-30 05:06:20'),
(40, 5, 'Printer Ink', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:06:36', '2023-05-30 05:06:36'),
(41, 5, 'Punch Machine', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:07:16', '2023-05-30 05:07:16'),
(42, 5, 'Calculator', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:07:32', '2023-05-30 05:07:32'),
(43, 5, 'Measurement Scale', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:07:52', '2023-05-30 05:07:52'),
(44, 5, 'Mouse Pad', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:08:07', '2023-05-30 05:08:07'),
(45, 5, 'File Folder', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:08:23', '2023-05-30 05:08:23'),
(46, 1, 'Legal Advisor', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:09:23', '2023-05-30 05:09:23'),
(47, 1, 'Production Sample', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:10:10', '2023-05-30 05:10:10'),
(48, 1, 'Official T-Shirt', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:10:35', '2023-05-30 05:10:35'),
(49, 1, 'Evening Snacks', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:14:01', '2023-05-30 05:14:01'),
(50, 1, 'Lunch', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:14:26', '2023-05-30 05:14:26'),
(51, 1, 'Facial Tissue', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:14:57', '2023-05-30 05:14:57'),
(52, 1, 'Toilet Tissue', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:15:12', '2023-05-30 05:15:12'),
(53, 1, 'Toilet Cleaner', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:15:42', '2023-05-30 05:15:42'),
(54, 1, 'Hand Wash Refill', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:15:59', '2023-05-30 05:15:59'),
(55, 1, 'Hand Wash', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:16:10', '2023-05-30 05:16:10'),
(56, 1, 'Mr. Brasho (Glass Cleaner)', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:16:36', '2023-05-30 05:16:36'),
(57, 5, 'Pencil Battery', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:17:11', '2023-05-30 05:17:11'),
(58, 1, 'LED Bulb', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:17:31', '2023-05-30 05:17:31'),
(59, 6, 'Fish', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:18:26', '2023-05-30 05:18:26'),
(60, 6, 'Chicken', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:18:40', '2023-05-30 05:18:40'),
(61, 6, 'Grocery Item', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:18:56', '2023-05-30 05:18:56'),
(62, 6, 'Vegetable', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:19:24', '2023-05-30 05:19:24'),
(63, 6, 'Soft Drinks', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:19:45', '2023-05-30 05:19:45'),
(64, 6, 'Rice', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:20:09', '2023-05-30 05:20:09'),
(65, 6, 'Potato', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:20:27', '2023-05-30 05:20:27'),
(66, 6, 'Onion', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:20:39', '2023-05-30 05:20:39'),
(67, 6, 'Spices', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:20:57', '2023-05-30 05:20:57'),
(68, 6, 'Tea Leaf', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:23:13', '2023-05-30 05:23:13'),
(69, 6, 'Biscuits', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:23:32', '2023-05-30 05:23:32'),
(70, 6, 'Egg', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:23:43', '2023-05-30 05:23:43'),
(71, 6, 'Bread', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:23:57', '2023-05-30 05:23:57'),
(72, 6, 'Pizza', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:24:17', '2023-05-30 05:24:17'),
(73, 6, 'Kacchi Biriyani', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:24:40', '2023-05-30 05:24:40'),
(74, 6, 'Chanachur', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:24:54', '2023-05-30 05:24:54'),
(75, 6, 'Suger', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:25:08', '2023-05-30 05:25:08'),
(76, 6, 'Liquid Milk', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:25:28', '2023-05-30 05:25:28'),
(77, 6, 'Powder Milk', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:25:42', '2023-05-30 05:25:42'),
(78, 6, 'Bin Polly', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:26:23', '2023-05-30 05:26:23'),
(79, 6, 'Bua BIll', NULL, NULL, NULL, NULL, NULL, 'Debit', 1, '2023-05-30 05:26:46', '2023-05-30 05:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sectors`
--

CREATE TABLE `transaction_sectors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sectors`
--

INSERT INTO `transaction_sectors` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Office Expense', 1, '2023-05-12 14:24:43', '2023-05-12 14:24:43'),
(2, 'Project Expense', 1, '2023-05-18 05:09:06', '2023-05-18 05:09:06'),
(3, 'Company Asset', 1, '2023-05-30 04:50:18', '2023-05-30 04:50:18'),
(4, 'Govt. Charge', 1, '2023-05-30 04:56:05', '2023-05-30 04:56:05'),
(5, 'Office Stationary', 1, '2023-05-30 05:04:08', '2023-05-30 05:04:08'),
(6, 'Daily Lunch & Others Food', 1, '2023-05-30 05:18:26', '2023-05-30 05:22:41');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `measurement_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `measurement_category_id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kilogram', 'kg', 1, '2023-04-09 22:47:04', '2023-04-09 22:47:04'),
(2, 1, 'Gram', 'g', 1, '2023-04-09 22:49:26', '2023-04-09 22:55:20'),
(3, 1, 'Liter', 'L', 1, '2023-04-09 22:50:30', '2023-04-09 22:50:30'),
(4, 1, 'Milliliter', 'ml', 1, '2023-04-09 22:51:48', '2023-04-09 22:51:48'),
(5, 1, 'Meter', 'm', 1, '2023-04-09 22:52:11', '2023-04-09 22:52:11'),
(6, 1, 'Centimeter', 'cm', 1, '2023-04-09 22:52:35', '2023-04-09 22:52:35'),
(7, 1, 'Millimeter', 'mm', 1, '2023-04-09 22:52:57', '2023-04-09 22:52:57'),
(8, 1, 'Piece', 'Pc', 1, '2023-04-09 22:56:15', '2023-04-09 22:56:15'),
(9, 1, 'KB', 'KB', 1, '2023-05-03 06:09:28', '2023-05-03 06:09:28'),
(10, 1, 'Cft', 'Cft', 1, '2023-05-03 06:09:42', '2023-05-03 06:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `unit_conversions`
--

CREATE TABLE `unit_conversions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `times` double(16,12) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unit_conversions`
--

INSERT INTO `unit_conversions` (`id`, `from`, `to`, `times`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1000.000000000000, '2023-04-09 23:17:07', '2023-04-09 23:17:07'),
(2, 2, 1, 0.001000000000, '2023-04-09 23:17:28', '2023-04-09 23:17:28'),
(3, 3, 4, 1000.000000000000, '2023-04-09 23:17:51', '2023-04-09 23:17:51'),
(4, 4, 3, 0.001000000000, '2023-04-09 23:18:10', '2023-04-09 23:18:10'),
(5, 5, 6, 100.000000000000, '2023-04-09 23:18:43', '2023-04-09 23:18:43'),
(6, 5, 7, 1000.000000000000, '2023-04-09 23:18:43', '2023-04-09 23:18:43'),
(7, 6, 5, 0.010000000000, '2023-04-09 23:19:32', '2023-04-09 23:19:32'),
(8, 6, 7, 10.000000000000, '2023-04-09 23:19:32', '2023-04-09 23:19:32'),
(9, 7, 6, 0.100000000000, '2023-04-09 23:20:05', '2023-04-09 23:20:05'),
(10, 7, 5, 0.001000000000, '2023-04-09 23:20:05', '2023-04-09 23:20:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Imran', 'md.imran300028@gmail.com', NULL, NULL, '$2y$10$mG5w9IZ4DyrF.QjTmfiaN.5CttqlxZLd7U.wMbCLGcntDk1FVJl1K', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, '2023-03-30 07:18:05', '2023-04-01 19:04:40'),
(2, 'Fakrul Islam', 'jeweldu2010@gmail.com', '01303321259', NULL, '$2y$10$YofxZdB/s3udAyjNDj8aw.OpcnY6GJBsLEeffw8e1GECGR.JFr90m', NULL, NULL, NULL, NULL, NULL, 'assets/app/user/1680303724_5661_1665384490_ (1).jpeg', 2, 1, '2023-03-31 22:45:39', '2023-03-31 23:02:04'),
(3, 'Sajib Majumder', 'skmsajib@gmail.com', '01712626536', NULL, '$2y$10$SuhcYYn6V9AXppQtvk1hzOL8LVAMdkf8AogFGRNP4UHIndZxCSoZy', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '2023-05-03 05:03:42', '2023-05-03 05:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_types`
--

CREATE TABLE `vendor_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor_type_clients`
--

CREATE TABLE `vendor_type_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_type_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_loans`
--
ALTER TABLE `bank_loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_loan_transactions`
--
ALTER TABLE `bank_loan_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_transaction_items`
--
ALTER TABLE `bank_transaction_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chalans`
--
ALTER TABLE `chalans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chalan_details`
--
ALTER TABLE `chalan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_payments`
--
ALTER TABLE `client_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_types`
--
ALTER TABLE `client_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `item_groups`
--
ALTER TABLE `item_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `measurement_categories`
--
ALTER TABLE `measurement_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_supplies`
--
ALTER TABLE `product_supplies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_supply_details`
--
ALTER TABLE `product_supply_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_additional_infos`
--
ALTER TABLE `project_additional_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_vendors`
--
ALTER TABLE `project_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_units`
--
ALTER TABLE `quotation_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raw_quotations`
--
ALTER TABLE `raw_quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `raw_quotation_details`
--
ALTER TABLE `raw_quotation_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `signatories`
--
ALTER TABLE `signatories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_infos`
--
ALTER TABLE `site_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_projects`
--
ALTER TABLE `sub_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_sectors`
--
ALTER TABLE `transaction_sectors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit_conversions`
--
ALTER TABLE `unit_conversions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendor_types`
--
ALTER TABLE `vendor_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_type_clients`
--
ALTER TABLE `vendor_type_clients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_loans`
--
ALTER TABLE `bank_loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_loan_transactions`
--
ALTER TABLE `bank_loan_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_transactions`
--
ALTER TABLE `bank_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_transaction_items`
--
ALTER TABLE `bank_transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chalans`
--
ALTER TABLE `chalans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chalan_details`
--
ALTER TABLE `chalan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `client_payments`
--
ALTER TABLE `client_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `client_types`
--
ALTER TABLE `client_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_groups`
--
ALTER TABLE `item_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurement_categories`
--
ALTER TABLE `measurement_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_supplies`
--
ALTER TABLE `product_supplies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_supply_details`
--
ALTER TABLE `product_supply_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_additional_infos`
--
ALTER TABLE `project_additional_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_vendors`
--
ALTER TABLE `project_vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `quotation_units`
--
ALTER TABLE `quotation_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `raw_quotations`
--
ALTER TABLE `raw_quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `raw_quotation_details`
--
ALTER TABLE `raw_quotation_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=280;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `signatories`
--
ALTER TABLE `signatories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_infos`
--
ALTER TABLE `site_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_projects`
--
ALTER TABLE `sub_projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `transaction_sectors`
--
ALTER TABLE `transaction_sectors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `unit_conversions`
--
ALTER TABLE `unit_conversions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_types`
--
ALTER TABLE `vendor_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor_type_clients`
--
ALTER TABLE `vendor_type_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
