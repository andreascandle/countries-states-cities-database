CREATE TABLE `countries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`code`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `code` char(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`code`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `Fk_Province_Country` (`country`),
  CONSTRAINT `Fk_Province_Country` FOREIGN KEY (`country`) REFERENCES `countries` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4853 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `state_code` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cities_states_idx` (`state_code`),
  KEY `fk_cities_countries_idx` (`country_code`),
  CONSTRAINT `fk_cities_countries` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  CONSTRAINT `fk_cities_states` FOREIGN KEY (`state_code`) REFERENCES `states` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=141852 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
