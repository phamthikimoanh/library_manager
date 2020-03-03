BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "book_cards" (
	"id"	integer NOT NULL,
	"name"	varchar DEFAULT NULL,
	"return_date"	date DEFAULT NULL,
	"price_borrow"	integer DEFAULT 0,
	"status"	boolean DEFAULT 0,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"book_id"	integer DEFAULT NULL,
	"book_order_id"	integer DEFAULT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "users" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"email"	varchar NOT NULL DEFAULT '',
	"encrypted_password"	varchar NOT NULL DEFAULT '',
	"reset_password_token"	varchar,
	"reset_password_sent_at"	datetime,
	"remember_created_at"	datetime,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"admin"	boolean DEFAULT 0,
	"name"	varchar,
	"phone"	varchar,
	"birthday"	date,
	"address"	varchar,
	"image"	varchar
);
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL
);
CREATE TABLE IF NOT EXISTS "books" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"isbn"	varchar,
	"name"	varchar,
	"desc"	varchar,
	"author"	varchar,
	"image"	varchar,
	"books_total"	integer,
	"status"	boolean DEFAULT 1,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"category_id"	integer,
	"price"	integer,
	"book_stock"	integer,
	"user_id"	integer
);
CREATE TABLE IF NOT EXISTS "book_orders" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"amount_book"	integer,
	"brorrow_date"	date,
	"status"	boolean,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	"user_id"	integer,
	"deposits"	integer
);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
	"key"	varchar NOT NULL,
	"value"	varchar,
	"created_at"	datetime NOT NULL,
	"updated_at"	datetime NOT NULL,
	PRIMARY KEY("key")
);
CREATE TABLE IF NOT EXISTS "schema_migrations" (
	"version"	varchar NOT NULL,
	PRIMARY KEY("version")
);
INSERT INTO "book_cards" ("id","name","return_date","price_borrow","status","created_at","updated_at","book_id","book_order_id") VALUES (1,'Harry Poster	',NULL,0,0,'2020-03-02 19:22:45.490668','2020-03-02 19:22:45.490668',17,46),
 (2,'Conan - Tập 96',NULL,0,0,'2020-03-02 19:24:16.781560','2020-03-02 19:24:16.781560',18,47),
 (3,'The Alchemist',NULL,0,0,'2020-03-02 19:24:16.782364','2020-03-02 19:24:16.782364',19,47),
 (4,'The Alchemist',NULL,0,0,'2020-03-02 19:25:03.377925','2020-03-02 19:25:03.377925',19,48),
 (5,'Harry Poster : A Pop-Up Guide to Hogwarts',NULL,0,0,'2020-03-02 19:25:03.378931','2020-03-02 19:25:03.378931',20,48);
INSERT INTO "users" ("id","email","encrypted_password","reset_password_token","reset_password_sent_at","remember_created_at","created_at","updated_at","admin","name","phone","birthday","address","image") VALUES (1,'kimoanh2613@gmail.com','$2a$11$alohn7w1voN63D2QsLe2pONccthIaTtBDvjHvhNeuYh4ABGgYql5q',NULL,NULL,NULL,'2020-02-26 09:50:39.717587','2020-03-02 08:20:19.924902',1,'Phạm Thị Kim Oanh','0123456788','1996-04-26','126 Nguyên Thi Minh Khai, quận 1, HCM','flowers-1973875_640.png'),
 (2,'votheduy@gmail.com','$2a$11$WjEx6zN10zifpqMKHHA2F.G0rs.OJpc0vQspKCeriI24PPZa76iwy',NULL,NULL,NULL,'2020-03-01 08:57:48.964842','2020-03-01 08:57:48.964842',0,'Võ Thế Duy','0123456792','1997-03-13','137 Nguyên Thi Minh Khai, quận 1, HCM',NULL),
 (3,'trancongphong@gmail.com','$2a$11$enjMJhq02BS.FmHdKstE7u90LyfPXpv1MR8N3nhuyoRCbsuOMfa4K',NULL,NULL,NULL,'2020-03-02 02:43:20.669465','2020-03-02 14:09:46.859867',0,'Trần Công Phong','0123456791','1996-01-01','125 Nguyên Thi Minh Khai, quận 1, HCM','flowers-1973875_640.png'),
 (4,'nguyenthinhung@gmail.com','$2a$11$KtOIi3cBH4js5EEXWaPENOpBSHYCai5NFATBv3/E9w0FpQcSfAA3a',NULL,NULL,NULL,'2020-03-02 04:31:14.167309','2020-03-02 04:31:14.167309',0,'Nguyễn Thị Nhung','0123456345','1997-02-18','334 Nguyên Thi Minh Khai, quận 1, HCM',NULL);
