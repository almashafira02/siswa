-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Jul 2019 pada 06.01
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siswa 2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `course`
--

CREATE TABLE `course` (
  `id_course` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `fee` int(11) NOT NULL,
  `prerequisites` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faculty`
--

CREATE TABLE `faculty` (
  `id_faculty` int(4) NOT NULL,
  `nama_faculty` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `feedback_text` varchar(20) NOT NULL,
  `tanggal_post` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `query`
--

CREATE TABLE `query` (
  `id` int(11) NOT NULL,
  `query` varchar(30) NOT NULL,
  `tanggal_query` date NOT NULL,
  `tanggal_respon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `student`
--

CREATE TABLE `student` (
  `id_siswa` int(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_hp` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `study center`
--

CREATE TABLE `study center` (
  `id_scenter` int(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `lokasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `teacher`
--

CREATE TABLE `teacher` (
  `id_teacher` int(11) NOT NULL,
  `nip` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `no_hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id_course`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id_faculty`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`);

--
-- Indeks untuk tabel `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `query` (`query`);

--
-- Indeks untuk tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_siswa`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `study center`
--
ALTER TABLE `study center`
  ADD PRIMARY KEY (`id_scenter`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- Indeks untuk tabel `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`nip`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `course`
--
ALTER TABLE `course`
  MODIFY `id_course` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id_faculty` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `query`
--
ALTER TABLE `query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `student`
--
ALTER TABLE `student`
  MODIFY `id_siswa` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `study center`
--
ALTER TABLE `study center`
  MODIFY `id_scenter` int(4) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `feedback` (`id_feedback`);

--
-- Ketidakleluasaan untuk tabel `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `student` (`id_siswa`);

--
-- Ketidakleluasaan untuk tabel `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `teacher` (`nip`);

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_feedback`) REFERENCES `student` (`id_siswa`);

--
-- Ketidakleluasaan untuk tabel `query`
--
ALTER TABLE `query`
  ADD CONSTRAINT `query_ibfk_1` FOREIGN KEY (`query`) REFERENCES `student` (`nama`);

--
-- Ketidakleluasaan untuk tabel `study center`
--
ALTER TABLE `study center`
  ADD CONSTRAINT `study center_ibfk_1` FOREIGN KEY (`id_scenter`) REFERENCES `student` (`id_siswa`),
  ADD CONSTRAINT `study center_ibfk_2` FOREIGN KEY (`nama`) REFERENCES `student` (`nama`);

--
-- Ketidakleluasaan untuk tabel `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`nama`) REFERENCES `course` (`nama`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
