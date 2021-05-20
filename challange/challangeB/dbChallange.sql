/*
 Navicat Premium Data Transfer

 Source Server         : postgre
 Source Server Type    : PostgreSQL
 Source Server Version : 130001
 Source Host           : localhost:5432
 Source Catalog        : testDatabase
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 130001
 File Encoding         : 65001

 Date: 20/05/2021 08:27:08
*/


-- ----------------------------
-- Table structure for data_nilai
-- ----------------------------
DROP TABLE IF EXISTS "public"."data_nilai";
CREATE TABLE "public"."data_nilai" (
  "nim" int4 NOT NULL,
  "id_mata_kuliah" int4 NOT NULL,
  "id_dosen" int4,
  "nilai" int4,
  "keterangan" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of data_nilai
-- ----------------------------
INSERT INTO "public"."data_nilai" VALUES (1, 1, 1, 75, 'Memuaskan');
INSERT INTO "public"."data_nilai" VALUES (2, 1, 1, 80, 'Sangat Memuaskan');
INSERT INTO "public"."data_nilai" VALUES (1, 2, 2, 60, 'Cukup');
INSERT INTO "public"."data_nilai" VALUES (2, 2, 2, 40, 'Kurang');

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS "public"."dosen";
CREATE TABLE "public"."dosen" (
  "id" int4 NOT NULL,
  "nama" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO "public"."dosen" VALUES (2, 'Imam');
INSERT INTO "public"."dosen" VALUES (1, 'Tao');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS "public"."mahasiswa";
CREATE TABLE "public"."mahasiswa" (
  "nim" int4 NOT NULL,
  "nama" varchar(255) COLLATE "pg_catalog"."default",
  "alamat" varchar(255) COLLATE "pg_catalog"."default",
  "tanggal_lahir" date,
  "jurusan" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO "public"."mahasiswa" VALUES (1, 'Rio', 'Bandung', '1994-11-21', 'IPA');
INSERT INTO "public"."mahasiswa" VALUES (2, 'oda', 'Bekasi ', '1997-05-19', 'IPS');

-- ----------------------------
-- Table structure for mata_kuliah
-- ----------------------------
DROP TABLE IF EXISTS "public"."mata_kuliah";
CREATE TABLE "public"."mata_kuliah" (
  "id" int4 NOT NULL,
  "nama_mata_kuliah" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of mata_kuliah
-- ----------------------------
INSERT INTO "public"."mata_kuliah" VALUES (1, 'Bahasa Indonesia');
INSERT INTO "public"."mata_kuliah" VALUES (2, 'Bahasa Inggris');

-- ----------------------------
-- Table structure for mata_kuliah_junction
-- ----------------------------
DROP TABLE IF EXISTS "public"."mata_kuliah_junction";
CREATE TABLE "public"."mata_kuliah_junction" (
  "id_mata_kuliah" int4 NOT NULL,
  "nim" int4 NOT NULL
)
;

-- ----------------------------
-- Records of mata_kuliah_junction
-- ----------------------------
INSERT INTO "public"."mata_kuliah_junction" VALUES (1, 1);
INSERT INTO "public"."mata_kuliah_junction" VALUES (1, 2);
INSERT INTO "public"."mata_kuliah_junction" VALUES (2, 1);
INSERT INTO "public"."mata_kuliah_junction" VALUES (2, 2);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_role";
CREATE TABLE "public"."user_role" (
  "id" int4 NOT NULL,
  "role" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO "public"."user_role" VALUES (1, 'Mahasiswa');
INSERT INTO "public"."user_role" VALUES (2, 'Dosen');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "role" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'Mahasiswa'::character varying
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'rio.rezky21@gmail.com', 'test123', 'Mahasiswa');
INSERT INTO "public"."users" VALUES (2, 'imammaulana@gmail.com', 'test', 'Dosen');
INSERT INTO "public"."users" VALUES (3, 'odazioda@gmail.com', 'test', 'Mahasiswa');
INSERT INTO "public"."users" VALUES (4, 'taofikrohman@gmail.com', 'test', 'Dosen');

-- ----------------------------
-- Primary Key structure for table data_nilai
-- ----------------------------
ALTER TABLE "public"."data_nilai" ADD CONSTRAINT "data_nilai_pk" PRIMARY KEY ("nim", "id_mata_kuliah");

-- ----------------------------
-- Primary Key structure for table dosen
-- ----------------------------
ALTER TABLE "public"."dosen" ADD CONSTRAINT "dosen_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mahasiswa
-- ----------------------------
ALTER TABLE "public"."mahasiswa" ADD CONSTRAINT "mahasiswa_pkey" PRIMARY KEY ("nim");

-- ----------------------------
-- Primary Key structure for table mata_kuliah
-- ----------------------------
ALTER TABLE "public"."mata_kuliah" ADD CONSTRAINT "mata_kuliah_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table mata_kuliah_junction
-- ----------------------------
ALTER TABLE "public"."mata_kuliah_junction" ADD CONSTRAINT "mata_kuliah_pk" PRIMARY KEY ("id_mata_kuliah", "nim");

-- ----------------------------
-- Uniques structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_role_key" UNIQUE ("role");

-- ----------------------------
-- Primary Key structure for table user_role
-- ----------------------------
ALTER TABLE "public"."user_role" ADD CONSTRAINT "user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table data_nilai
-- ----------------------------
ALTER TABLE "public"."data_nilai" ADD CONSTRAINT "fk_id_dosen" FOREIGN KEY ("id_dosen") REFERENCES "public"."dosen" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."data_nilai" ADD CONSTRAINT "fk_id_mata_kuliah" FOREIGN KEY ("id_mata_kuliah") REFERENCES "public"."mata_kuliah" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."data_nilai" ADD CONSTRAINT "fk_nim_mahasiswa" FOREIGN KEY ("nim") REFERENCES "public"."mahasiswa" ("nim") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table mata_kuliah_junction
-- ----------------------------
ALTER TABLE "public"."mata_kuliah_junction" ADD CONSTRAINT "fk_id_mata_kuliah" FOREIGN KEY ("id_mata_kuliah") REFERENCES "public"."mata_kuliah" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."mata_kuliah_junction" ADD CONSTRAINT "fk_nim_mahasiswa" FOREIGN KEY ("nim") REFERENCES "public"."mahasiswa" ("nim") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "fk_user_role" FOREIGN KEY ("role") REFERENCES "public"."user_role" ("role") ON DELETE NO ACTION ON UPDATE NO ACTION;
