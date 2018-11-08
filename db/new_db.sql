BEGIN TRANSACTION;
DROP TABLE IF EXISTS "posts";
CREATE TABLE IF NOT EXISTS "posts" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"title"	varchar,
	"body"	text,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"user_id"	INTEGER,
	FOREIGN KEY("user_id") REFERENCES "users"("id")
);
DROP TABLE IF EXISTS "subscribes";
CREATE TABLE IF NOT EXISTS "subscribes" (
	"user_id"	INTEGER NOT NULL,
	"channel_id"	INTEGER NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "users"("id"),
	FOREIGN KEY("channel_id") REFERENCES "channels"("id")
);
DROP TABLE IF EXISTS "channels";
CREATE TABLE IF NOT EXISTS "channels" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR NOT NULL,
	"url"	VARCHAR NOT NULL,
	"created_at"	DATETIME NOT NULL,
	"updated_at"	DATETIME NOT NULL,
	"category_id"	INTEGER NOT NULL,
	"type_id"	INTEGER NOT NULL,
	FOREIGN KEY("category_id") REFERENCES "categories"("id"),
	FOREIGN KEY("type_id") REFERENCES "types"("id")
);
DROP TABLE IF EXISTS "types";
CREATE TABLE IF NOT EXISTS "types" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR NOT NULL,
	"created_at"	DATETIME NOT NULL,
	"updated_at"	DATETIME NOT NULL
);
DROP TABLE IF EXISTS "categories";
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	VARCHAR NOT NULL,
	"created_at"	DATETIME NOT NULL,
	"updated_at"	DATETIME NOT NULL
);
DROP TABLE IF EXISTS "users";
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar,
	"email"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"password_digest"	varchar,
	"remember_token"	varchar
);
INSERT INTO "posts" VALUES (1,'Sensation!!!','night fighting in Moskow kafe','2018-10-10 16:10:09.914068','2018-10-10 16:10:09.914068',1);
INSERT INTO "posts" VALUES (2,'afasf','asfasf','2018-10-10 16:16:09.823068','2018-10-10 16:16:09.823068',1);
INSERT INTO "posts" VALUES (3,'sfssdfsafsdf','asfdasgsagsdg24523','2018-10-10 16:25:24.238780','2018-10-10 16:25:24.238780',1);
INSERT INTO "subscribes" VALUES (1,1);
INSERT INTO "channels" VALUES (1,'FAPL','http://premiership.ru/rss.xml','2018-10-11 13:53:49.209024','2018-10-11 13:53:49.209024',1,1);
INSERT INTO "types" VALUES (1,'RSS','2018-10-11 13:53:49.209024','2018-10-11 13:53:49.209024');
INSERT INTO "types" VALUES (2,'SOCIAL','2018-10-11 13:53:49.209024','2018-10-11 13:53:49.209024');
INSERT INTO "categories" VALUES (0,'','','');
INSERT INTO "categories" VALUES (1,'Sport','2018-10-11 13:53:49.209024','2018-10-11 13:53:49.209024');
INSERT INTO "users" VALUES (1,'Grigorii','marakogr@mail.ru','2018-10-11 13:53:49.209024','2018-11-08 11:42:00.047778','$2a$10$Stul0mAzRYJXLAENMVfwZeLndr45FPNOUP3T3uhIBCcaRtMNRut.a','aceac5874dbef6de9c2873c17af9ea563417a424');
INSERT INTO "users" VALUES (3,'test','test@mail.eu','2018-10-15 07:45:40.855715','2018-10-15 07:45:40.855715','$2a$10$KqS6SXwchdR5jQdVxU7KBev58MdZSXo2mmoCG7LWUQ.F73bRhYvBK',NULL);
INSERT INTO "users" VALUES (4,'Arina','arina@mail.ru','2018-11-03 15:51:12.416922','2018-11-03 15:52:50.091922','$2a$10$OUwgsgORJJabTDIQzouMAeqG3i/QJCDWzt/PNHLxwusc/E8pVx9oa','74ed3ceeb0a94643d772489acd0783542a32c6e4');
INSERT INTO "users" VALUES (5,'qwerty','lol@mail.ru','2018-11-07 16:42:55.009458','2018-11-07 16:43:30.993056','$2a$10$Ft8OxmYfzQYziNDzVHbJWeC5ZQvDA2xCEOiBVrkDgAwWk/35ugPTO','d67ec22bd0e70948d43ee2b44ab0d9563a562175');
INSERT INTO "users" VALUES (6,'Example User','example@railstutorial.org','2018-11-08 11:28:50.693778','2018-11-08 11:28:50.693778','$2a$10$ZZS1CQ8aooCMu1RpDviS4uVCL8ZKVWfC6SzRPPUC5UsD6ckYwBLNC','fb4085e1644f5f169015bfda7c466e4106b24e5e');
INSERT INTO "users" VALUES (7,'Mrs. Damien Buckridge','example-1@railstutorial.org','2018-11-08 11:28:51.253778','2018-11-08 11:28:51.253778','$2a$10$ge7qGdLveP.UuduP5aEL.ef6VeHwlesu2g2qADMQMB4tRHhDtpzk6','2639be7d33ca823abd32a35de1acfe6e901b6a79');
INSERT INTO "users" VALUES (8,'Ms. Linsey Lakin','example-2@railstutorial.org','2018-11-08 11:28:51.333778','2018-11-08 11:28:51.333778','$2a$10$EneBpUHzDNq.r30Ywa605uhcOxgXTGaU7hXFnqsfzQ/7zh4j3i4nO','4efe169312b44f50adca28de02f559817d1f7720');
INSERT INTO "users" VALUES (9,'Miquel Bogisich','example-3@railstutorial.org','2018-11-08 11:28:51.408778','2018-11-08 11:28:51.408778','$2a$10$doOeNlM4kZRFkU3bqFPzBOErU.j0iT4Y7EQ9yGj8JvOorGkLxSQ9.','250eaef65f2e0a46600ea04da487c5b581d56060');
INSERT INTO "users" VALUES (10,'Leandro Roberts','example-4@railstutorial.org','2018-11-08 11:28:51.488778','2018-11-08 11:28:51.488778','$2a$10$WVjtsP.ZZ4cbsgBJl8ISseKciTkGdBFa3rnEjQ/1Chb/cvILoKsDe','e84d26ae4133039cc3a05a3a8af43a6603d792f5');
INSERT INTO "users" VALUES (11,'Kevin Runolfsson','example-5@railstutorial.org','2018-11-08 11:28:51.567778','2018-11-08 11:28:51.567778','$2a$10$SIPk/s1piM8OBxB.tYM9xeF1YIgD9ITsYDGnaT1ZOWphx3nFV6CAe','6e423deacf4da53a1665365d903940d82a2a7fbe');
INSERT INTO "users" VALUES (12,'Hunter Heathcote','example-6@railstutorial.org','2018-11-08 11:28:51.642778','2018-11-08 11:28:51.642778','$2a$10$O3tptcT7MZcmZv2vC3UpieT5po0vBOHHq2RVHYJUl17bQ1GZMI5CC','6d0f7f252b3e7d88ce647818787bc71c9d247dd2');
INSERT INTO "users" VALUES (13,'Kevin Cummerata','example-7@railstutorial.org','2018-11-08 11:28:51.722778','2018-11-08 11:28:51.722778','$2a$10$PWtrYLdLOh9Vt0f8h.cQg.Xvl0TUJFTWBMT/VSsSGCUJc5SO1e6Gu','dd6d94a3c85cc7a5ec1249e3f211802bbb88b6bc');
INSERT INTO "users" VALUES (14,'Sasha Hickle','example-8@railstutorial.org','2018-11-08 11:28:51.799778','2018-11-08 11:28:51.799778','$2a$10$HG9YjA1uav5Jg4CWcGlXyOnMBI7vzbeGXVonZPXzccdxs5.6/4NcS','9c0a2457f6b850025f4c4dec17fa49ab788201f1');
INSERT INTO "users" VALUES (15,'Glendora Marks','example-9@railstutorial.org','2018-11-08 11:28:51.876778','2018-11-08 11:28:51.876778','$2a$10$RhM8FLgrMlOQZGUGf8nwfOuCXX1o4l5BXRxpbzk9G/mS97OFGXqzG','634df2a5a85421d40eb3d6725576671fcffdc536');
INSERT INTO "users" VALUES (16,'Raphael Kulas V','example-10@railstutorial.org','2018-11-08 11:28:51.957778','2018-11-08 11:28:51.957778','$2a$10$z3B8KYPKyOAa.ybgDxs44umhQ2jZtxrFckJ5cqYzVpR8GiHxv1udC','6baa7b180edd4dcb9c4be2e0032b1a17773ef940');
INSERT INTO "users" VALUES (17,'Darleen Okuneva','example-11@railstutorial.org','2018-11-08 11:28:52.033778','2018-11-08 11:28:52.033778','$2a$10$/UdNt/X.TT1ufFrJzUhHWOZgQhf.emhPM3ewTUVE03WGMTPg2ULJe','6f47792ad569c235636a088b62af91927f838af6');
INSERT INTO "users" VALUES (18,'Ralph Lebsack','example-12@railstutorial.org','2018-11-08 11:28:52.112778','2018-11-08 11:28:52.112778','$2a$10$gb1ww2SHtJuK7JGf2D6vIeo9sZr5KLowvgfUVk0KzMT6v2RM50lea','08030eef88d2eafe7864ecd3e40afd99908b9b31');
INSERT INTO "users" VALUES (19,'Christian Harris','example-13@railstutorial.org','2018-11-08 11:28:52.191778','2018-11-08 11:28:52.191778','$2a$10$Q/k4Js8eDEBc07QWLpm0luMcLHGIY4uFQjrXwzi8kMog5fVLNdQQu','51e1aa9548e5f58926ed20e5e82c3f7905c7de19');
INSERT INTO "users" VALUES (20,'Alyssa Koch','example-14@railstutorial.org','2018-11-08 11:28:52.266778','2018-11-08 11:28:52.266778','$2a$10$ONja5x6DhTvXUJAjvJWiYu2/ESaJM6PeJi0uBeTlHfmP.n7ncTDLS','33b4dbb66a88c7d75ec010a1ca8ec6506884f276');
INSERT INTO "users" VALUES (21,'Sau Will','example-15@railstutorial.org','2018-11-08 11:28:52.345778','2018-11-08 11:28:52.345778','$2a$10$l8TkusaQClkzy/DzAYE5N.LmVaGdL2D9FVBSpS4W4EuwCVBoECxrG','79a434172c2f47868b87da441f35c4593eb62a63');
INSERT INTO "users" VALUES (22,'Stan Kub V','example-16@railstutorial.org','2018-11-08 11:28:52.423778','2018-11-08 11:28:52.423778','$2a$10$ak9SVeDp/FBPwIRa48JL8eWLO7CTmxVrnv9VJSZhJ/x9z7NFcnt6i','91dbfbd626f9c7b08b153d37688621ee0a8b8d5c');
INSERT INTO "users" VALUES (23,'Gonzalo Rice','example-17@railstutorial.org','2018-11-08 11:28:52.499778','2018-11-08 11:28:52.499778','$2a$10$8uFSu.iKYcDMwjrFjbRQu..ibb081f36ygF4Ua6t7hU.Fws1kJyfW','cbcad171e56f1ebcba7a77aef55f4bf288957484');
INSERT INTO "users" VALUES (24,'Avis Jast','example-18@railstutorial.org','2018-11-08 11:28:52.573778','2018-11-08 11:28:52.573778','$2a$10$qoa4BTCn6yZs1bZ0Ha4kSO5Wcfcg45cu8AcKLwFZESSGCfKnyXwDS','948fcf3309a3bb69998167e7d87de6d3e2aa197d');
INSERT INTO "users" VALUES (25,'Maira Parisian','example-19@railstutorial.org','2018-11-08 11:28:52.650778','2018-11-08 11:28:52.650778','$2a$10$tsj3BjK6hkALWWbhyZyFl.ovYgr7y/UWZ1d5Fa6gbWwpPtC5.LDzW','40e4af01e521778784166a799a707aaf919cc98e');
INSERT INTO "users" VALUES (26,'Hildred Schulist','example-20@railstutorial.org','2018-11-08 11:28:52.727778','2018-11-08 11:28:52.727778','$2a$10$31WeTQd42wO2RvQecAU3MOtlDDUNactPfXvhrVn88F8SJpvqg801a','1d57af42c2b08c1ba34355cd44b260cf8d0f18ba');
INSERT INTO "users" VALUES (27,'Parker Hegmann','example-21@railstutorial.org','2018-11-08 11:28:52.815778','2018-11-08 11:28:52.815778','$2a$10$oUzTWjoU6fKTb3rDvHGpeuxok2yaRaNGi8vwbIupR1zBWedksgLHO','bcdbc743481a72a2e7b0e2e640975265eb267bf2');
INSERT INTO "users" VALUES (28,'Matt Hand','example-22@railstutorial.org','2018-11-08 11:28:52.896778','2018-11-08 11:28:52.896778','$2a$10$nSagRfkxD6vHSLBFcHqqb.cV0Bd7uDqhOGC.dkZxyU9y6MOB96IXy','0cf888bca176e1516cd2aa95574e4a2c0c558dd1');
INSERT INTO "users" VALUES (29,'Winford Hane','example-23@railstutorial.org','2018-11-08 11:28:52.972778','2018-11-08 11:28:52.972778','$2a$10$./BfLpDzhv28.H9AJSbow.EO0bPJh6rnsjacJq4dSa7LBs7SZ9sIC','3dcde8350f4fb43436fe3e74181862e11a2d1c0d');
INSERT INTO "users" VALUES (30,'Dr. Rey Cartwright','example-24@railstutorial.org','2018-11-08 11:28:53.053778','2018-11-08 11:28:53.053778','$2a$10$lg0dfeUMleXV/2GJTvfp2eVsH1xvQM6YCwYEFSjU/dmSRISLfXQVO','c78da8e9c34b3cdc51662b3cb191342fbf5eaa9e');
INSERT INTO "users" VALUES (31,'Mellie Lesch','example-25@railstutorial.org','2018-11-08 11:28:53.130778','2018-11-08 11:28:53.130778','$2a$10$S7j3hjl/ZD1l.UKoizAcLeXBue9emdfkRyJS9GuhzKQR/aetbbCnq','62000cd697f2e9d50f649fb43a5674ac9a727bc4');
INSERT INTO "users" VALUES (32,'Paris Pacocha','example-26@railstutorial.org','2018-11-08 11:28:53.207778','2018-11-08 11:28:53.207778','$2a$10$LoGJ2B93oesktJD2FkgQLOd1SuWJwoGxB.SNKdRn3GfslLhn62Cme','7584af63ab725fa10282f1e2ea0d2ccf22644046');
INSERT INTO "users" VALUES (33,'Delpha Romaguera','example-27@railstutorial.org','2018-11-08 11:28:53.288778','2018-11-08 11:28:53.288778','$2a$10$/1ZzRt.AXwu1sA3hANtw0OoseUlJ5yCa3TuXptOXRgh5dYObcDGy6','d50882e0df29600c8dee8105cd7315a1443079d6');
INSERT INTO "users" VALUES (34,'Jamee Jacobson','example-28@railstutorial.org','2018-11-08 11:28:53.363778','2018-11-08 11:28:53.363778','$2a$10$yGedCUw0mmeM3bKwYPXFfObXCGXYmu65HoHYOugHPyC.QSk9Jp0BO','77ce3da406ea2ce15aa8a542bc0730a319da06fd');
INSERT INTO "users" VALUES (35,'Carrol Lang','example-29@railstutorial.org','2018-11-08 11:28:53.442778','2018-11-08 11:28:53.442778','$2a$10$SzD.K.Cqycd2nRitzckD2uUEXVK8DzIESIZcfuqyA2DoNgie00HK6','f0edae668093a6137e04121de423dd24884fe83d');
INSERT INTO "users" VALUES (36,'Dr. Rivka Osinski','example-30@railstutorial.org','2018-11-08 11:28:53.521778','2018-11-08 11:28:53.521778','$2a$10$breANzIlJKN.bp6dHBCaQOYlzip5qraRqWnLjyCliMSB8XrMUfD3G','152d81881d3ebd9114727977e1d2967b31e6991d');
INSERT INTO "users" VALUES (37,'Regine Mitchell Jr.','example-31@railstutorial.org','2018-11-08 11:28:53.595778','2018-11-08 11:28:53.595778','$2a$10$3eo0T1YbKSQzjT.TPv/mW.yCVTvV/cGcx8pSfk68amU/N.gwfoBlq','ae40bbc04b494829628ed4669b82997530b301af');
INSERT INTO "users" VALUES (38,'Lauren Lindgren','example-32@railstutorial.org','2018-11-08 11:28:53.677778','2018-11-08 11:28:53.677778','$2a$10$p1d3srhXdzvQKb16zvz8mODUM1vTNfOkl4xTMSAbcHD3XOXWKYXoS','df1f1a5bd91a5dc0b929c58bb985290dc4408a45');
INSERT INTO "users" VALUES (39,'Janina Schmitt','example-33@railstutorial.org','2018-11-08 11:28:53.753778','2018-11-08 11:28:53.753778','$2a$10$rIvWOrPfXjT8oLP9zhXZ0OZGQE1I/kaRA0y5UfwaQ7hwx6k7IYTzW','1901f039e8a65d8607a9fc9a1b7560774d94c6da');
INSERT INTO "users" VALUES (40,'Creola McKenzie V','example-34@railstutorial.org','2018-11-08 11:28:53.830778','2018-11-08 11:28:53.830778','$2a$10$QYgWbc347feBb7tihsSrT.lkQUFoqZxH2A3XR/Gis/dW/L91sZtkC','4c1adbe0986830ae8ffba74785bed716b7f9d682');
INSERT INTO "users" VALUES (41,'Dr. Evelia Lebsack','example-35@railstutorial.org','2018-11-08 11:28:53.912778','2018-11-08 11:28:53.912778','$2a$10$7xGo2hP56k0V1tMrWh1TLOaODGUlV9Qzzy/azLohCO2pitrEv4xaa','6f9793cf7d6412554b2be6fbf0f75ff4abe58eb7');
INSERT INTO "users" VALUES (42,'Perry Block','example-36@railstutorial.org','2018-11-08 11:28:53.987778','2018-11-08 11:28:53.987778','$2a$10$nO9rN2dPbvJDswch98G0vu.nZnchqU1PndO6M03Kg/n7mcyDdUBz2','9afdd3da3854b4c225a22a953c67ebb6f5602761');
INSERT INTO "users" VALUES (43,'Kristie Collier DDS','example-37@railstutorial.org','2018-11-08 11:28:54.067778','2018-11-08 11:28:54.067778','$2a$10$WzfmdEAy78tssPpE1A.0SO.DQBHeYOvl.u1YGVWFdrgNqjz7pEe8y','9dc34fc7f3086f215e94a550a1f009be4c6b6127');
INSERT INTO "users" VALUES (44,'Ms. Sam Weissnat','example-38@railstutorial.org','2018-11-08 11:28:54.146778','2018-11-08 11:28:54.146778','$2a$10$LZxwhrFLXQHyCwrenUuZXOII1e7QqzuZhpEa44Qi4sdanApYnie6W','587241148006cd36a5f8f6f9e45baa0a783461de');
INSERT INTO "users" VALUES (45,'Boyce Bahringer','example-39@railstutorial.org','2018-11-08 11:28:54.221778','2018-11-08 11:28:54.221778','$2a$10$wuVOmqWI.G2pqksVKf6nT.VkqGtVefbWFekGAu6BiDgZ2r.CrrPAy','9aa43059b11c29610e57bbda3d41a0bfda957c90');
INSERT INTO "users" VALUES (46,'Mrs. Haydee Lemke','example-40@railstutorial.org','2018-11-08 11:28:54.302778','2018-11-08 11:28:54.302778','$2a$10$dCs9yrIYu7TKRj4wC5q3h.oTCyiM98DGQE7pumycNY9qFk2Njxn8a','f5b1c83cf955d8560d9cb00d5b0afe734713e8a4');
INSERT INTO "users" VALUES (47,'Isaiah Bartell','example-41@railstutorial.org','2018-11-08 11:28:54.393778','2018-11-08 11:28:54.393778','$2a$10$jf5rdiKgcb0QWWqjMuhKruOkFh5Nl.ZT6kZLeVQGMuGZc1wbGyhDG','c8ab90ff5c2966a77d88a855263a7d86f46ab20b');
INSERT INTO "users" VALUES (48,'Ms. Katherina Feeney','example-42@railstutorial.org','2018-11-08 11:28:54.469778','2018-11-08 11:28:54.469778','$2a$10$/jeK2wkxJWfdw7GxXcHIRe8wTWnWW0LeESyBd.rVU29A7EOnrOR/q','ed421d13546f2db54402d800352e6fd51b31d2de');
INSERT INTO "users" VALUES (49,'Miss Arvilla Bernier','example-43@railstutorial.org','2018-11-08 11:28:54.549778','2018-11-08 11:28:54.549778','$2a$10$pEKd2lFwz3deoJY9WtI19OCuJyZ8WMDIdZstiQgeCGt.t56TLkdVG','61b240529dee2a3a057e962f1b9f2f8febd63674');
INSERT INTO "users" VALUES (50,'Fred Leffler','example-44@railstutorial.org','2018-11-08 11:28:54.624778','2018-11-08 11:28:54.624778','$2a$10$iBfWEbVLEdQTfergzCLiJukChW5r3rWpZ/bsS.Kr0.1pgxc9IU7tW','df9db68395974491d6d231be2b4bc7757ed34316');
INSERT INTO "users" VALUES (51,'Dr. Clifton Goldner','example-45@railstutorial.org','2018-11-08 11:28:54.706778','2018-11-08 11:28:54.706778','$2a$10$cX9DLaqBFRlbf71StCqqM.tBf9m22IVeUYJJJ2VcjXXjk7wOgxGsm','3fd713430b883d8a1fff65e4bad7b8eeeb4c2b6c');
INSERT INTO "users" VALUES (52,'Wendell Kub','example-46@railstutorial.org','2018-11-08 11:28:54.784778','2018-11-08 11:28:54.784778','$2a$10$tHfK6ZvmWAbgd7hG6A5nlu96ekWS1sHDJpskbbaSCm2Pqc1HRIxF6','bc3102f25cdccdb83ad601638e8054618fe5c379');
INSERT INTO "users" VALUES (53,'Kandace Walter','example-47@railstutorial.org','2018-11-08 11:28:54.861778','2018-11-08 11:28:54.861778','$2a$10$ngNilC51Q6ZI99/Xb/dG2ex.0df2qr0zlstyFVt/eoCoHOJoShzRG','04c95dd0aa7e3fe40657255dca398f980d7ac8f0');
INSERT INTO "users" VALUES (54,'Daisey Steuber','example-48@railstutorial.org','2018-11-08 11:28:54.942778','2018-11-08 11:28:54.942778','$2a$10$BsL/fxK5qNyl.D3VTd.cW.3sHQWuhB.fvLKBIc1wEv0SgnUlLlXQO','8d0e1114ab271314b1a0b2416bb08dd5fc66dcf2');
INSERT INTO "users" VALUES (55,'Francie Deckow','example-49@railstutorial.org','2018-11-08 11:28:55.016778','2018-11-08 11:28:55.016778','$2a$10$GV7dhdpLw.4z5xiwvxkwFOa4gcYNhMsyN.8Cc/DkLI5pJGKwB1iTi','db989f007e5a0b03d4fe15d2f4d3030ab4c1698f');
INSERT INTO "users" VALUES (56,'Alpha Wintheiser','example-50@railstutorial.org','2018-11-08 11:28:55.096778','2018-11-08 11:28:55.096778','$2a$10$RvtW60cWzzii/uVE.jhWsOrboSaPjjBBMwlt6oXJ/NqpxhgUKM/li','2beaa70af1e7b7c2e92e818fcc170d52b64a2cdd');
INSERT INTO "users" VALUES (57,'Lynna Hoppe Jr.','example-51@railstutorial.org','2018-11-08 11:28:55.175778','2018-11-08 11:28:55.175778','$2a$10$JsDr.qFmi0QoDvOxRjQdhuzhf8NlHW45ZqB3QV.RM3tzqCvS9H/HS','d553ae9b79800b4aa7756c966a6e5131ac9f254d');
INSERT INTO "users" VALUES (58,'Roland Powlowski','example-52@railstutorial.org','2018-11-08 11:28:55.251778','2018-11-08 11:28:55.251778','$2a$10$OpfSB/DEv54VpCNJ9lSmWeaaKq1w/5AEWo7JDnB8Wv8dssFWkNUyu','4dc75eaa1f7e19595ed7c8f7c8ffb2bf9e3d8ab0');
INSERT INTO "users" VALUES (59,'Raymundo McClure','example-53@railstutorial.org','2018-11-08 11:28:55.331778','2018-11-08 11:28:55.331778','$2a$10$XqNM5CNY.ZWne20gZJhYoOEmRpkCk0ufUwRazTxIzX0nTeJcpIWXm','ceea29455d8a44ae400d6197b1f5b90536f67995');
INSERT INTO "users" VALUES (60,'Corliss Cummings','example-54@railstutorial.org','2018-11-08 11:28:55.409778','2018-11-08 11:28:55.409778','$2a$10$90zYB.SGBNFco96R1DqT1uttS9JN84g7tAo/ik4z3LJePjHMQ7QjS','8b2399e81838655216394cd399da426338140cc1');
INSERT INTO "users" VALUES (61,'Eldora Little DDS','example-55@railstutorial.org','2018-11-08 11:28:55.486778','2018-11-08 11:28:55.486778','$2a$10$JzbVBzs73p8oUpEuIUAmx.qM/l0MmDMUvwgurQ7PVKJaO28feo0A2','26293acc0bd711589e4066bf06d7dbea538c8bd0');
INSERT INTO "users" VALUES (62,'Sirena West Jr.','example-56@railstutorial.org','2018-11-08 11:28:55.568778','2018-11-08 11:28:55.568778','$2a$10$HU81/wH/lwNtGGkdUOlfbOy5BjRMew.YITkQCFxceJCZulAsndb7K','acec2d8fbb96d70ea77a91148e0fde03f15cd8c7');
INSERT INTO "users" VALUES (63,'Luther Cremin','example-57@railstutorial.org','2018-11-08 11:28:55.642778','2018-11-08 11:28:55.642778','$2a$10$jGEG1S4ym2/8s.JC9gO.Muz76SJqTLkBbI5iVtF8YBtio1YLqLgki','cabfdb24a32b09b857e50fb8482edb76c9ee1700');
INSERT INTO "users" VALUES (64,'Mrs. Isabelle Jacobs','example-58@railstutorial.org','2018-11-08 11:28:55.726778','2018-11-08 11:28:55.726778','$2a$10$TkHwIAYiuljdO9FvZ3jNcujvyvK7s5YuOVbr5xtlr7kKjpilUIv5S','6531e377d27e385fe9f016f1998347f9f7564cef');
INSERT INTO "users" VALUES (65,'Vince Jacobson PhD','example-59@railstutorial.org','2018-11-08 11:28:55.814778','2018-11-08 11:28:55.814778','$2a$10$4Y3hDzqNuRHqqDQYH/isBOe9zNqQ6skJjhBYZjuljRawgP0o0UlS2','ed249965f1c0c744feb9b5cf482bbb4455c167cc');
INSERT INTO "users" VALUES (66,'Dr. Lottie O''Kon','example-60@railstutorial.org','2018-11-08 11:28:55.890778','2018-11-08 11:28:55.890778','$2a$10$y/h9/px15sxpMGkJzDvo4eX8lcub..tKQyIpbFwlaonxKGXZr0dM6','b54f33d2087fe97c156a253e5917fa1e0bd2cdc9');
INSERT INTO "users" VALUES (67,'Adina O''Kon','example-61@railstutorial.org','2018-11-08 11:28:55.971778','2018-11-08 11:28:55.971778','$2a$10$HCCsm3Txg/ttnNnLDM/DK.jUTYsS53V25rkJ2.FkrKxFXq8EClhA6','79b8f7f44bd923e6bebba8883e9f22eb6c9e7d6b');
INSERT INTO "users" VALUES (68,'Albert Hane','example-62@railstutorial.org','2018-11-08 11:28:56.045778','2018-11-08 11:28:56.045778','$2a$10$s0My.Cd9RJ08xP.5K3n.FOLH5KJnoAvp4Hp5ID5XQaCHKWP4TXpU6','6e2ce963795af843acbbfd33fd349b8c917277ea');
INSERT INTO "users" VALUES (69,'January Ratke','example-63@railstutorial.org','2018-11-08 11:28:56.123778','2018-11-08 11:28:56.123778','$2a$10$D/oH58F3mHm2XEHw9c0LdOMseF3eTjgga7vVPCqirZUtA2wZ6Y4IS','8f4b739430a696ce811c2c0f0884c2d09ca44a9e');
INSERT INTO "users" VALUES (70,'Liza Gerhold','example-64@railstutorial.org','2018-11-08 11:28:56.204778','2018-11-08 11:28:56.204778','$2a$10$Dd9T/2J/lLOECe0l1KTc6uAY81TcRXX0vRivxPUZe5lMycuJqa0oe','9acf21ec19453c0d526287579e94c02a55bf5683');
INSERT INTO "users" VALUES (71,'Apryl Schuster','example-65@railstutorial.org','2018-11-08 11:28:56.281778','2018-11-08 11:28:56.281778','$2a$10$OgGhZReaThM9JpM.mM2oWup2qHDIXNwQWFu6g5j/EdfMGFZLhbuoe','fabed4a84fcb1f4a439167426214d85dabba33d1');
INSERT INTO "users" VALUES (72,'Ms. Raymon Moore','example-66@railstutorial.org','2018-11-08 11:28:56.362778','2018-11-08 11:28:56.362778','$2a$10$MPmzfBWPi.4yIELCQi2dPOAl/y0xddDtYjfUPb/Ye3dhbk0CaobiG','283b06e7e9f5c8cdd30b204ee1d1c1c306457d40');
INSERT INTO "users" VALUES (73,'Elly Lind','example-67@railstutorial.org','2018-11-08 11:28:56.440778','2018-11-08 11:28:56.440778','$2a$10$tpIeUNQTrP1.vpBok5T6bu4q.0iTq0BbqKoFP3xfRCaGacA32mKzO','6f9ea3e574ff33990be8f20aeb0b310b2a5b124f');
INSERT INTO "users" VALUES (74,'Linnea Dickens','example-68@railstutorial.org','2018-11-08 11:28:56.517778','2018-11-08 11:28:56.517778','$2a$10$xciW/E1IG.q36NroFU3OX.ON1Rlg8m5jKpD.zRBkhMfX6uaOTS2Ra','33980075d9c102284ccf89f17d9b9a47649c5fd3');
INSERT INTO "users" VALUES (75,'Myong Flatley','example-69@railstutorial.org','2018-11-08 11:28:56.599778','2018-11-08 11:28:56.599778','$2a$10$59Hk0q57VMRbdeclK6oldO620bjNEYYzXz6iVF0todzK4PgsS..iq','68f79f21c8e395b907f6f2923f4b42c2fe8ce20e');
INSERT INTO "users" VALUES (76,'Horacio Corwin Jr.','example-70@railstutorial.org','2018-11-08 11:28:56.677778','2018-11-08 11:28:56.677778','$2a$10$tvTkD49DrpFYytvLPagZHeVYO2KwA8DAHIWE9Y0AYmYDolSkj/t66','6d9a1ff23386eff757d7cbacc812768f19dfa006');
INSERT INTO "users" VALUES (77,'Eugene Braun','example-71@railstutorial.org','2018-11-08 11:28:56.759778','2018-11-08 11:28:56.759778','$2a$10$Cm.VCKFfu3DYhIJnvuuIYeEwG9OsJfatpaJ25Tv20HOMaE88jKEd2','6fae16a73e03f8a5ebc68dcfe596e1006f19c5a7');
INSERT INTO "users" VALUES (78,'Antionette Powlowski','example-72@railstutorial.org','2018-11-08 11:28:56.835778','2018-11-08 11:28:56.835778','$2a$10$k7n0Xrw.vp/1sqZlcqsNnO7.8OKQXQ9G7CSUOCDyuSf8XYX0Vd3zm','faf96fb3b9ebae831ef6ff3d9378d0cacf33ad5c');
INSERT INTO "users" VALUES (79,'Donnie Green IV','example-73@railstutorial.org','2018-11-08 11:28:56.916778','2018-11-08 11:28:56.916778','$2a$10$IC6RLtWW0/vnnqzNvv8Bfub4MQuYIKqkHdKA6cWTcPnSpi8V1oHKi','4ed16d8bac1c72df1dcbd49d3f8d4f78b331b795');
INSERT INTO "users" VALUES (80,'Ok Quitzon','example-74@railstutorial.org','2018-11-08 11:28:57.003778','2018-11-08 11:28:57.003778','$2a$10$OtEbku6oCUwg6dbCRZ7kheYBac5SBZ5REBBGbWnFpbYAG3ca46aza','b997205fd86339806273824d8d093ae775237714');
INSERT INTO "users" VALUES (81,'Francene Feest','example-75@railstutorial.org','2018-11-08 11:28:57.078778','2018-11-08 11:28:57.078778','$2a$10$6.5.IyTM1hgXp7M7kA1ktOhVcrcBsT6nBzzMu6fK0mG4F5nH44JVa','569b2bc14af3150fbc569be6aecf368d24b70de6');
INSERT INTO "users" VALUES (82,'Janet Labadie','example-76@railstutorial.org','2018-11-08 11:28:57.159778','2018-11-08 11:28:57.159778','$2a$10$h5p0av5O2yKYlMgCKDVJ2OMv6mb7FjAzMaYhgqy.jKP3./VlU0Zla','1d53530b55bd36eb9eeb415e39652da1b14597f2');
INSERT INTO "users" VALUES (83,'Marty Hills','example-77@railstutorial.org','2018-11-08 11:28:57.237778','2018-11-08 11:28:57.237778','$2a$10$ChbKhJPbsPqYZrxw97oy7u0OES5tXlFJCKdO2pR/B5/d9tADieFCa','ef58e9b768eb337b7bfa32d9d1869315b37d769f');
INSERT INTO "users" VALUES (84,'Brett Bins','example-78@railstutorial.org','2018-11-08 11:28:57.313778','2018-11-08 11:28:57.313778','$2a$10$o6R6GPCepFpLJyIv1j9k7ODAodt6mBNlBgVP6ZICjGQrtG1Sb7k/6','aeec51282e7c0f72c4b4afadf9268161da6ff33e');
INSERT INTO "users" VALUES (85,'Orlando Schultz DDS','example-79@railstutorial.org','2018-11-08 11:28:57.394778','2018-11-08 11:28:57.394778','$2a$10$mBjCXaOhJlEQMDwaH4GSs.6uKbHRnepmmMjWsk8x1/snL35cz8CjS','65271be94fbf7fdb5226d8b8b029bba8a8861b54');
INSERT INTO "users" VALUES (86,'Maile Ratke','example-80@railstutorial.org','2018-11-08 11:28:57.470778','2018-11-08 11:28:57.470778','$2a$10$NLfCKTTBErBfZWX/6rvCTe0WxLxXQQ3NAWDZp3YmECkm0C4fruu06','e4aca2d940d750ab6f5a481077b2d38bafd79278');
INSERT INTO "users" VALUES (87,'Marguerite Schuster','example-81@railstutorial.org','2018-11-08 11:28:57.550778','2018-11-08 11:28:57.550778','$2a$10$PV1H2XVH99817a9jV.3h0.f4iJmGvWtMitFWM/tB2UndhPJm3ws9S','44c890964e0fe65b198e9f955debc13e5af7455a');
INSERT INTO "users" VALUES (88,'Juliette Connelly','example-82@railstutorial.org','2018-11-08 11:28:57.629778','2018-11-08 11:28:57.629778','$2a$10$Xa49.ckxNyqQWuob6vcUiuWwkjBJpGkr/7aeSsjUjbrZZFuVXqhUe','8277b1961be3d812f326db3ac2c3ba69cbbe4e06');
INSERT INTO "users" VALUES (89,'Wilburn Weber','example-83@railstutorial.org','2018-11-08 11:28:57.705778','2018-11-08 11:28:57.705778','$2a$10$vyOQCaaNv5CdouWke04hc.hBXCwkO0W44f2uGiujfa0huhRvHGn5y','282e053df2e91d4b02889985f0585da956e43c0d');
INSERT INTO "users" VALUES (90,'Grisel Graham','example-84@railstutorial.org','2018-11-08 11:28:57.788778','2018-11-08 11:28:57.788778','$2a$10$Lm988jNNvlXc1kjVk2aDxewDaO9BdDaz5ZJ3MerZ7KrH/b6/UJJl2','32f12ed3f0b0acf5cadbca1b96acbb26ba2444d6');
INSERT INTO "users" VALUES (91,'Connie Roberts','example-85@railstutorial.org','2018-11-08 11:28:57.868778','2018-11-08 11:28:57.868778','$2a$10$rpoBApaCpWe2Bo3uF1TdZ.m1iHkiWqmAo8bWonFxEI0DhZHcNFAhW','f89c702ed7f539789ec7a83008f752fb96241d91');
INSERT INTO "users" VALUES (92,'Olen Weimann','example-86@railstutorial.org','2018-11-08 11:28:57.946778','2018-11-08 11:28:57.946778','$2a$10$NJiakxozcm2AMTpx2I5kQecNv1GjXuRsgA/bGhmEES2DtiLqWKhEC','638822fccb9e479c6e052c04e25f2f018ee406e9');
INSERT INTO "users" VALUES (93,'Carmella Zboncak','example-87@railstutorial.org','2018-11-08 11:28:58.027778','2018-11-08 11:28:58.027778','$2a$10$j6tngHEw2FEjyeEMnWoNx.X7yHgMqTbI4X4H9u6ROcsuvG4eqtkL2','db643111b3f83539b050baf2dbad8cc2eb7dd44c');
INSERT INTO "users" VALUES (94,'Omega Schumm','example-88@railstutorial.org','2018-11-08 11:28:58.101778','2018-11-08 11:28:58.101778','$2a$10$Y686MotglYLLJSfL25S8req2DcWVWv2SxnymEzPMtTfJnEzwzTfvu','174d90681cf898fcb77d5d6875a82b77aac9ab13');
INSERT INTO "users" VALUES (95,'Miss Stephania Mosciski','example-89@railstutorial.org','2018-11-08 11:28:58.180778','2018-11-08 11:28:58.180778','$2a$10$vKPYd.QdTlTniQhRZapcS.sUFGLNdK.AJTkLCBkmweAlTyGg/LaFK','58a51240db861732c8a40b58bdc2c363156b1a3c');
INSERT INTO "users" VALUES (96,'Miss Bennett Doyle','example-90@railstutorial.org','2018-11-08 11:28:58.260778','2018-11-08 11:28:58.260778','$2a$10$MBm8m9gzFD4mNJYJx1.GYeeWC949nCLPOi7kcPuAi32xdRMU0YW7O','2193d87d189e8e751aaa47dfc4c3c9ad806f77fc');
INSERT INTO "users" VALUES (97,'Alethia D''Amore','example-91@railstutorial.org','2018-11-08 11:28:58.336778','2018-11-08 11:28:58.336778','$2a$10$isBvsMRDFzrczTyc3P34hO1YyI4rRLlwV2Sr0V8nGun5JmHmmSNv6','3f45d8e39fe4b706f262f85a1f814dc7b1228c09');
INSERT INTO "users" VALUES (98,'Caitlyn Herzog','example-92@railstutorial.org','2018-11-08 11:28:58.417778','2018-11-08 11:28:58.417778','$2a$10$s8HLxCEcQXGL4jw/xjm25.jXQ/fp6B3lgR81UmjCLNxPKVQg/2rGS','5cb8c248a155c8d79fb0fa4f257bbb873f2571a3');
INSERT INTO "users" VALUES (99,'Noah Bernhard I','example-93@railstutorial.org','2018-11-08 11:28:58.495778','2018-11-08 11:28:58.495778','$2a$10$eH9Xk0mxMLA.zNEr0Lm4beTCULmeEmAPdxeJvhErytIw4MDwxcd.S','f7e2692f4b82cd42edc76d53a3c26af08eb82548');
INSERT INTO "users" VALUES (100,'Ardis Daugherty','example-94@railstutorial.org','2018-11-08 11:28:58.573778','2018-11-08 11:28:58.573778','$2a$10$xa4G4SZP7kPFNqpURA5/ueXuBto8iQvuWzQZNMDDEgpwjidA1kkdS','db2fb9b55aa8e545a2c427a3b11c1a81cea9a472');
INSERT INTO "users" VALUES (101,'Emelina Reilly','example-95@railstutorial.org','2018-11-08 11:28:58.651778','2018-11-08 11:28:58.651778','$2a$10$0mi/UOBoI6rGMPk2iL6obOHaqvsHUOAYE4XHWOCvpUO7raJuZRQJO','244d2ea24a656f4172edfafaf87003695da7c129');
INSERT INTO "users" VALUES (102,'Seymour Wiza','example-96@railstutorial.org','2018-11-08 11:28:58.726778','2018-11-08 11:28:58.726778','$2a$10$YfjvP4oJzAnuWWSgCNTRaeEtZwVpk/icLdtGtYYLWWv1KM92Y7Z.e','6292b7b84050c1f84562407ff3d16a0fc7ea6c7e');
INSERT INTO "users" VALUES (103,'Nestor Batz IV','example-97@railstutorial.org','2018-11-08 11:28:58.808778','2018-11-08 11:28:58.808778','$2a$10$xitdq2ilGkUOO0.C0Jj0OOFq38A4xOoUWvpKo8PceZPm/bX/4mmRm','d5e0f12341051c5e6f90b6ae095962ea148448c1');
INSERT INTO "users" VALUES (104,'Ms. Chadwick Tillman','example-98@railstutorial.org','2018-11-08 11:28:58.888778','2018-11-08 11:28:58.888778','$2a$10$qb53w4NuH5.8BzGSABBHTeNBWZgvqKH8p1XSM0GD.39FokE50xF52','fc38a5bdd6dffa444c4cbd7b0a34bfe32d671cab');
INSERT INTO "users" VALUES (105,'Randal O''Hara','example-99@railstutorial.org','2018-11-08 11:28:58.965778','2018-11-08 11:28:58.965778','$2a$10$csG32hwCDtc9h66SMQjuiuvsgHBm9g0gldCs4WUovIooQu/CrwKq.','bea3ac7f6e145139cd3fca0028b2d0fdbadbfe68');
DROP INDEX IF EXISTS "index_users_on_remember_token";
CREATE INDEX IF NOT EXISTS "index_users_on_remember_token" ON "users" (
	"remember_token"
);
DROP INDEX IF EXISTS "index_users_on_email";
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
COMMIT;
