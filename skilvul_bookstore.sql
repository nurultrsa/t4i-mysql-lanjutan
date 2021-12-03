-- Create DB --
CREATE DATABASE skilvulbookstore;

-- Use DB --
USE skilvulbookstore;

-- CREATE TABLE Penerbit --
CREATE TABLE penerbit(
  id INT(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nama VARCHAR(50),
  kota VARCHAR(50)
);

-- INSERT DATA Penerbit --
INSERT INTO penerbit(nama, kota) VALUES
('HarperCollins', 'New York'),
('Gramedia Pustaka Utama', 'Jakarta'),
('Hachette Book Group', 'New York'),
('Scholastic', 'Pennsylvania');

-- CREATE TABLE Penulis --
CREATE TABLE penulis(
  id INT(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nama VARCHAR(50),
  kota VARCHAR(50)
);

-- INSERT DATA Penulis --
INSERT INTO penulis(nama, kota) VALUES
('Shari Lapena', 'Canada'),
('John Le Carre', 'England),
('Karin Slaughter', 'USA');

-- CREATE TABLE Buku --
CREATE TABLE buku(
  id INT(10) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  isbn VARCHAR(50),
  judul VARCHAR(50),
  penulis INT(10),
  penerbit INT(10),
  harga INT(10),
  stock INT(10),
  constraint fk_buku_penulis FOREIGN KEY(penulis) REFERENCES penulis(id),
  constraint fk_buku_penerbit FOREIGN KEY(penerbit) REFERENCES penerbit(id)
);

-- INSERT DATA Buku --
INSERT INTO buku VALUES
('', '1038279247', 'The Couple Next Door', 1, 1, 120000, 5),
('', '4024746289', 'Pretty Girl', 3, 3, 100000, 25),
('', '2947284017', 'Call for the Dead', 2, 2, 70000, 50),
('', '2019374629', 'The Good Daughter', 3, 1, 165000, 4);

-- INNER JOIN --
SELECT buku.id, isbn, judul, penulis, penerbit.nama AS penerbit, harga, stock FROM buku INNER JOIN penerbit ON buku.penerbit = penerbit.id;

-- LEFT JOIN --
SELECT buku.id, isbn, judul, penulis, penerbit.nama AS penerbit, harga, stock FROM buku LEFT JOIN penerbit ON buku.penerbit = penerbit.id;

-- RIGHT JOIN --
SELECT buku.id, isbn, judul, penulis, penerbit.nama AS penerbit, harga, stock FROM buku RIGHT JOIN penerbit ON buku.penerbit = penerbit.id;

-- MAX --
SELECT MAX(harga) FROM buku WHERE stock < 10;

-- MIN --
SELECT MIN(harga) FROM buku;

-- COUNT --
SELECT COUNT(*) FROM buku WHERE harga < 100000;
