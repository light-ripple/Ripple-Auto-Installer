 -- -------------------------------------------------------- --
-- Host:                         Ripple                     --
-- Server version:               5.7.28-Bedrock-0.7.17-(BR) --
-- Server OS:                    Linux                      --
-- -------------------------------------------------------- --


-- Dumping structure for table 2fa --
CREATE TABLE IF NOT EXISTS `2fa`
             (
                          `userid` INT(11) NOT NULL,
                          `ip`     INT(11) NOT NULL,
                          PRIMARY KEY (`userid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table 2fa_telegram --CREATE TABLE IF NOT EXISTS `2fa_telegram`
             (
                          `id`     INT(11) NOT NULL auto_increment,
                          `userid` INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table 2fa_totp --CREATE TABLE IF NOT EXISTS `2fa_totp`
             (
                          `enabled` TINYINT(1) NOT NULL DEFAULT '0',
                          `userid`  INT(11) NOT NULL,
                          PRIMARY KEY (`userid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table achievements --CREATE TABLE IF NOT EXISTS `achievements`
             (
                          `id` INT(11) NOT NULL,
                          `name` MEDIUMTEXT NOT NULL,
                          `description` MEDIUMTEXT NOT NULL,
                          `icon` MEDIUMTEXT NOT NULL,
                          `version` INT(11) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping data achievements --INSERT IGNORE
into   `achievements`
       (
              `id`,
              `name`,
              `description`,
              `icon`,
              `version`
       )
       VALUES
       (
              1,
              '500 Combo (osu!std)',
              '500 big ones! You\'re moving up in the world!',
              'osu-combo-500',
              1
       )
       ,
       (
              2,
              '750 Combo (osu!std)',
              '750 big ones! You\'re moving up in the world!',
              'osu-combo-750',
              1
       )
       ,
       (
              3,
              '1000 Combo (osu!std)',
              '1000 big ones! You\'re moving up in the world!',
              'osu-combo-1000',
              1
       )
       ,
       (
              4,
              '2000 Combo (osu!std)',
              '2000 big ones! You\'re moving up in the world!',
              'osu-combo-2000',
              1
       )
       ,
       (
              5,
              '500 Combo (osu!taiko)',
              '500 big ones! You\'re moving up in the world!',
              'osu-combo-500',
              1
       )
       ,
       (
              6,
              '750 Combo (osu!taiko)',
              '750 big ones! You\'re moving up in the world!',
              'osu-combo-750',
              1
       )
       ,
       (
              7,
              '1000 Combo (osu!taiko)',
              '1000 big ones! You\'re moving up in the world!',
              'osu-combo-1000',
              1
       )
       ,
       (
              8,
              '2000 Combo (osu!taiko)',
              '2000 big ones! You\'re moving up in the world!',
              'osu-combo-2000',
              1
       )
       ,
       (
              9,
              '500 Combo (osu!ctb)',
              '500 big ones! You\'re moving up in the world!',
              'osu-combo-500',
              1
       )
       ,
       (
              10,
              '750 Combo (osu!ctb)',
              '750 big ones! You\'re moving up in the world!',
              'osu-combo-750',
              1
       )
       ,
       (
              11,
              '1000 Combo (osu!ctb)',
              '1000 big ones! You\'re moving up in the world!',
              'osu-combo-1000',
              1
       )
       ,
       (
              12,
              '2000 Combo (osu!ctb)',
              '2000 big ones! You\'re moving up in the world!',
              'osu-combo-2000',
              1
       )
       ,
       (
              13,
              '500 Combo (osu!mania)',
              '500 big ones! You\'re moving up in the world!',
              'osu-combo-500',
              1
       )
       ,
       (
              14,
              '750 Combo (osu!mania)',
              '750 big ones! You\'re moving up in the world!',
              'osu-combo-750',
              1
       )
       ,
       (
              15,
              '1000 Combo (osu!mania)',
              '1000 big ones! You\'re moving up in the world!',
              'osu-combo-1000',
              1
       )
       ,
       (
              16,
              '2000 Combo (osu!mania)',
              '2000 big ones! You\'re moving up in the world!',
              'osu-combo-2000',
              1
       )
       ,
       (
              17,
              'Rising Star',
              'Can\'t go forward without the first steps.',
              'osu-skill-pass-1',
              2
       )
       ,
       (
              18,
              'My First Don',
              'Can\'t go forward without the first steps.',
              'taiko-skill-pass-1',
              2
       )
       ,
       (
              19,
              'A Slice Of Life',
              'Can\'t go forward without the first steps.',
              'fruits-skill-pass-1',
              2
       )
       ,
       (
              20,
              'First Steps',
              'Can\'t go forward without the first steps.',
              'mania-skill-pass-1',
              2
       )
       ,
       (
              21,
              'Constellation Prize',
              'Definitely not a consolation prize. Now things start getting hard!',
              'osu-skill-pass-2',
              2
       )
       ,
       (
              22,
              'Katsu Katsu Katsu',
              'Definitely not a consolation prize. Now things start getting hard!',
              'taiko-skill-pass-2',
              2
       )
       ,
       (
              23,
              'Dashing Ever Forward',
              'Definitely not a consolation prize. Now things start getting hard!',
              'fruits-skill-pass-2',
              2
       )
       ,
       (
              24,
              'No Normal Player',
              'Definitely not a consolation prize. Now things start getting hard!',
              'mania-skill-pass-2',
              2
       )
       ,
       (
              25,
              'Building Confidence',
              'Oh, you\'ve SO got this.',
              'osu-skill-pass-3',
              2
       )
       ,
       (
              26,
              'Not Even Trying',
              'Oh, you\'ve SO got this.',
              'taiko-skill-pass-3',
              2
       )
       ,
       (
              27,
              'Zesty Disposition',
              'Oh, you\'ve SO got this.',
              'fruits-skill-pass-3',
              2
       )
       ,
       (
              28,
              'Impulse Drive',
              'Oh, you\'ve SO got this.',
              'mania-skill-pass-3',
              2
       )
       ,
       (
              29,
              'Insanity Approaches',
              'You\'re not twitching, you\'re just ready.',
              'osu-skill-pass-4',
              2
       )
       ,
       (
              30,
              'Face Your Demons',
              'You\'re not twitching, you\'re just ready.',
              'taiko-skill-pass-4',
              2
       )
       ,
       (
              31,
              'Hyperdash ON!',
              'You\'re not twitching, you\'re just ready.',
              'fruits-skill-pass-4',
              2
       )
       ,
       (
              32,
              'Hyperspeed',
              'You\'re not twitching, you\'re just ready.',
              'mania-skill-pass-4',
              2
       )
       ,
       (
              33,
              'These Clarion Skies',
              'Everything seems so clear now.',
              'osu-skill-pass-5',
              2
       )
       ,
       (
              34,
              'The Demon Within',
              'Everything seems so clear now.',
              'taiko-skill-pass-5',
              2
       )
       ,
       (
              35,
              'It\'s Raining Fruit',
              'Everything seems so clear now.',
              'fruits-skill-pass-5',
              2
       )
       ,
       (
              36,
              'Ever Onwards',
              'Everything seems so clear now.',
              'mania-skill-pass-5',
              2
       )
       ,
       (
              37,
              'Above and Beyond',
              'A cut above the rest.',
              'osu-skill-pass-6',
              2
       )
       ,
       (
              38,
              'Drumbreaker',
              'A cut above the rest.',
              'taiko-skill-pass-6',
              2
       )
       ,
       (
              39,
              'Fruit Ninja',
              'A cut above the rest.',
              'fruits-skill-pass-6',
              2
       )
       ,
       (
              40,
              'Another Surpassed',
              'A cut above the rest.',
              'mania-skill-pass-6',
              2
       )
       ,
       (
              41,
              'Supremacy',
              'All marvel before your prowess.',
              'osu-skill-pass-7',
              2
       )
       ,
       (
              42,
              'The Godfather',
              'All marvel before your prowess.',
              'taiko-skill-pass-7',
              2
       )
       ,
       (
              43,
              'Dreamcatcher',
              'All marvel before your prowess.',
              'fruits-skill-pass-7',
              2
       )
       ,
       (
              44,
              'Extra Credit',
              'All marvel before your prowess.',
              'mania-skill-pass-7',
              2
       )
       ,
       (
              45,
              'Absolution',
              'My god, you\'re full of stars!',
              'osu-skill-pass-8',
              2
       )
       ,
       (
              46,
              'Rhythm Incarnate',
              'My god, you\'re full of stars!',
              'taiko-skill-pass-8',
              2
       )
       ,
       (
              47,
              'Lord of the Catch',
              'My god, you\'re full of stars!',
              'fruits-skill-pass-8',
              2
       )
       ,
       (
              48,
              'Maniac',
              'My god, you\'re full of stars!',
              'mania-skill-pass-8',
              2
       )
       ,
       (
              49,
              'Totality',
              'All the notes. Every single one.',
              'osu-skill-fc-1',
              3
       )
       ,
       (
              50,
              'Keeping Time',
              'All the notes. Every single one.',
              'taiko-skill-fc-1',
              3
       )
       ,
       (
              51,
              'Sweet And Sour',
              'All the notes. Every single one.',
              'fruits-skill-fc-1',
              3
       )
       ,
       (
              52,
              'Keystruck',
              'All the notes. Every single one.',
              'mania-skill-fc-1',
              3
       )
       ,
       (
              53,
              'Business As Usual',
              'Two to go, please.',
              'osu-skill-fc-2',
              3
       )
       ,
       (
              54,
              'To Your Own Beat',
              'Two to go, please.',
              'taiko-skill-fc-2',
              3
       )
       ,
       (
              55,
              'Reaching The Core',
              'Two to go, please.',
              'fruits-skill-fc-2',
              3
       )
       ,
       (
              56,
              'Keying In',
              'Two to go, please.',
              'mania-skill-fc-2',
              3
       )
       ,
       (
              57,
              'Building Steam',
              'Hey, this isn\'t so bad.',
              'osu-skill-fc-3',
              3
       )
       ,
       (
              58,
              'Big Drums',
              'Hey, this isn\'t so bad.',
              'taiko-skill-fc-3',
              3
       )
       ,
       (
              59,
              'Clean Platter',
              'Hey, this isn\'t so bad.',
              'fruits-skill-fc-3',
              3
       )
       ,
       (
              60,
              'Hyperflow',
              'Hey, this isn\'t so bad.',
              'mania-skill-fc-3',
              3
       )
       ,
       (
              61,
              'Moving Forward',
              'Bet you feel good about that.',
              'osu-skill-fc-4',
              3
       )
       ,
       (
              62,
              'Adversity Overcome',
              'Bet you feel good about that.',
              'taiko-skill-fc-4',
              3
       )
       ,
       (
              63,
              'Between The Rain',
              'Bet you feel good about that.',
              'fruits-skill-fc-4',
              3
       )
       ,
       (
              64,
              'Breakthrough',
              'Bet you feel good about that.',
              'mania-skill-fc-4',
              3
       )
       ,
       (
              65,
              'Paradigm Shift',
              'Surprisingly difficult.',
              'osu-skill-fc-5',
              3
       )
       ,
       (
              66,
              'Demonslayer',
              'Surprisingly difficult.',
              'taiko-skill-fc-5',
              3
       )
       ,
       (
              67,
              'Addicted',
              'Surprisingly difficult.',
              'fruits-skill-fc-5',
              3
       )
       ,
       (
              68,
              'Everything Extra',
              'Surprisingly difficult.',
              'mania-skill-fc-5',
              3
       )
       ,
       (
              69,
              'Anguish Quelled',
              'Don\'t choke.',
              'osu-skill-fc-6',
              3
       )
       ,
       (
              70,
              'Rhythm\'s Call',
              'Don\'t choke.',
              'taiko-skill-fc-6',
              3
       )
       ,
       (
              71,
              'Quickening',
              'Don\'t choke.',
              'fruits-skill-fc-6',
              3
       )
       ,
       (
              72,
              'Level Breaker',
              'Don\'t choke.',
              'mania-skill-fc-6',
              3
       )
       ,
       (
              73,
              'Never Give Up',
              'Excellence is its own reward.',
              'osu-skill-fc-7',
              3
       )
       ,
       (
              74,
              'Time Everlasting',
              'Excellence is its own reward.',
              'taiko-skill-fc-7',
              3
       )
       ,
       (
              75,
              'Supersonic',
              'Excellence is its own reward.',
              'fruits-skill-fc-7',
              3
       )
       ,
       (
              76,
              'Step Up',
              'Excellence is its own reward.',
              'mania-skill-fc-7',
              3
       )
       ,
       (
              77,
              'Aberration',
              'They said it couldn\'t be done. They were wrong.',
              'osu-skill-fc-8',
              3
       )
       ,
       (
              78,
              'The Drummer\'s Throne',
              'They said it couldn\'t be done. They were wrong.',
              'taiko-skill-fc-8',
              3
       )
       ,
       (
              79,
              'Dashing Scarlet',
              'They said it couldn\'t be done. They were wrong.',
              'fruits-skill-fc-8',
              3
       )
       ,
       (
              80,
              'Behind The Veil',
              'They said it couldn\'t be done. They were wrong.',
              'mania-skill-fc-8',
              3
       )
       ,
       (
              81,
              'Finality',
              'High stakes, no regrets.',
              'all-intro-suddendeath',
              4
       )
       ,
       (
              82,
              'Perfectionist',
              'Accept nothing but the best.',
              'all-intro-perfect',
              4
       )
       ,
       (
              83,
              'Rock Around The Clock',
              'You can\'t stop the rock.',
              'all-intro-hardrock',
              4
       )
       ,
       (
              84,
              'Time And A Half',
              'Having a right ol\' time. One and a half of them, almost.',
              'all-intro-doubletime',
              4
       )
       ,
       (
              85,
              'Sweet Rave Party',
              'Founded in the fine tradition of changing things that were just fine as they were.',
              'all-intro-nightcore',
              4
       )
       ,
       (
              86,
              'Blindsight',
              'I can see just perfectly.',
              'all-intro-hidden',
              4
       )
       ,
       (
              87,
              'Are You Afraid Of The Dark?',
              'Harder than it looks, probably because it\'s hard to look.',
              'all-intro-flashlight',
              4
       )
       ,
       (
              88,
              'Dial It Right Back',
              'Sometimes you just want to take it easy.',
              'all-intro-easy',
              4
       )
       ,
       (
              89,
              'Risk Averse',
              'Safety nets are fun!',
              'all-intro-nofail',
              4
       )
       ,
       (
              90,
              'Slowboat',
              'You got there. Eventually.',
              'all-intro-halftime',
              4
       )
       ,
       (
              91,
              'Burned Out',
              'One cannot always spin to win.',
              'all-intro-spunout',
              4
       )
       ,
       (
              92,
              '5,000 Plays',
              'There\'s a lot more where that came from.',
              'osu-plays-5000',
              5
       )
       ,
       (
              93,
              '15,000 Plays',
              'Must.. click.. circles..',
              'osu-plays-15000',
              5
       )
       ,
       (
              94,
              '25,000 Plays',
              'There\'s no going back.',
              'osu-plays-25000',
              5
       )
       ,
       (
              95,
              '50,000 Plays',
              'You\'re here forever.',
              'osu-plays-50000',
              5
       )
       ,
       (
              96,
              'A meganekko approaches',
              'Congratulations, you met Maria!',
              'mania-secret-meganekko',
              6
       )
       ,
       (
              97,
              'Don\'t let the bunny distract you!',
              'The order was indeed, not a rabbit.',
              'all-secret-bunny',
              6
       );

-- Dumping structure for table anticheat_reports --CREATE TABLE IF NOT EXISTS `anticheat_reports`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `anticheat_id` INT(11) NOT NULL,
                          `score_id`     INT(11) NOT NULL,
                          `severity`     INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table badges --CREATE TABLE IF NOT EXISTS `badges`
             (
                          `id`   INT(11) NOT NULL auto_increment,
                          `name` VARCHAR(21485) NOT NULL,
                          `icon` VARCHAR(32) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=1014 DEFAULT charset=utf8;

-- Dumping data badges --INSERT IGNORE
into   `badges`
       (
              `id`,
              `name`,
              `icon`
       )
       VALUES
       (
              0,
              '',
              ''
       )
       ,
       (
              2,
              'Developers',
              'teal blind'
       )
       ,
       (
              3,
              'Bug Hunter',
              'bug icon'
       )
       ,
       (
              4,
              'Community Manager',
              'user secret'
       )
       ,
       (
              5,
              'Beatmap Nominators',
              'chart line'
       )
       ,
       (
              10,
              'SUSPICIOUS - WAITING FOR CHECK',
              'red window close outline'
       )
       ,
       (
              30,
              'Chat Moderators',
              'envelope outline'
       )
       ,
       (
              999,
              'socrates',
              'fa-plane'
       )
       ,
       (
              1000,
              'Thumbnail Maker',
              'fa-thumbs-o-up'
       )
       ,
       (
              1001,
              'Marathon Runner',
              'yellow hourglass outline'
       )
       ,
       (
              1002,
              'Donor',
              'yellow heart'
       )
       ,
       (
              1003,
              'ua',
              'universal access'
       )
       ,
       (
              1004,
              'Vanilla God (Certified by Kingkong)',
              'yellow fa-check'
       )
       ,
       (
              1005,
              'Bot',
              'blue shield alternate'
       );

-- Dumping structure for table bancho_channels --CREATE TABLE IF NOT EXISTS `bancho_channels`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `name`         VARCHAR(32) NOT NULL,
                          `description`  VARCHAR(127) NOT NULL,
                          `public_read`  TINYINT(4) NOT NULL,
                          `public_write` TINYINT(4) NOT NULL,
                          `status`       TINYINT(4) NOT NULL,
                          `temp`         TINYINT(1) NOT NULL DEFAULT '0',
                          `hidden`       TINYINT(1) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=8 DEFAULT charset=utf8;

-- Dumping data bancho_channels --INSERT IGNORE
into   `bancho_channels`
       (
              `id`,
              `name`,
              `description`,
              `public_read`,
              `public_write`,
              `status`,
              `temp`,
              `hidden`
       )
       VALUES
       (
              1,
              '#osu',
              'Windows global chat',
              1,
              1,
              1,
              0,
              0
       )
       ,
       (
              2,
              '#announce',
              'Announce channel',
              1,
              0,
              1,
              0,
              0
       )
       ,
       (
              3,
              '#ripple',
              'Ripple community',
              1,
              1,
              1,
              0,
              0
       )
       ,
       (
              4,
              '#english',
              'English community',
              1,
              1,
              1,
              0,
              0
       )
       ,
       (
              5,
              '#admin',
              'Administration',
              1,
              1,
              1,
              0,
              1
       )
       ,
       (
              6,
              '#lobby',
              'General Lobby',
              1,
              1,
              1,
              0,
              1
       )
       ,
       (
              7,
              '#ranked',
              'Ranked Maps General',
              1,
              0,
              1,
              0,
              0
       );

-- Dumping structure for table bancho_messages --CREATE TABLE IF NOT EXISTS `bancho_messages`
             (
                          `id`                INT(11) NOT NULL auto_increment,
                          `msg_from_userid`   INT(11) NOT NULL,
                          `msg_from_username` VARCHAR(30) NOT NULL,
                          `msg_to`            VARCHAR(32) NOT NULL,
                          `msg`               VARCHAR(127) NOT NULL,
                          `time`              INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table bancho_private_messages --CREATE TABLE IF NOT EXISTS `bancho_private_messages`
             (
                          `id`                INT(11) NOT NULL auto_increment,
                          `msg_from_userid`   INT(11) NOT NULL,
                          `msg_from_username` VARCHAR(30) NOT NULL,
                          `msg_to`            VARCHAR(32) NOT NULL,
                          `msg`               VARCHAR(127) NOT NULL,
                          `time`              INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table bancho_settings --CREATE TABLE IF NOT EXISTS `bancho_settings`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `name`         VARCHAR(32) NOT NULL,
                          `value_int`    INT(11) NOT NULL DEFAULT '0',
                          `value_string` VARCHAR(512) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=9 DEFAULT charset=utf8;

-- Dumping data bancho_settings --INSERT IGNORE
into   `bancho_settings`
       (
              `id`,
              `name`,
              `value_int`,
              `value_string`
       )
       VALUES
       (
              1,
              'bancho_maintenance',
              0,
              ''
       )
       ,
       (
              2,
              'free_direct',
              1,
              ''
       )
       ,
       (
              3,
              'menu_icon',
              1,
              'https://i.ppy.sh/logo.png | https://ripple.moe'
       )
       ,
       (
              4,
              'login_messages',
              1,
              ''
       )
       ,
       (
              5,
              'restricted_joke',
              0,
              'You\'re banned from the server.'
       )
       ,
       (
              6,
              'login_notification',
              1,
              'Welcome to Ripple Clone!'
       )
       ,
       (
              7,
              'osu_versions',
              0,
              ''
       )
       ,
       (
              8,
              'osu_md5s',
              0,
              ''
       );

-- Dumping structure for table bancho_tokens --CREATE TABLE IF NOT EXISTS `bancho_tokens`
             (
                          `id`                        INT(11) NOT NULL auto_increment,
                          `token`                     VARCHAR(16) NOT NULL,
                          `osu_id`                    INT(11) NOT NULL,
                          `latest_message_id`         INT(11) NOT NULL,
                          `latest_private_message_id` INT(11) NOT NULL,
                          `latest_packet_time`        INT(11) NOT NULL,
                          `latest_heavy_packet_time`  INT(11) NOT NULL,
                          `joined_channels`           VARCHAR(512) NOT NULL,
                          `game_mode`                 TINYINT(4) NOT NULL,
                          `action`                    INT(11) NOT NULL,
                          `action_text`               VARCHAR(128) NOT NULL,
                          `kicked`                    TINYINT(4) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table beatmaps --CREATE TABLE IF NOT EXISTS `beatmaps`
             (
                          `id`            INT(11) NOT NULL auto_increment,
                          `rankedby`      VARCHAR(32) NOT NULL DEFAULT 'Bancho',
                          `beatmap_id`    INT(11) NOT NULL DEFAULT '0',
                          `beatmapset_id` INT(11) NOT NULL DEFAULT '0',
                          `beatmap_md5`   VARCHAR(32) NOT NULL DEFAULT '',
                          `song_name` LONGTEXT NOT NULL,
                          `file_name` TEXT,
                          `ar` FLOAT NOT NULL DEFAULT '0',
                          `od` FLOAT NOT NULL DEFAULT '0',
                          `mode`   INT(11) NOT NULL DEFAULT '0',
                          `rating` INT(11) NOT NULL DEFAULT '10',
                          `difficulty_std` FLOAT NOT NULL DEFAULT '0',
                          `difficulty_taiko` FLOAT NOT NULL DEFAULT '0',
                          `difficulty_ctb` FLOAT NOT NULL DEFAULT '0',
                          `difficulty_mania` FLOAT NOT NULL DEFAULT '0',
                          `max_combo`             INT(11) NOT NULL DEFAULT '0',
                          `hit_length`            INT(11) NOT NULL DEFAULT '0',
                          `bpm`                   BIGINT(11) NOT NULL DEFAULT '0',
                          `playcount`             INT(11) NOT NULL DEFAULT '0',
                          `passcount`             INT(11) NOT NULL DEFAULT '0',
                          `ranked`                TINYINT(4) NOT NULL DEFAULT '0',
                          `latest_update`         INT(11) NOT NULL DEFAULT '0',
                          `ranked_status_freezed` TINYINT(1) NOT NULL DEFAULT '0',
                          `pp_100`                INT(11) NOT NULL DEFAULT '0',
                          `pp_99`                 INT(11) NOT NULL DEFAULT '0',
                          `pp_98`                 INT(11) NOT NULL DEFAULT '0',
                          `pp_95`                 INT(11) NOT NULL DEFAULT '0',
                          `disable_pp`            TINYINT(4) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`),
                          KEY `id` (`id`),
                          KEY `id_2` (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table beatmaps_names --CREATE TABLE IF NOT EXISTS `beatmaps_names`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `beatmap_md5`  VARCHAR(32) NOT NULL DEFAULT '',
                          `beatmap_name` VARCHAR(256) NOT NULL DEFAULT '',
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table beatmaps_rating --CREATE TABLE IF NOT EXISTS `beatmaps_rating`
             (
                          `id`          INT(11) NOT NULL auto_increment,
                          `user_id`     INT(11) NOT NULL,
                          `beatmap_md5` VARCHAR(32) NOT NULL,
                          `rating`      INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table clans --CREATE TABLE IF NOT EXISTS `clans`
             (
                          `id` INT(11) NOT NULL auto_increment,
                          `name` TEXT NOT NULL,
                          `description` TEXT NOT NULL,
                          `icon` TEXT NOT NULL,
                          `tag`    VARCHAR(6) NOT NULL,
                          `mlimit` INT(11) NOT NULL DEFAULT '16',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table clans_invites --CREATE TABLE IF NOT EXISTS `clans_invites`
             (
                          `id`     INT(11) NOT NULL auto_increment,
                          `clan`   INT(11) NOT NULL,
                          `invite` VARCHAR(8) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table comments --CREATE TABLE IF NOT EXISTS `comments`
             (
                          `id`             INT(11) NOT NULL auto_increment,
                          `user_id`        INT(11) NOT NULL,
                          `beatmap_id`     INT(11) NOT NULL DEFAULT '0',
                          `beatmapset_id`  INT(11) NOT NULL DEFAULT '0',
                          `score_id`       INT(11) NOT NULL DEFAULT '0',
                          `mode`           INT(11) NOT NULL,
                          `comment`        VARCHAR(128) NOT NULL,
                          `time`           INT(11) NOT NULL,
                          `who`            VARCHAR(11) NOT NULL,
                          `special_format` VARCHAR(2556) DEFAULT 'FFFFFF',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table docs --CREATE TABLE IF NOT EXISTS `docs`
             (
                          `id`       INT(11) UNSIGNED NOT NULL auto_increment,
                          `doc_name` VARCHAR(255) NOT NULL DEFAULT 'New Documentation File',
                          `doc_contents` LONGTEXT NOT NULL,
                          `public`   TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
                          `old_name` VARCHAR(200) DEFAULT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=myisam DEFAULT charset=utf8;

-- Dumping structure for table hw_user --CREATE TABLE IF NOT EXISTS `hw_user`
             (
                          `id`          INT(11) NOT NULL auto_increment,
                          `userid`      INT(11) NOT NULL,
                          `mac`         VARCHAR(32) NOT NULL,
                          `unique_id`   VARCHAR(32) NOT NULL,
                          `disk_id`     VARCHAR(32) NOT NULL,
                          `occurencies` INT(11) NOT NULL DEFAULT '0',
                          `activated`   TINYINT(1) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `userid` (`userid`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table identity_tokens --CREATE TABLE IF NOT EXISTS `identity_tokens`
             (
                          `userid` INT(11) NOT NULL,
                          `token`  VARCHAR(64) NOT NULL,
                          UNIQUE KEY `userid` (`userid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table ip_user --CREATE TABLE IF NOT EXISTS `ip_user`
             (
                          `userid` INT(11) NOT NULL,
                          `ip` MEDIUMTEXT NOT NULL,
                          `occurencies` INT(11) NOT NULL,
                          PRIMARY KEY (`userid`),
                          UNIQUE KEY `userid` (`userid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table irc_tokens --CREATE TABLE IF NOT EXISTS `irc_tokens`
             (
                          `userid` INT(11) NOT NULL DEFAULT '0',
                          `token`  VARCHAR(32) NOT NULL DEFAULT '',
                          UNIQUE KEY `userid` (`userid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table leaderboard_ctb --CREATE TABLE IF NOT EXISTS `leaderboard_ctb`
             (
                          `position` INT(10) UNSIGNED NOT NULL,
                          `user`     INT(11) NOT NULL,
                          `v`        BIGINT(20) NOT NULL,
                          PRIMARY KEY (`position`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table leaderboard_mania --CREATE TABLE IF NOT EXISTS `leaderboard_mania`
             (
                          `position` INT(10) UNSIGNED NOT NULL,
                          `user`     INT(11) NOT NULL,
                          `v`        BIGINT(20) NOT NULL,
                          PRIMARY KEY (`position`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table leaderboard_std --CREATE TABLE IF NOT EXISTS `leaderboard_std`
             (
                          `position` INT(10) UNSIGNED NOT NULL,
                          `user`     INT(11) NOT NULL,
                          `v`        BIGINT(20) NOT NULL,
                          PRIMARY KEY (`position`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table leaderboard_taiko --CREATE TABLE IF NOT EXISTS `leaderboard_taiko`
             (
                          `position` INT(10) UNSIGNED NOT NULL,
                          `user`     INT(11) NOT NULL,
                          `v`        BIGINT(20) NOT NULL,
                          PRIMARY KEY (`position`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table main_menu_icons --CREATE TABLE IF NOT EXISTS `main_menu_icons`
             (
                          `id`         INT(11) NOT NULL auto_increment,
                          `is_current` INT(11) NOT NULL,
                          `file_id`    VARCHAR(128) NOT NULL,
                          `name`       VARCHAR(256) NOT NULL,
                          `url` TEXT NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=2 DEFAULT charset=utf8;

-- Dumping data main_menu_icons --INSERT IGNORE
into   `main_menu_icons`
       (
              `id`,
              `is_current`,
              `file_id`,
              `name`,
              `url`
       )
       VALUES
       (
              1,
              1,
              'logo',
              'Ripple!',
              'https://ripple.moe/'
       );

-- Dumping structure for table osin_access --CREATE TABLE IF NOT EXISTS `osin_access`
             (
                          `scope`      INT(11) NOT NULL DEFAULT '0',
                          `created_at` INT(11) NOT NULL DEFAULT '0',
                          `client`     INT(11) NOT NULL DEFAULT '0',
                          `extra`      INT(11) NOT NULL DEFAULT '0'
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table osin_client --CREATE TABLE IF NOT EXISTS `osin_client`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `secret`       VARCHAR(64) NOT NULL DEFAULT '',
                          `extra`        VARCHAR(127) NOT NULL DEFAULT '',
                          `redirect_uri` VARCHAR(127) NOT NULL DEFAULT '',
                          PRIMARY KEY (`id`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table osin_client_user --CREATE TABLE IF NOT EXISTS `osin_client_user`
             (
                          `client_id` INT(11) NOT NULL DEFAULT '0',
                          `user`      INT(11) NOT NULL DEFAULT '0'
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table password_recovery --CREATE TABLE IF NOT EXISTS `password_recovery`
             (
                          `id` INT(11) NOT NULL auto_increment,
                          `k`  VARCHAR(80) NOT NULL,
                          `u`  VARCHAR(30) NOT NULL,
                          `t` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          PRIMARY KEY (`id`)
             )
             engine=myisam auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table privileges_groups --CREATE TABLE IF NOT EXISTS `privileges_groups`
             (
                          `id`         INT(11) NOT NULL auto_increment,
                          `name`       VARCHAR(32) NOT NULL,
                          `privileges` INT(11) NOT NULL,
                          `color`      VARCHAR(32) NOT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `name` (`name`)
             )
             engine=innodb auto_increment=15 DEFAULT charset=utf8;

-- Dumping data privileges_groups --INSERT IGNORE
into   `privileges_groups`
       (
              `id`,
              `name`,
              `privileges`,
              `color`
       )
       VALUES
       (
              1,
              'Banned',
              0,
              ''
       )
       ,
       (
              2,
              'BAT',
              267,
              ''
       )
       ,
       (
              3,
              'Chat Moderators',
              2883911,
              'success'
       )
       ,
       (
              4,
              'Admin',
              1048575,
              'danger'
       )
       ,
       (
              5,
              'Developer',
              1043995,
              'info'
       )
       ,
       (
              6,
              'Donor',
              7,
              'warning'
       )
       ,
       (
              7,
              'God',
              1048575,
              'info'
       )
       ,
       (
              8,
              'Normal User',
              3,
              'primary'
       )
       ,
       (
              9,
              'Pending',
              1048576,
              'default'
       )
       ,
       (
              10,
              'Restricted',
              2,
              ''
       )
       ,
       (
              11,
              'Beatmap Nominator',
              267,
              'primary'
       )
       ,
       (
              12,
              'Full Perms',
              3145727,
              'info'
       )
       ,
       (
              13,
              'Community Manager',
              918015,
              'success'
       )
       ,
       (
              14,
              'New Privilege Group',
              33039,
              'info'
       );

-- Dumping structure for table profile_backgrounds --CREATE TABLE IF NOT EXISTS `profile_backgrounds`
             (
                          `uid`  INT(11) NOT NULL,
                          `time` INT(11) NOT NULL,
                          `type` INT(11) NOT NULL,
                          `value` MEDIUMTEXT NOT NULL,
                          PRIMARY KEY (`uid`)
             )
             engine=innodb DEFAULT charset=utf8;

-- Dumping structure for table rank_requests --CREATE TABLE IF NOT EXISTS `rank_requests`
             (
                          `id`          INT(11) NOT NULL auto_increment,
                          `userid`      INT(11) NOT NULL,
                          `bid`         INT(11) NOT NULL,
                          `type`        VARCHAR(8) NOT NULL,
                          `time`        INT(11) NOT NULL,
                          `blacklisted` TINYINT(1) NOT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `bid` (`bid`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table rap_logs --CREATE TABLE IF NOT EXISTS `rap_logs`
             (
                          `id`     INT(11) NOT NULL auto_increment,
                          `userid` INT(11) NOT NULL,
                          `text` TEXT NOT NULL,
                          `datetime` INT(11) NOT NULL,
                          `through` TEXT NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table remember --CREATE TABLE IF NOT EXISTS `remember`
             (
                          `id`                INT(11) NOT NULL auto_increment,
                          `userid`            INT(11) NOT NULL,
                          `series_identifier` INT(11) DEFAULT NULL,
                          `token_sha`         VARCHAR(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table reports --CREATE TABLE IF NOT EXISTS `reports`
             (
                          `id`       INT(11) NOT NULL auto_increment,
                          `from_uid` INT(11) NOT NULL,
                          `to_uid`   INT(11) NOT NULL,
                          `reason` TEXT NOT NULL,
                          `chatlog` TEXT NOT NULL,
                          `time`     INT(11) NOT NULL,
                          `assigned` INT(11) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table rx_beatmap_playcount --CREATE TABLE IF NOT EXISTS `rx_beatmap_playcount`
             (
                          `id`         INT(11) NOT NULL auto_increment,
                          `user_id`    INT(11) NOT NULL,
                          `beatmap_id` INT(11) DEFAULT NULL,
                          `game_mode`  INT(11) DEFAULT NULL,
                          `playcount`  INT(11) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `playcount_index` (`user_id`,`beatmap_id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table rx_stats --CREATE TABLE IF NOT EXISTS `rx_stats`
             (
                          `id`                 INT(11) NOT NULL auto_increment,
                          `username`           VARCHAR(30) NOT NULL,
                          `username_aka`       VARCHAR(32) NOT NULL DEFAULT '',
                          `user_color`         VARCHAR(16) NOT NULL DEFAULT 'black',
                          `user_style`         VARCHAR(128) NOT NULL DEFAULT '',
                          `favourite_mode`     INT(11) NOT NULL DEFAULT '0',
                          `level_std`          INT(11) NOT NULL DEFAULT '1',
                          `level_taiko`        INT(11) NOT NULL DEFAULT '1',
                          `level_mania`        INT(11) NOT NULL DEFAULT '1',
                          `level_ctb`          INT(11) NOT NULL DEFAULT '1',
                          `total_score_std`    INT(11) NOT NULL DEFAULT '0',
                          `total_score_taiko`  INT(11) NOT NULL DEFAULT '0',
                          `total_score_mania`  INT(11) NOT NULL DEFAULT '0',
                          `total_score_ctb`    INT(11) NOT NULL DEFAULT '0',
                          `total_hits_std`     INT(11) NOT NULL DEFAULT '0',
                          `total_hits_taiko`   INT(11) NOT NULL DEFAULT '0',
                          `total_hits_ctb`     INT(11) NOT NULL DEFAULT '0',
                          `total_hits_mania`   INT(11) NOT NULL DEFAULT '0',
                          `playtime_std`       INT(11) NOT NULL DEFAULT '0',
                          `playtime_taiko`     INT(11) NOT NULL DEFAULT '0',
                          `playtime_mania`     INT(11) NOT NULL DEFAULT '0',
                          `playtime_ctb`       INT(11) NOT NULL DEFAULT '0',
                          `ranked_score_std`   BIGINT(11) NOT NULL DEFAULT '0',
                          `ranked_score_taiko` INT(11) NOT NULL DEFAULT '0',
                          `ranked_score_mania` INT(11) NOT NULL DEFAULT '0',
                          `ranked_score_ctb`   INT(11) NOT NULL DEFAULT '0',
                          `avg_accuracy_std` DOUBLE NOT NULL DEFAULT '0',
                          `avg_accuracy_taiko` DOUBLE NOT NULL DEFAULT '0',
                          `avg_accuracy_mania` DOUBLE NOT NULL DEFAULT '0',
                          `avg_accuracy_ctb` DOUBLE NOT NULL DEFAULT '0',
                          `playcount_std`   INT(11) NOT NULL DEFAULT '0',
                          `playcount_taiko` INT(11) NOT NULL DEFAULT '0',
                          `playcount_mania` INT(11) NOT NULL DEFAULT '0',
                          `playcount_ctb`   INT(11) NOT NULL DEFAULT '0',
                          `pp_std`          INT(11) NOT NULL DEFAULT '0',
                          `pp_mania`        INT(11) NOT NULL DEFAULT '0',
                          `pp_ctb`          INT(11) NOT NULL DEFAULT '0',
                          `pp_taiko`        INT(11) NOT NULL DEFAULT '0',
                          `country`         CHAR(2) NOT NULL DEFAULT 'XX',
                          `unrestricted_pp` INT(11) NOT NULL DEFAULT '0',
                          `ppboard`         INT(11) NOT NULL DEFAULT '1',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=1000 DEFAULT charset=utf8;

-- Dumping data rx_stats --INSERT IGNORE
into   `rx_stats`
       (
              `id`,
              `username`,
              `username_aka`,
              `user_color`,
              `user_style`,
              `favourite_mode`,
              `level_std`,
              `level_taiko`,
              `level_mania`,
              `level_ctb`,
              `total_score_std`,
              `total_score_taiko`,
              `total_score_mania`,
              `total_score_ctb`,
              `total_hits_std`,
              `total_hits_taiko`,
              `total_hits_ctb`,
              `total_hits_mania`,
              `playtime_std`,
              `playtime_taiko`,
              `playtime_mania`,
              `playtime_ctb`,
              `ranked_score_std`,
              `ranked_score_taiko`,
              `ranked_score_mania`,
              `ranked_score_ctb`,
              `avg_accuracy_std`,
              `avg_accuracy_taiko`,
              `avg_accuracy_mania`,
              `avg_accuracy_ctb`,
              `playcount_std`,
              `playcount_taiko`,
              `playcount_mania`,
              `playcount_ctb`,
              `pp_std`,
              `pp_mania`,
              `pp_ctb`,
              `pp_taiko`,
              `country`,
              `unrestricted_pp`,
              `ppboard`
       )
       VALUES
       (
              999,
              'AC',
              '',
              'black',
              '',
              0,
              1,
              1,
              1,
              1,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              'JP',
              1,
              1
       );

-- Dumping structure for table scores --CREATE TABLE IF NOT EXISTS `scores`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `beatmap_md5`  VARCHAR(32) NOT NULL DEFAULT '',
                          `userid`       INT(11) NOT NULL,
                          `score`        BIGINT(20) DEFAULT NULL,
                          `max_combo`    INT(11) NOT NULL DEFAULT '0',
                          `full_combo`   TINYINT(1) NOT NULL DEFAULT '0',
                          `mods`         INT(11) NOT NULL DEFAULT '0',
                          `300_count`    INT(11) NOT NULL DEFAULT '0',
                          `100_count`    INT(11) NOT NULL DEFAULT '0',
                          `50_count`     INT(11) NOT NULL DEFAULT '0',
                          `katus_count`  INT(11) NOT NULL DEFAULT '0',
                          `gekis_count`  INT(11) NOT NULL DEFAULT '0',
                          `misses_count` INT(11) NOT NULL DEFAULT '0',
                          `time`         VARCHAR(18) NOT NULL DEFAULT '',
                          `play_mode`    TINYINT(4) NOT NULL DEFAULT '0',
                          `completed`    TINYINT(11) NOT NULL DEFAULT '0',
                          `accuracy` FLOAT(15,12) DEFAULT NULL,
                          `pp` DOUBLE DEFAULT '0',
                          `playtime` INT(11) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table scores_relax --CREATE TABLE IF NOT EXISTS `scores_relax`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `beatmap_md5`  VARCHAR(32) NOT NULL DEFAULT '',
                          `userid`       INT(11) NOT NULL,
                          `score`        BIGINT(20) DEFAULT NULL,
                          `max_combo`    INT(11) NOT NULL DEFAULT '0',
                          `full_combo`   TINYINT(1) NOT NULL DEFAULT '0',
                          `mods`         INT(11) NOT NULL DEFAULT '0',
                          `300_count`    INT(11) NOT NULL DEFAULT '0',
                          `100_count`    INT(11) NOT NULL DEFAULT '0',
                          `50_count`     INT(11) NOT NULL DEFAULT '0',
                          `katus_count`  INT(11) NOT NULL DEFAULT '0',
                          `gekis_count`  INT(11) NOT NULL DEFAULT '0',
                          `misses_count` INT(11) NOT NULL DEFAULT '0',
                          `time`         VARCHAR(18) NOT NULL DEFAULT '',
                          `play_mode`    TINYINT(4) NOT NULL DEFAULT '0',
                          `completed`    TINYINT(11) NOT NULL DEFAULT '0',
                          `accuracy` FLOAT(15,12) DEFAULT NULL,
                          `pp` DOUBLE DEFAULT '0',
                          `playtime` INT(11) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=1073741824 DEFAULT charset=utf8;

-- Dumping structure for table system_settings --CREATE TABLE IF NOT EXISTS `system_settings`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `name`         VARCHAR(32) NOT NULL,
                          `value_int`    INT(11) NOT NULL DEFAULT '0',
                          `value_string` VARCHAR(512) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=7 DEFAULT charset=utf8;

-- Dumping data system_settings --INSERT IGNORE
into   `system_settings`
       (
              `id`,
              `name`,
              `value_int`,
              `value_string`
       )
       VALUES
       (
              1,
              'website_maintenance',
              0,
              ''
       )
       ,
       (
              2,
              'game_maintenance',
              0,
              ''
       )
       ,
       (
              3,
              'website_global_alert',
              0,
              ''
       )
       ,
       (
              4,
              'website_home_alert',
              0,
              ''
       )
       ,
       (
              5,
              'registrations_enabled',
              1,
              ''
       )
       ,
       (
              6,
              'ccreation_enabled',
              1,
              ''
       );

-- Dumping structure for table tokens --CREATE TABLE IF NOT EXISTS `tokens`
             (
                          `id`           INT(11) NOT NULL auto_increment,
                          `user`         VARCHAR(31) NOT NULL,
                          `privileges`   INT(11) NOT NULL,
                          `description`  VARCHAR(255) NOT NULL,
                          `token`        VARCHAR(127) NOT NULL,
                          `private`      TINYINT(4) NOT NULL,
                          `last_updated` INT(11) NOT NULL DEFAULT '0',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table users --CREATE TABLE IF NOT EXISTS `users`
             (
                          `id`                   INT(15) NOT NULL auto_increment,
                          `osuver`               VARCHAR(256) DEFAULT NULL,
                          `username`             VARCHAR(30) NOT NULL,
                          `username_safe`        VARCHAR(30) NOT NULL,
                          `ban_datetime`         VARCHAR(30) NOT NULL DEFAULT '0',
                          `password_md5`         VARCHAR(127) NOT NULL,
                          `salt`                 VARCHAR(32) NOT NULL,
                          `email`                VARCHAR(254) NOT NULL,
                          `register_datetime`    INT(10) NOT NULL,
                          `rank`                 TINYINT(1) NOT NULL DEFAULT '1',
                          `allowed`              TINYINT(1) NOT NULL DEFAULT '1',
                          `latest_activity`      INT(10) NOT NULL DEFAULT '0',
                          `silence_end`          INT(11) NOT NULL DEFAULT '0',
                          `silence_reason`       VARCHAR(127) NOT NULL DEFAULT '',
                          `password_version`     TINYINT(4) NOT NULL DEFAULT '1',
                          `privileges`           BIGINT(11) NOT NULL,
                          `donor_expire`         INT(11) NOT NULL DEFAULT '0',
                          `flags`                INT(11) NOT NULL DEFAULT '0',
                          `achievements_version` INT(11) NOT NULL DEFAULT '4',
                          `achievements_0`       INT(11) NOT NULL DEFAULT '1',
                          `achievements_1`       INT(11) NOT NULL DEFAULT '1',
                          `notes` MEDIUMTEXT,
                          `last_session` VARCHAR(1024) NOT NULL DEFAULT 'check',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=1000 DEFAULT charset=utf8;

-- Dumping data users --INSERT IGNORE
into   `users`
       (
              `id`,
              `osuver`,
              `username`,
              `username_safe`,
              `ban_datetime`,
              `password_md5`,
              `salt`,
              `email`,
              `register_datetime`,
              `rank`,
              `allowed`,
              `latest_activity`,
              `silence_end`,
              `silence_reason`,
              `password_version`,
              `privileges`,
              `donor_expire`,
              `flags`,
              `achievements_version`,
              `achievements_0`,
              `achievements_1`,
              `notes`,
              `last_session`
       )
       VALUES
       (
              999,
              NULL,
              'AC',
              'ac',
              '0',
              '*0',
              '5e/AceVLS7jJtxTJA1U6rmVqrWREYg==',
              'fo@kab.ot',
              1566228790,
              4,
              1,
              1569775752,
              0,
              '',
              1,
              3145727,
              2147483647,
              0,
              0,
              1,
              1,
              '',
              'check'
       );

-- Dumping structure for table users_achievements --CREATE TABLE IF NOT EXISTS `users_achievements`
             (
                          `id`             INT(11) NOT NULL auto_increment,
                          `user_id`        INT(11) NOT NULL,
                          `achievement_id` INT(11) NOT NULL,
                          `time`           INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table users_beatmap_playcount --CREATE TABLE IF NOT EXISTS `users_beatmap_playcount`
             (
                          `id`         INT(11) NOT NULL auto_increment,
                          `user_id`    INT(11) NOT NULL,
                          `beatmap_id` INT(11) DEFAULT NULL,
                          `game_mode`  INT(11) DEFAULT NULL,
                          `playcount`  INT(11) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `playcount_index` (`user_id`,`beatmap_id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table users_relationships --CREATE TABLE IF NOT EXISTS `users_relationships`
             (
                          `id`    INT(11) NOT NULL auto_increment,
                          `user1` INT(11) NOT NULL,
                          `user2` INT(11) NOT NULL,
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=0 DEFAULT charset=utf8;

-- Dumping structure for table users_stats --CREATE TABLE IF NOT EXISTS `users_stats`
             (
                          `id`                    INT(11) NOT NULL auto_increment,
                          `username`              VARCHAR(30) NOT NULL,
                          `username_aka`          VARCHAR(32) NOT NULL DEFAULT '',
                          `user_color`            VARCHAR(16) NOT NULL DEFAULT 'black',
                          `user_style`            VARCHAR(128) NOT NULL DEFAULT '',
                          `ranked_score_std`      BIGINT(20) DEFAULT '0',
                          `playcount_std`         INT(11) NOT NULL DEFAULT '0',
                          `total_score_std`       BIGINT(20) DEFAULT '0',
                          `replays_watched_std`   INT(11) UNSIGNED NOT NULL DEFAULT '0',
                          `ranked_score_taiko`    BIGINT(20) DEFAULT '0',
                          `playcount_taiko`       INT(11) NOT NULL DEFAULT '0',
                          `total_score_taiko`     BIGINT(20) DEFAULT '0',
                          `replays_watched_taiko` INT(11) NOT NULL DEFAULT '0',
                          `ranked_score_ctb`      BIGINT(20) DEFAULT '0',
                          `playcount_ctb`         INT(11) NOT NULL DEFAULT '0',
                          `total_score_ctb`       BIGINT(20) DEFAULT '0',
                          `replays_watched_ctb`   INT(11) NOT NULL DEFAULT '0',
                          `ranked_score_mania`    BIGINT(20) DEFAULT '0',
                          `playcount_mania`       INT(11) NOT NULL DEFAULT '0',
                          `total_score_mania`     BIGINT(20) DEFAULT '0',
                          `replays_watched_mania` INT(10) UNSIGNED NOT NULL DEFAULT '0',
                          `total_hits_std`        INT(11) NOT NULL DEFAULT '0',
                          `total_hits_taiko`      INT(11) NOT NULL DEFAULT '0',
                          `total_hits_ctb`        INT(11) NOT NULL DEFAULT '0',
                          `total_hits_mania`      INT(11) NOT NULL DEFAULT '0',
                          `country`               CHAR(2) NOT NULL DEFAULT 'XX',
                          `unrestricted_pp`       INT(11) NOT NULL DEFAULT '0',
                          `ppboard`               INT(11) NOT NULL DEFAULT '0',
                          `show_country`          TINYINT(4) NOT NULL DEFAULT '1',
                          `level_std`             INT(11) NOT NULL DEFAULT '1',
                          `level_taiko`           INT(11) NOT NULL DEFAULT '1',
                          `level_ctb`             INT(11) NOT NULL DEFAULT '1',
                          `level_mania`           INT(11) NOT NULL DEFAULT '1',
                          `playtime_std`          INT(11) NOT NULL DEFAULT '0',
                          `playtime_taiko`        INT(11) NOT NULL DEFAULT '0',
                          `playtime_ctb`          INT(11) NOT NULL DEFAULT '0',
                          `playtime_mania`        INT(11) NOT NULL DEFAULT '0',
                          `avg_accuracy_std` FLOAT(15,12) NOT NULL DEFAULT '0.000000000000',
                          `avg_accuracy_taiko` FLOAT(15,12) NOT NULL DEFAULT '0.000000000000',
                          `avg_accuracy_ctb` FLOAT(15,12) NOT NULL DEFAULT '0.000000000000',
                          `avg_accuracy_mania` FLOAT(15,12) NOT NULL DEFAULT '0.000000000000',
                          `pp_std`       INT(11) NOT NULL DEFAULT '0',
                          `pp_taiko`     INT(11) NOT NULL DEFAULT '0',
                          `pp_ctb`       INT(11) NOT NULL DEFAULT '0',
                          `pp_mania`     INT(11) NOT NULL DEFAULT '0',
                          `badges_shown` VARCHAR(24) NOT NULL DEFAULT '1,0,0,0,0,0',
                          `safe_title`   TINYINT(4) NOT NULL DEFAULT '0',
                          `userpage_content` LONGTEXT,
                          `play_style`        SMALLINT(6) NOT NULL DEFAULT '0',
                          `favourite_mode`    TINYINT(4) NOT NULL DEFAULT '0',
                          `prefer_relax`      INT(11) NOT NULL DEFAULT '0',
                          `custom_badge_icon` VARCHAR(32) NOT NULL DEFAULT '',
                          `custom_badge_name` VARCHAR(256) NOT NULL DEFAULT '',
                          `can_custom_badge`  TINYINT(1) NOT NULL DEFAULT '0',
                          `show_custom_badge` TINYINT(1) NOT NULL DEFAULT '0',
                          `current_status`    VARCHAR(20000) NOT NULL DEFAULT 'Offline',
                          PRIMARY KEY (`id`)
             )
             engine=innodb auto_increment=1000 DEFAULT charset=utf8;

-- Dumping data users_stats --INSERT INTO `users_stats`
            (
                        `id`,
                        `username`,
                        `username_aka`,
                        `user_color`,
                        `user_style`,
                        `ranked_score_std`,
                        `playcount_std`,
                        `total_score_std`,
                        `replays_watched_std`,
                        `ranked_score_taiko`,
                        `playcount_taiko`,
                        `total_score_taiko`,
                        `replays_watched_taiko`,
                        `ranked_score_ctb`,
                        `playcount_ctb`,
                        `total_score_ctb`,
                        `replays_watched_ctb`,
                        `ranked_score_mania`,
                        `playcount_mania`,
                        `total_score_mania`,
                        `replays_watched_mania`,
                        `total_hits_std`,
                        `total_hits_taiko`,
                        `total_hits_ctb`,
                        `total_hits_mania`,
                        `country`,
                        `show_country`,
                        `level_std`,
                        `level_taiko`,
                        `level_ctb`,
                        `level_mania`,
                        `avg_accuracy_std`,
                        `avg_accuracy_taiko`,
                        `avg_accuracy_ctb`,
                        `avg_accuracy_mania`,
                        `pp_std`,
                        `pp_taiko`,
                        `pp_ctb`,
                        `pp_mania`,
                        `badges_shown`,
                        `safe_title`,
                        `userpage_content`,
                        `play_style`,
                        `favourite_mode`,
                        `custom_badge_icon`,
                        `custom_badge_name`,
                        `can_custom_badge`,
                        `show_custom_badge`
            )
            VALUES
            (
                        999,
                        'AC',
                        '',
                        'black',
                        '',
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        'US',
                        1,
                        0,
                        0,
                        0,
                        0,
                        0.000000000000,
                        0.000000000000,
                        0.000000000000,
                        0.000000000000,
                        0,
                        0,
                        0,
                        0,
                        '3,4,11,0,0,0',
                        0,
                        '',
                        0,
                        0,
                        '',
                        '',
                        0,
                        0
            );