INSERT INTO "categories" ("id","name","created_at","updated_at") VALUES (1,'Truyện viễn tưởng','2020-02-26 09:51:51.392527','2020-02-26 09:51:51.392527'),
 (2,'Truyện ma','2020-02-28 10:08:15.550710','2020-02-28 10:08:51.400257'),
 (3,'Truyện hài','2020-02-28 10:08:17.200483','2020-02-28 10:09:25.629480'),
 (4,'Truyện trinh thám','2020-02-28 10:08:18.312889','2020-02-28 10:09:42.288869'),
 (5,'Sách Tin Học','2020-02-28 10:09:49.720179','2020-02-28 10:09:49.720179'),
 (6,'Sách Hóa','2020-02-28 10:10:46.176975','2020-02-28 10:10:46.176975'),
 (7,'Sách Khoa Học','2020-02-28 10:11:33.468625','2020-02-28 10:11:33.468625'),
 (8,'Từ điển','2020-03-01 10:40:45.040205','2020-03-01 10:40:45.040205'),
 (9,'Sách kỹ năng','2020-03-02 07:03:05.198845','2020-03-02 07:03:05.198845');
INSERT INTO "books" ("id","isbn","name","desc","author","image","books_total","status","created_at","updated_at","category_id","price","book_stock","user_id") VALUES (17,'1234564241','Harry Poster','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','Harry','flowers-1973875_640.png',99,1,'2020-03-02 19:02:15.776843','2020-03-02 19:02:15.776843',1,238000,NULL,1),
 (18,'1234564244','Conan - Tập 96','In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.','Gosho Aoyama','flowers-1973875_640.png',99,1,'2020-03-02 19:14:33.449525','2020-03-02 19:14:33.449525',1,15700,NULL,1),
 (19,'9338289653596','The Alchemist','With Paulo’s visionary blend of spirituality, magical realism and folklore, The Alchemist is a story with the power to inspire nations and change people’s lives.','Paulo Coelho','flowers-1973875_640.png',1,1,'2020-03-02 19:15:59.726404','2020-03-02 19:15:59.726404',9,107000,NULL,1),
 (20,'1716783125975','Harry Poster : A Pop-Up Guide to Hogwarts ','Harry Potter: A Pop-Up Guide to Hogwarts is an exhilarating, interactive guide to the iconic school of witchcraft and wizardry. This book features spectacular pop-up re-creations of key locations inside and outside Hogwarts castle','Kevin Wilson','flowers-1973875_640.png',4,1,'2020-03-02 19:17:49.556756','2020-03-02 19:20:50.070055',1,907000,NULL,1);
INSERT INTO "book_orders" ("id","amount_book","brorrow_date","status","created_at","updated_at","user_id","deposits") VALUES (46,1,'2020-03-02',NULL,'2020-03-02 19:22:45.489348','2020-03-02 19:22:45.489348',2,238000),
 (47,2,'2020-03-02',NULL,'2020-03-02 19:24:16.780592','2020-03-02 19:24:16.780592',3,122700),
 (48,2,'2020-03-02',NULL,'2020-03-02 19:25:03.376772','2020-03-02 19:25:03.376772',4,1014000);
INSERT INTO "ar_internal_metadata" ("key","value","created_at","updated_at") VALUES ('environment','development','2020-02-26 09:31:56.735975','2020-02-26 09:31:56.735975');
INSERT INTO "schema_migrations" ("version") VALUES ('20200205082333'),
 ('20200206032031'),
 ('20200206035711'),
 ('20200206040730'),
 ('20200207044118'),
 ('20200212075100'),
 ('20200212075441'),
 ('20200212080024'),
 ('20200212081045'),
 ('20200213031713'),
 ('20200213031827'),
 ('20200218083203'),
 ('20200224175411'),
 ('20200225025838'),
 ('20200225031815'),
 ('20200225041043'),
 ('20200302041607'),
 ('20200302042502');
CREATE INDEX IF NOT EXISTS "index_book_cards_on_book_order_id" ON "book_cards" (
	"book_order_id"
);
CREATE INDEX IF NOT EXISTS "index_book_cards_on_book_id" ON "book_cards" (
	"book_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_reset_password_token" ON "users" (
	"reset_password_token"
);
CREATE UNIQUE INDEX IF NOT EXISTS "index_users_on_email" ON "users" (
	"email"
);
CREATE INDEX IF NOT EXISTS "index_books_on_user_id" ON "books" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "index_books_on_category_id" ON "books" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "index_book_orders_on_user_id" ON "book_orders" (
	"user_id"
);
COMMIT;
