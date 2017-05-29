/*
Navicat MySQL Data Transfer

Source Server         : mysql-ubuntu-ruby
Source Server Version : 50717
Source Host           : 192.168.83.129:3306
Source Database       : nezha

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-26 17:06:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `lat` decimal(10,6) DEFAULT NULL,
  `lng` decimal(10,6) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `addressable_type` varchar(255) DEFAULT NULL,
  `addressable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_addressable_type_and_addressable_id` (`addressable_type`,`addressable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ar_internal_metadata
-- ----------------------------
DROP TABLE IF EXISTS `ar_internal_metadata`;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for categories_cities
-- ----------------------------
DROP TABLE IF EXISTS `categories_cities`;
CREATE TABLE `categories_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_cities_on_city_id` (`city_id`),
  KEY `index_categories_cities_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_5782bedd27` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_bac669e2a1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_on_region_id` (`region_id`),
  CONSTRAINT `fk_rails_e0ef2914ca` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cities_promotion_rules
-- ----------------------------
DROP TABLE IF EXISTS `cities_promotion_rules`;
CREATE TABLE `cities_promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_promotion_rules_on_city_id` (`city_id`),
  KEY `index_cities_promotion_rules_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cities_workers
-- ----------------------------
DROP TABLE IF EXISTS `cities_workers`;
CREATE TABLE `cities_workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cities_workers_on_city_id` (`city_id`),
  KEY `index_cities_workers_on_worker_id` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon_lists
-- ----------------------------
DROP TABLE IF EXISTS `coupon_lists`;
CREATE TABLE `coupon_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `validity_type` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `fixed_begin_term` int(11) DEFAULT NULL,
  `fixed_term` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_list_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_coupons_on_coupon_list_id` (`coupon_list_id`),
  KEY `index_coupons_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_69b54b3afe` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_ff28daec78` FOREIGN KEY (`coupon_list_id`) REFERENCES `coupon_lists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for couriers
-- ----------------------------
DROP TABLE IF EXISTS `couriers`;
CREATE TABLE `couriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `last_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_couriers_on_email` (`email`),
  UNIQUE KEY `index_couriers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- ----------------------------
-- Table structure for couriers_stations
-- ----------------------------
DROP TABLE IF EXISTS `couriers_stations`;
CREATE TABLE `couriers_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courier_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_couriers_stations_on_courier_id` (`courier_id`),
  KEY `index_couriers_stations_on_station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factories
-- ----------------------------
DROP TABLE IF EXISTS `factories`;
CREATE TABLE `factories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `last_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fname` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `fmoblie` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_factories_on_email` (`email`),
  UNIQUE KEY `index_factories_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- ----------------------------
-- Table structure for factories_stations
-- ----------------------------
DROP TABLE IF EXISTS `factories_stations`;
CREATE TABLE `factories_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `station_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_factories_stations_on_factory_id` (`factory_id`),
  KEY `index_factories_stations_on_station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factory_process_records
-- ----------------------------
DROP TABLE IF EXISTS `factory_process_records`;
CREATE TABLE `factory_process_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `process_on` date DEFAULT NULL,
  `amount` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_factory_process_records_on_factory_id` (`factory_id`),
  KEY `index_factory_process_records_on_category_id` (`category_id`),
  KEY `index_factory_process_records_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_aafa6b58d0` FOREIGN KEY (`factory_id`) REFERENCES `factories` (`id`),
  CONSTRAINT `fk_rails_bc06e9c2be` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_f447ff84e3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factory_settlement_records
-- ----------------------------
DROP TABLE IF EXISTS `factory_settlement_records`;
CREATE TABLE `factory_settlement_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `settlement_on` date DEFAULT NULL,
  `amount` int(11) DEFAULT '0',
  `price` float DEFAULT '0',
  `money` float DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_factory_settlement_records_on_factory_id` (`factory_id`),
  KEY `index_factory_settlement_records_on_category_id` (`category_id`),
  KEY `index_factory_settlement_records_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_531a94c359` FOREIGN KEY (`factory_id`) REFERENCES `factories` (`id`),
  CONSTRAINT `fk_rails_e31e197967` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_e6b029541c` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for factory_settlement_rules
-- ----------------------------
DROP TABLE IF EXISTS `factory_settlement_rules`;
CREATE TABLE `factory_settlement_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `factory_id` int(11) DEFAULT NULL,
  `settlement_rule_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_factory_settlement_rules_on_factory_id` (`factory_id`),
  KEY `index_factory_settlement_rules_on_settlement_rule_id` (`settlement_rule_id`),
  CONSTRAINT `fk_rails_475d6f493c` FOREIGN KEY (`factory_id`) REFERENCES `factories` (`id`),
  CONSTRAINT `fk_rails_6c1d7ffa44` FOREIGN KEY (`settlement_rule_id`) REFERENCES `settlement_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_items_on_product_id` (`product_id`),
  KEY `index_items_on_order_id` (`order_id`),
  CONSTRAINT `fk_rails_53153f3b4b` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_rails_9a56345cfd` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order_promotions
-- ----------------------------
DROP TABLE IF EXISTS `order_promotions`;
CREATE TABLE `order_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `premise` float DEFAULT NULL,
  `coupon_list_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_promotions_on_coupon_list_id` (`coupon_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `courier_status` int(11) DEFAULT '0',
  `voucher_status` int(11) DEFAULT '0',
  `cleaning_status` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `waybill_id` int(11) DEFAULT NULL,
  `factory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_category_id` (`category_id`),
  KEY `index_orders_on_user_id` (`user_id`),
  KEY `index_orders_on_address_id` (`address_id`),
  KEY `index_orders_on_waybill_id` (`waybill_id`),
  KEY `index_orders_on_factory_id` (`factory_id`),
  CONSTRAINT `fk_rails_3dd05aae5e` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_774ef80392` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `fk_rails_f868b47f6a` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for price_rules
-- ----------------------------
DROP TABLE IF EXISTS `price_rules`;
CREATE TABLE `price_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_price_rules_on_city_id` (`city_id`),
  KEY `index_price_rules_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_83ffc065e0` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_rails_eb7b443a9f` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for prices
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price1` float DEFAULT '0',
  `price2` float DEFAULT '0',
  `price3` float DEFAULT '0',
  `price4` float DEFAULT '0',
  `price5` float DEFAULT '0',
  `price6` float DEFAULT '0',
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_prices_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_b8ee0bfea1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for product_items
-- ----------------------------
DROP TABLE IF EXISTS `product_items`;
CREATE TABLE `product_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_items_on_order_id` (`order_id`),
  KEY `index_product_items_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_00f7aa94fd` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_02ba65545e` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `is_del` tinyint(1) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_fb915499a4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_rules
-- ----------------------------
DROP TABLE IF EXISTS `promotion_rules`;
CREATE TABLE `promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_list_id` int(11) DEFAULT NULL,
  `start_on` date DEFAULT NULL,
  `end_on` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promotion_rules_on_coupon_list_id` (`coupon_list_id`),
  CONSTRAINT `fk_rails_4215db7442` FOREIGN KEY (`coupon_list_id`) REFERENCES `coupon_lists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_regions_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for settlement_prices
-- ----------------------------
DROP TABLE IF EXISTS `settlement_prices`;
CREATE TABLE `settlement_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settlement_rule_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settlement_prices_on_settlement_rule_id` (`settlement_rule_id`),
  KEY `index_settlement_prices_on_product_id` (`product_id`),
  CONSTRAINT `fk_rails_cbce5a341c` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_e6259d5046` FOREIGN KEY (`settlement_rule_id`) REFERENCES `settlement_rules` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for settlement_rules
-- ----------------------------
DROP TABLE IF EXISTS `settlement_rules`;
CREATE TABLE `settlement_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settlement_rules_on_category_id` (`category_id`),
  KEY `index_settlement_rules_on_city_id` (`city_id`),
  CONSTRAINT `fk_rails_42d269dd40` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_b8c6322fa8` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for stations
-- ----------------------------
DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_stations_on_region_id` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_card_charge_settings
-- ----------------------------
DROP TABLE IF EXISTS `user_card_charge_settings`;
CREATE TABLE `user_card_charge_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` float DEFAULT '0',
  `money_give` float DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_card_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_card_logs`;
CREATE TABLE `user_card_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` int(11) DEFAULT '0',
  `real_money` float DEFAULT '0',
  `fake_money` float DEFAULT '0',
  `loggable_type` varchar(255) DEFAULT NULL,
  `loggable_id` int(11) DEFAULT NULL,
  `user_card_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_card_logs_on_user_card_id` (`user_card_id`),
  KEY `index_user_card_logs_on_loggable_type_and_loggable_id` (`loggable_type`,`loggable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_cards
-- ----------------------------
DROP TABLE IF EXISTS `user_cards`;
CREATE TABLE `user_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_money` float DEFAULT '0',
  `fake_money` float DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_cards_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_5826569569` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `last_sign_in_ip` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- ----------------------------
-- Table structure for vouchers
-- ----------------------------
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE `vouchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `payed_at` datetime DEFAULT NULL,
  `money` float DEFAULT NULL,
  `user_card_pay` float DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `coupon_pay` float DEFAULT '0',
  `coupon_id` int(11) DEFAULT NULL,
  `user_card_fake_money_pay` float DEFAULT '0',
  `refunded` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_vouchers_on_order_id` (`order_id`),
  KEY `index_vouchers_on_coupon_id` (`coupon_id`),
  CONSTRAINT `fk_rails_dad762264d` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waybills
-- ----------------------------
DROP TABLE IF EXISTS `waybills`;
CREATE TABLE `waybills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT '0',
  `sender_type` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_type` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `waybill_id` int(11) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL,
  `actual_time` datetime DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_waybills_on_waybill_id` (`waybill_id`),
  KEY `index_waybills_on_order_id` (`order_id`),
  KEY `index_waybills_on_sender_type_and_sender_id` (`sender_type`,`sender_id`),
  KEY `index_waybills_on_receiver_type_and_receiver_id` (`receiver_type`,`receiver_id`),
  CONSTRAINT `fk_rails_7ce9a1fb31` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workers
-- ----------------------------
DROP TABLE IF EXISTS `workers`;
CREATE TABLE `workers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_workers_on_email` (`email`),
  UNIQUE KEY `index_workers_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for workers_roles
-- ----------------------------
DROP TABLE IF EXISTS `workers_roles`;
CREATE TABLE `workers_roles` (
  `worker_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_workers_roles_on_worker_id_and_role_id` (`worker_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
