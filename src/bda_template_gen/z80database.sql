/*==============================================================================================
	
	z80database.sql
	Copyright 2019-2021 Buster Schrader
	
	This file is part of SIASM.
	
	SIASM is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	any later version.
	
	SIASM is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with SIASM.  If not, see <https://www.gnu.org/licenses/>.
	
==============================================================================================*/

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE IF NOT EXISTS `z80` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `z80`;

CREATE TABLE IF NOT EXISTS `instructions` (
  `code` int(11) NOT NULL,
  `mnemonic` varchar(32) NOT NULL,
  `prefix_byte` int(11) NOT NULL,
  `cycles` int(11) NOT NULL,
  `ts1000` tinyint(1) NOT NULL,
  PRIMARY KEY (`code`,`prefix_byte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `instructions` (`code`, `mnemonic`, `prefix_byte`, `cycles`, `ts1000`) VALUES
(0, 'nop', 0, 0, 1),
(0, 'ric b', 203, 0, 1),
(1, 'ld bc,NN', 0, 0, 1),
(1, 'ric c', 203, 0, 1),
(2, 'ld (bc),a', 0, 0, 1),
(2, 'ric d', 203, 0, 1),
(3, 'inc bc', 0, 0, 1),
(3, 'ric e', 203, 0, 1),
(4, 'inc b', 0, 0, 1),
(4, 'ric h', 203, 0, 1),
(5, 'dec b', 0, 0, 1),
(5, 'ric l', 203, 0, 1),
(6, 'ld b,N', 0, 0, 1),
(6, 'ric (hl)', 203, 0, 1),
(7, 'rlca', 0, 0, 1),
(7, 'ric a', 203, 0, 1),
(8, 'ex af,af''', 0, 0, 1),
(8, 'rrc b', 203, 0, 1),
(9, 'add hl,bc', 0, 0, 1),
(9, 'rrc c', 203, 0, 1),
(10, 'ld a,(bc)', 0, 0, 1),
(10, 'rrc d', 203, 0, 1),
(11, 'dec bc', 0, 0, 1),
(11, 'rrc e', 203, 0, 1),
(12, 'inc c', 0, 0, 1),
(12, 'rrc h', 203, 0, 1),
(13, 'dec c', 0, 0, 1),
(13, 'rrc l', 203, 0, 1),
(14, 'ld c,N', 0, 0, 1),
(14, 'rrc (hl)', 203, 0, 1),
(15, 'rrca', 0, 0, 1),
(15, 'rrc a', 203, 0, 1),
(16, 'djnz DIS', 0, 0, 1),
(16, 'rl b', 203, 0, 1),
(17, 'ld de,NN', 0, 0, 1),
(17, 'rl c', 203, 0, 1),
(18, 'ld (de),a', 0, 0, 1),
(18, 'rl d', 203, 0, 1),
(19, 'inc de', 0, 0, 1),
(19, 'rl e', 203, 0, 1),
(20, 'inc d', 0, 0, 1),
(20, 'rl  h', 203, 0, 1),
(21, 'dec d', 0, 0, 1),
(21, 'rl l', 203, 0, 1),
(22, 'ld d,N', 0, 0, 1),
(22, 'rl (hl)', 203, 0, 1),
(23, 'rla', 0, 0, 1),
(23, 'rl a', 203, 0, 1),
(24, 'jr DIS', 0, 0, 1),
(24, 'rr b', 203, 0, 1),
(25, 'add hl,de', 0, 0, 1),
(25, 'rr c', 203, 0, 1),
(26, 'ld a,(de)', 0, 0, 1),
(26, 'rr d', 203, 0, 1),
(27, 'dec de', 0, 0, 1),
(27, 'rr e', 203, 0, 1),
(28, 'inc e', 0, 0, 1),
(28, 'rr h', 203, 0, 1),
(29, 'dec e', 0, 0, 1),
(29, 'rr l', 203, 0, 1),
(30, 'ld e,N', 0, 0, 1),
(30, 'rr (hl)', 203, 0, 1),
(31, 'rra', 0, 0, 1),
(31, 'rr a', 203, 0, 1),
(32, 'jr nz,DIS', 0, 0, 1),
(32, 'sla b', 203, 0, 1),
(33, 'ld hl,NN', 0, 0, 1),
(33, 'sla c', 203, 0, 1),
(34, 'ld (NN),hl', 0, 0, 1),
(34, 'sla d', 203, 0, 1),
(35, 'inc hl', 0, 0, 1),
(35, 'sla e', 203, 0, 1),
(36, 'inc h', 0, 0, 1),
(36, 'sla h', 203, 0, 1),
(37, 'dec h', 0, 0, 1),
(37, 'sla l', 203, 0, 1),
(38, 'ld h,N', 0, 0, 1),
(38, 'sla (hl)', 203, 0, 1),
(39, 'daa', 0, 0, 1),
(39, 'sla a', 203, 0, 1),
(40, 'jr z,DIS', 0, 0, 1),
(40, 'sra b', 203, 0, 1),
(41, 'add hl,hl', 0, 0, 1),
(41, 'sra c', 203, 0, 1),
(42, 'ld hl,(NN)', 0, 0, 1),
(42, 'sra d', 203, 0, 1),
(43, 'dec hl', 0, 0, 1),
(43, 'sra e', 203, 0, 1),
(44, 'inc l', 0, 0, 1),
(44, 'sra h', 203, 0, 1),
(45, 'dec l', 0, 0, 1),
(45, 'sra l', 203, 0, 1),
(46, 'ld l,N', 0, 0, 1),
(46, 'sra (hl)', 203, 0, 1),
(47, 'cpl', 0, 0, 1),
(47, 'sra a', 203, 0, 1),
(48, 'jr nc,DIS', 0, 0, 1),
(49, 'ld sp,NN', 0, 0, 1),
(50, 'ld (NN),a', 0, 0, 1),
(51, 'inc sp', 0, 0, 1),
(52, 'inc (hl)', 0, 0, 1),
(53, 'dec (hl)', 0, 0, 1),
(54, 'ld (hl),N', 0, 0, 1),
(55, 'scf', 0, 0, 1),
(56, 'jr c,DIS', 0, 0, 1),
(56, 'srl b', 203, 0, 1),
(57, 'add hl,sp', 0, 0, 1),
(57, 'srl c', 203, 0, 1),
(58, 'ld a,(NN)', 0, 0, 1),
(58, 'srl d', 203, 0, 1),
(59, 'dec sp', 0, 0, 1),
(59, 'srl e', 203, 0, 1),
(60, 'inc a', 0, 0, 1),
(60, 'srl h', 203, 0, 1),
(61, 'dec a', 0, 0, 1),
(61, 'srl l', 203, 0, 1),
(62, 'ld a,N', 0, 0, 1),
(62, 'srl (hl)', 203, 0, 1),
(63, 'ccf', 0, 0, 1),
(63, 'srl a', 203, 0, 1),
(64, 'ld b,b', 0, 0, 1),
(64, 'bit 0,b', 203, 0, 1),
(64, 'in b,(c)', 237, 0, 1),
(65, 'ld b,c', 0, 0, 1),
(65, 'bit 0,c', 203, 0, 1),
(65, 'out (c),b', 237, 0, 1),
(66, 'ld b,d', 0, 0, 1),
(66, 'bit 0,d', 203, 0, 1),
(66, 'sbc hl,bc', 237, 0, 1),
(67, 'ld b,e', 0, 0, 1),
(67, 'bit 0,e', 203, 0, 1),
(67, 'ld (NN),bc', 237, 0, 1),
(68, 'ld b,h', 0, 0, 1),
(68, 'bit 0,h', 203, 0, 1),
(68, 'neg', 237, 0, 1),
(69, 'ld b,l', 0, 0, 1),
(69, 'bit 0,l', 203, 0, 1),
(69, 'retn', 237, 0, 1),
(70, 'ld b,(hl)', 0, 0, 1),
(70, 'bit 0,(hl)', 203, 0, 1),
(70, 'im 0', 237, 0, 1),
(71, 'ld b,a', 0, 0, 1),
(71, 'bit 0,a', 203, 0, 1),
(71, 'ld i,a', 237, 0, 1),
(72, 'ld c,b', 0, 0, 1),
(72, 'bit 1,b', 203, 0, 1),
(72, 'in c,(c)', 237, 0, 1),
(73, 'ld c,c', 0, 0, 1),
(73, 'bit 1,c', 203, 0, 1),
(73, 'out (c),c', 237, 0, 1),
(74, 'ld c,d', 0, 0, 1),
(74, 'bit 1,d', 203, 0, 1),
(74, 'adc hl,bc', 237, 0, 1),
(75, 'ld c,e', 0, 0, 1),
(75, 'bit 1,e', 203, 0, 1),
(75, 'ld bc,(NN)', 237, 0, 1),
(76, 'ld c,h', 0, 0, 1),
(76, 'bit 1,h', 203, 0, 1),
(77, 'ld c,l', 0, 0, 1),
(77, 'bit 1,l', 203, 0, 1),
(77, 'reti', 237, 0, 1),
(78, 'ld c,(hl)', 0, 0, 1),
(78, 'bit 1,(hl)', 203, 0, 1),
(79, 'ld c,a', 0, 0, 1),
(79, 'bit 1,a', 203, 0, 1),
(79, 'ld r,a', 237, 0, 1),
(80, 'ld d,b', 0, 0, 1),
(80, 'bit 2,b', 203, 0, 1),
(80, 'in d,(c)', 237, 0, 1),
(81, 'ld d,c', 0, 0, 1),
(81, 'bit 2,c', 203, 0, 1),
(81, 'out (c),d', 237, 0, 1),
(82, 'ld d,d', 0, 0, 1),
(82, 'bit 2,d', 203, 0, 1),
(82, 'sbc hl,de', 237, 0, 1),
(83, 'ld d,e', 0, 0, 1),
(83, 'bit 2,e', 203, 0, 1),
(83, 'ld (NN),de', 237, 0, 1),
(84, 'ld d,h', 0, 0, 1),
(84, 'bit 2,h', 203, 0, 1),
(85, 'ld d,l', 0, 0, 1),
(85, 'bit 2,l', 203, 0, 1),
(86, 'ld d,(hl)', 0, 0, 1),
(86, 'bit 2,(hl)', 203, 0, 1),
(86, 'im 1', 237, 0, 1),
(87, 'ld d,a', 0, 0, 1),
(87, 'bit 2,a', 203, 0, 1),
(87, 'ld a,i', 237, 0, 1),
(88, 'ld e,b', 0, 0, 1),
(88, 'bit 3,b', 203, 0, 1),
(88, 'in e,(c)', 237, 0, 1),
(89, 'ld e,c', 0, 0, 1),
(89, 'bit 3,c', 203, 0, 1),
(89, 'out (c),e', 237, 0, 1),
(90, 'ld e,d', 0, 0, 1),
(90, 'bit 3,d', 203, 0, 1),
(90, 'adc hl,de', 237, 0, 1),
(91, 'ld e,e', 0, 0, 1),
(91, 'bit 3,e', 203, 0, 1),
(91, 'ld de,(NN)', 237, 0, 1),
(92, 'ld e,h', 0, 0, 1),
(92, 'bit 3,h', 203, 0, 1),
(93, 'ld e,l', 0, 0, 1),
(93, 'bit 3,l', 203, 0, 1),
(94, 'ld e,(hl)', 0, 0, 1),
(94, 'bit 3,(hl)', 203, 0, 1),
(94, 'im 2', 237, 0, 1),
(95, 'ld e,a', 0, 0, 1),
(95, 'bit 3,a', 203, 0, 1),
(95, 'ld a,r', 237, 0, 1),
(96, 'ld h,b', 0, 0, 1),
(96, 'bit 4,b', 203, 0, 1),
(96, 'in h,(c)', 237, 0, 1),
(97, 'ld h,c', 0, 0, 1),
(97, 'bit 4,c', 203, 0, 1),
(97, 'out (c),h', 237, 0, 1),
(98, 'ld h,d', 0, 0, 1),
(98, 'bit 4,d', 203, 0, 1),
(98, 'sbc hl,hl', 237, 0, 1),
(99, 'ld h,e', 0, 0, 1),
(99, 'bit 4,e', 203, 0, 1),
(99, 'ld (NN),hl', 237, 0, 1),
(100, 'ld h,h', 0, 0, 1),
(100, 'bit 4,h', 203, 0, 1),
(101, 'ld h,l', 0, 0, 1),
(101, 'bit 4,l', 203, 0, 1),
(102, 'ld h,(hl)', 0, 0, 1),
(102, 'bit 4,(hl)', 203, 0, 1),
(103, 'ld h,a', 0, 0, 1),
(103, 'bit 4,a', 203, 0, 1),
(103, 'rrd', 237, 0, 1),
(104, 'ld l,b', 0, 0, 1),
(104, 'bit 5,b', 203, 0, 1),
(104, 'in l,(c)', 237, 0, 1),
(105, 'ld l,c', 0, 0, 1),
(105, 'bit 5,c', 203, 0, 1),
(105, 'out (c),l', 237, 0, 1),
(106, 'ld l,d', 0, 0, 1),
(106, 'bit 5,d', 203, 0, 1),
(106, 'adc hl,hl', 237, 0, 1),
(107, 'ld l,e', 0, 0, 1),
(107, 'bit 5,e', 203, 0, 1),
(107, 'ld hl,(NN)', 237, 0, 1),
(108, 'ld l,h', 0, 0, 1),
(108, 'bit 5,h', 203, 0, 1),
(109, 'ld l,l', 0, 0, 1),
(109, 'bit 5,l', 203, 0, 1),
(110, 'ld l,(hl)', 0, 0, 1),
(110, 'bit 5,(hl)', 203, 0, 1),
(111, 'ld l,a', 0, 0, 1),
(111, 'bit 5,a', 203, 0, 1),
(111, 'rid', 237, 0, 1),
(112, 'ld (hl),b', 0, 0, 1),
(112, 'bit 6,b', 203, 0, 1),
(113, 'ld (hl),c', 0, 0, 1),
(113, 'bit 6,c', 203, 0, 1),
(114, 'ld (hl),d', 0, 0, 1),
(114, 'bit 6,d', 203, 0, 1),
(114, 'sbc hl,sp', 237, 0, 1),
(115, 'ld (hl),e', 0, 0, 1),
(115, 'bit 6,e', 203, 0, 1),
(115, 'ld (NN),sp', 237, 0, 1),
(116, 'ld (hl),h', 0, 0, 1),
(116, 'bit 6,h', 203, 0, 1),
(117, 'ld (hl),l', 0, 0, 1),
(117, 'bit 6,l', 203, 0, 1),
(118, 'halt', 0, 0, 1),
(118, 'bit 6,(hl)', 203, 0, 1),
(119, 'ld (hl),a', 0, 0, 1),
(119, 'bit 6,a', 203, 0, 1),
(120, 'ld a,b', 0, 0, 1),
(120, 'bit 7,b', 203, 0, 1),
(120, 'in a,(c)', 237, 0, 1),
(121, 'ld a,c', 0, 0, 1),
(121, 'bit 7,c', 203, 0, 1),
(121, 'out (c),a', 237, 0, 1),
(122, 'ld a,d', 0, 0, 1),
(122, 'bit 7,d', 203, 0, 1),
(122, 'adc hl,sp', 237, 0, 1),
(123, 'ld a,e', 0, 0, 1),
(123, 'bit 7,e', 203, 0, 1),
(123, 'ld sp,(NN)', 237, 0, 1),
(124, 'ld a,h', 0, 0, 1),
(124, 'bit 7,h', 203, 0, 1),
(125, 'ld a,l', 0, 0, 1),
(125, 'bit 7,l', 203, 0, 1),
(126, 'ld a,(hl)', 0, 0, 1),
(126, 'bit 7,(hl)', 203, 0, 1),
(127, 'ld a,a', 0, 0, 1),
(127, 'bit 7,a', 203, 0, 1),
(128, 'add a,b', 0, 0, 1),
(128, 'res 0,b', 203, 0, 1),
(129, 'add a,c', 0, 0, 1),
(129, 'res 0,c', 203, 0, 1),
(130, 'add a,d', 0, 0, 1),
(130, 'res 0,d', 203, 0, 1),
(131, 'add a,e', 0, 0, 1),
(131, 'res 0,e', 203, 0, 1),
(132, 'res 0,h', 0, 0, 1),
(132, 'res 0,h', 203, 0, 1),
(133, 'add a,l', 0, 0, 1),
(133, 'res 0,l', 203, 0, 1),
(134, 'add a,(hl)', 0, 0, 1),
(134, 'res 0,(hl)', 203, 0, 1),
(135, 'add a,a', 0, 0, 1),
(135, 'res 0,a', 203, 0, 1),
(136, 'adc a,b', 0, 0, 1),
(136, 'res 1,b', 203, 0, 1),
(137, 'adc a,c', 0, 0, 1),
(137, 'res 1,c', 203, 0, 1),
(138, 'adc a,d', 0, 0, 1),
(138, 'res 1,d', 203, 0, 1),
(139, 'adc a,e', 0, 0, 1),
(139, 'res 1,e', 203, 0, 1),
(140, 'adc a,h', 0, 0, 1),
(140, 'res 1,h', 203, 0, 1),
(141, 'adc a,l', 0, 0, 1),
(141, 'res 1,l', 203, 0, 1),
(142, 'adc a,(hl)', 0, 0, 1),
(142, 'res 1,(hl)', 203, 0, 1),
(143, 'adc a,a', 0, 0, 1),
(143, 'res 1,a', 203, 0, 1),
(144, 'sub b', 0, 0, 1),
(144, 'res 2,b', 203, 0, 1),
(145, 'sub c', 0, 0, 1),
(145, 'res 2,c', 203, 0, 1),
(146, 'sub d', 0, 0, 1),
(146, 'res 2,d', 203, 0, 1),
(147, 'sub e', 0, 0, 1),
(147, 'res 2,e', 203, 0, 1),
(148, 'sub h', 0, 0, 1),
(148, 'res 2,h', 203, 0, 1),
(149, 'sub l', 0, 0, 1),
(149, 'res 2,l', 203, 0, 1),
(150, 'sub (hl)', 0, 0, 1),
(150, 'res 2,(hl)', 203, 0, 1),
(151, 'sub a', 0, 0, 1),
(151, 'res 2,a', 203, 0, 1),
(152, 'sbc a,b', 0, 0, 1),
(152, 'res 3,b', 203, 0, 1),
(153, 'sbc a,c', 0, 0, 1),
(153, 'res 3,c', 203, 0, 1),
(154, 'sbc a,d', 0, 0, 1),
(154, 'res 3,d', 203, 0, 1),
(155, 'sbc a,e', 0, 0, 1),
(155, 'res 3,e', 203, 0, 1),
(156, 'sbc a,h', 0, 0, 1),
(156, 'res 3,h', 203, 0, 1),
(157, 'sbc a,l', 0, 0, 1),
(157, 'res 3,l', 203, 0, 1),
(158, 'sbc a,(hl)', 0, 0, 1),
(158, 'res 3,(hl)', 203, 0, 1),
(159, 'sbc a,a', 0, 0, 1),
(159, 'res 3,a', 203, 0, 1),
(160, 'and b', 0, 0, 1),
(160, 'res 4,b', 203, 0, 1),
(160, 'ldi', 237, 0, 1),
(161, 'and c', 0, 0, 1),
(161, 'res 4,c', 203, 0, 1),
(161, 'cpi', 237, 0, 1),
(162, 'and d', 0, 0, 1),
(162, 'res 4,d', 203, 0, 1),
(162, 'ini', 237, 0, 1),
(163, 'and e', 0, 0, 1),
(163, 'res 4,e', 203, 0, 1),
(163, 'outi', 237, 0, 1),
(164, 'and h', 0, 0, 1),
(164, 'res 4,h', 203, 0, 1),
(165, 'and l', 0, 0, 1),
(165, 'res 4,l', 203, 0, 1),
(166, 'and (hl)', 0, 0, 1),
(166, 'res 4,(hl)', 203, 0, 1),
(167, 'and a', 0, 0, 1),
(167, 'res 4,a', 203, 0, 1),
(168, 'xor b', 0, 0, 1),
(168, 'res 5,b', 203, 0, 1),
(168, 'ldd', 237, 0, 1),
(169, 'xor c', 0, 0, 1),
(169, 'res 5,c', 203, 0, 1),
(169, 'cpd', 237, 0, 1),
(170, 'xor d', 0, 0, 1),
(170, 'res 5,d', 203, 0, 1),
(170, 'ind', 237, 0, 1),
(171, 'xor e', 0, 0, 1),
(171, 'res 5,e', 203, 0, 1),
(171, 'outd', 237, 0, 1),
(172, 'xor h', 0, 0, 1),
(172, 'res 5,h', 203, 0, 1),
(173, 'xor l', 0, 0, 1),
(173, 'res 5,l', 203, 0, 1),
(174, 'xor (hl)', 0, 0, 1),
(174, 'res 5,(hl)', 203, 0, 1),
(175, 'xor a', 0, 0, 1),
(175, 'res 5,a', 203, 0, 1),
(176, 'or b', 0, 0, 1),
(176, 'res 6,b', 203, 0, 1),
(176, 'ldir', 237, 0, 1),
(177, 'or c', 0, 0, 1),
(177, 'res 6,c', 203, 0, 1),
(177, 'cpir', 237, 0, 1),
(178, 'or d', 0, 0, 1),
(178, 'res 6,d', 203, 0, 1),
(178, 'inir', 237, 0, 1),
(179, 'or e', 0, 0, 1),
(179, 'res 6,e', 203, 0, 1),
(179, 'otir', 237, 0, 1),
(180, 'or h', 0, 0, 1),
(180, 'res 6,h', 203, 0, 1),
(181, 'or l', 0, 0, 1),
(181, 'res 6,l', 203, 0, 1),
(182, 'or (hl)', 0, 0, 1),
(182, 'res 6,(hl)', 203, 0, 1),
(183, 'or a', 0, 0, 1),
(183, 'res 6,a', 203, 0, 1),
(184, 'cp b', 0, 0, 1),
(184, 'res 7,b', 203, 0, 1),
(184, 'lddr', 237, 0, 1),
(185, 'cp c', 0, 0, 1),
(185, 'res 7,c', 203, 0, 1),
(185, 'cpdr', 237, 0, 1),
(186, 'cp d', 0, 0, 1),
(186, 'res 7,d', 203, 0, 1),
(186, 'indr', 237, 0, 1),
(187, 'cp e', 0, 0, 1),
(187, 'res 7,e', 203, 0, 1),
(187, 'otdr', 237, 0, 1),
(188, 'cp h', 0, 0, 1),
(188, 'res 7,h', 203, 0, 1),
(189, 'cp l', 0, 0, 1),
(189, 'res 7,l', 203, 0, 1),
(190, 'cp (hl)', 0, 0, 1),
(190, 'res 7,(hl)', 203, 0, 1),
(191, 'cp a', 0, 0, 1),
(191, 'res 7,a', 203, 0, 1),
(192, 'ret nz', 0, 0, 1),
(192, 'set 0,b', 203, 0, 1),
(193, 'pop bc', 0, 0, 1),
(193, 'set 0,c', 203, 0, 1),
(194, 'jp nz,NN', 0, 0, 1),
(194, 'set 0,d', 203, 0, 1),
(195, 'jp NN', 0, 0, 1),
(195, 'set 0,e', 203, 0, 1),
(196, 'call nz,NN', 0, 0, 1),
(196, 'set 0,h', 203, 0, 1),
(197, 'push bc', 0, 0, 1),
(197, 'set 0,l', 203, 0, 1),
(198, 'add a,N', 0, 0, 1),
(198, 'set 0,(hl)', 203, 0, 1),
(199, 'rst 0', 0, 0, 1),
(199, 'set 0,a', 203, 0, 1),
(200, 'ret z', 0, 0, 1),
(200, 'set 1,b', 203, 0, 1),
(201, 'ret', 0, 0, 1),
(201, 'set 1,c', 203, 0, 1),
(202, 'jp z,NN', 0, 0, 1),
(202, 'set 1,d', 203, 0, 1),
(203, 'set 1,e', 203, 0, 1),
(204, 'call z,NN', 0, 0, 1),
(204, 'set 1,h', 203, 0, 1),
(205, 'call NN', 0, 0, 1),
(205, 'set 1,l', 203, 0, 1),
(206, 'adc a,N', 0, 0, 1),
(206, 'set 1,(hl)', 203, 0, 1),
(207, 'rst 8', 0, 0, 1),
(207, 'set 1,a', 203, 0, 1),
(208, 'ret nc', 0, 0, 1),
(208, 'set 2,b', 203, 0, 1),
(209, 'pop de', 0, 0, 1),
(209, 'set 2,c', 203, 0, 1),
(210, 'jp nc,NN', 0, 0, 1),
(210, 'set 2,d', 203, 0, 1),
(211, 'out N,a', 0, 0, 1),
(211, 'set 2,e', 203, 0, 1),
(212, 'call nc,NN', 0, 0, 1),
(212, 'set 2,h', 203, 0, 1),
(213, 'push de', 0, 0, 1),
(213, 'set 2,l', 203, 0, 1),
(214, 'sub N', 0, 0, 1),
(214, 'set 2,(hl)', 203, 0, 1),
(215, 'rst 16', 0, 0, 1),
(215, 'set 2,a', 203, 0, 1),
(216, 'ret c', 0, 0, 1),
(216, 'set 3,b', 203, 0, 1),
(217, 'exx', 0, 0, 1),
(217, 'set 3,c', 203, 0, 1),
(218, 'jp c,NN', 0, 0, 1),
(218, 'set 3,d', 203, 0, 1),
(219, 'in a,N', 0, 0, 1),
(219, 'set 3,e', 203, 0, 1),
(220, 'call c,NN', 0, 0, 1),
(220, 'set 3,h', 203, 0, 1),
(221, 'set 3,l', 203, 0, 1),
(222, 'sbc a,N', 0, 0, 1),
(222, 'set 3,(hl)', 203, 0, 1),
(223, 'rst 24', 0, 0, 1),
(223, 'set 3,a', 203, 0, 1),
(224, 'ret po', 0, 0, 1),
(224, 'set 4,b', 203, 0, 1),
(225, 'pop hl', 0, 0, 1),
(225, 'set 4,c', 203, 0, 1),
(226, 'jp po,NN', 0, 0, 1),
(226, 'set 4,d', 203, 0, 1),
(227, 'ex (sp),hl', 0, 0, 1),
(227, 'set 4,e', 203, 0, 1),
(228, 'call po,NN', 0, 0, 1),
(228, 'set 4,h', 203, 0, 1),
(229, 'push hl', 0, 0, 1),
(229, 'set 4,l', 203, 0, 1),
(230, 'and N', 0, 0, 1),
(230, 'set 4,(hl)', 203, 0, 1),
(231, 'rst 32', 0, 0, 1),
(231, 'set 4,a', 203, 0, 1),
(232, 'ret pe', 0, 0, 1),
(232, 'set 5,b', 203, 0, 1),
(233, 'jp (hl)', 0, 0, 1),
(233, 'set 5,c', 203, 0, 1),
(234, 'jp pe,NN', 0, 0, 1),
(234, 'set 5,d', 203, 0, 1),
(235, 'ex de,hl', 0, 0, 1),
(235, 'set 5,e', 203, 0, 1),
(236, 'call pe,NN', 0, 0, 1),
(236, 'set 5,h', 203, 0, 1),
(237, 'set 5,l', 203, 0, 1),
(238, 'xor N', 0, 0, 1),
(238, 'set 5,(hl)', 203, 0, 1),
(239, 'rst 40', 0, 0, 1),
(239, 'set 5,a', 203, 0, 1),
(240, 'ret p', 0, 0, 1),
(240, 'set 6,b', 203, 0, 1),
(241, 'pop af', 0, 0, 1),
(241, 'set 6,c', 203, 0, 1),
(242, 'jp p,NN', 0, 0, 1),
(242, 'set 6,d', 203, 0, 1),
(243, 'di', 0, 0, 1),
(243, 'set 6,e', 203, 0, 1),
(244, 'call p,NN', 0, 0, 1),
(244, 'set 6,h', 203, 0, 1),
(245, 'push af', 0, 0, 1),
(245, 'set 6,l', 203, 0, 1),
(246, 'or N', 0, 0, 1),
(246, 'set 6,(hl)', 203, 0, 1),
(247, 'rst 48', 0, 0, 1),
(247, 'set 6,a', 203, 0, 1),
(248, 'ret m', 0, 0, 1),
(248, 'set 7,b', 203, 0, 1),
(249, 'ld sp,hl', 0, 0, 1),
(249, 'set 7,c', 203, 0, 1),
(250, 'jp m,NN', 0, 0, 1),
(250, 'set 7,d', 203, 0, 1),
(251, 'ei', 0, 0, 1),
(251, 'set 7,e', 203, 0, 1),
(252, 'call m,NN', 0, 0, 1),
(252, 'set 7,h', 203, 0, 1),
(253, 'set 7,l', 203, 0, 1),
(254, 'cp N', 0, 0, 1),
(254, 'set 7,(hl)', 203, 0, 1),
(255, 'rst 56', 0, 0, 1),
(255, 'set 7,a', 203, 0, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
