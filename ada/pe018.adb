--  this computes projecteuler.net problem 018

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Containers.Vectors;

procedure pe018 is

MAX   : constant Integer := 1000;

package One_D_Vec is new Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Integer);

package Vector_Vector is new Ada.Containers.Vectors (Index_Type => Positive, Element_Type => One_D_Vec.Vector, "=" => One_D_Vec."=");

row1  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 75, Length => 1);
row2  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 95, Length => 1);
row3  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 17, Length => 1);
row4  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 18, Length => 1);
row5  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 20, Length => 1);
row6  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 19, Length => 1);
row7  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 88, Length => 1);
row8  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 99, Length => 1);
row9  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 41, Length => 1);
row10  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 41, Length => 1);
row11  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 53, Length => 1);
row12  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 70, Length => 1);
row13  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 91, Length => 1);
row14  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 63, Length => 1);
row15  : One_D_Vec.Vector := One_D_Vec.To_Vector(New_Item => 4, Length => 1);

stepped_vector: Vector_Vector.Vector := Vector_Vector.To_Vector(New_Item => row1, Length => 1);

begin
  row2.Append(64);
  stepped_vector.Append(row2);

  row3.Append(47);
  row3.Append(82);
  stepped_vector.Append(row3);

--row4  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(18, 35, 87, 10);
  row4.Append(35);
  row4.Append(87);
  row4.Append(10);
  stepped_vector.Append(row4);

--row5  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(20,  4, 82, 47, 65);
  row5.Append(4);
  row5.Append(82);
  row5.Append(47);
  row5.Append(65);
  stepped_vector.Append(row5);

--row6  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(19,  1, 23, 75,  3, 34);
  row6.Append(1);
  row6.Append(23);
  row6.Append(75);
  row6.Append(3);
  row6.Append(34);
  stepped_vector.Append(row6);

--row7  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(88,  2, 77, 73,  7, 63, 67);
  row7.Append(2);
  row7.Append(77);
  row7.Append(73);
  row7.Append(7);
  row7.Append(63);
  row7.Append(67);
  stepped_vector.Append(row7);

--row8  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(99, 65,  4, 28,  6, 16, 70, 92);
  row8.Append(65);
  row8.Append(4);
  row8.Append(28);
  row8.Append(6);
  row8.Append(16);
  row8.Append(70);
  row8.Append(92);
  stepped_vector.Append(row8);

--row9  : constant One_D_Vec.Vector := One_D_Vec.To_Vector(41, 41, 26, 56, 83, 40, 80, 70, 33);
  row9.Append(41);
  row9.Append(26);
  row9.Append(56);
  row9.Append(83);
  row9.Append(40);
  row9.Append(80);
  row9.Append(70);
  row9.Append(33);
  stepped_vector.Append(row9);

--row10 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(41, 48, 72, 33, 47, 32, 37, 16, 94, 29);
  row10.Append(48);
  row10.Append(72);
  row10.Append(33);
  row10.Append(47);
  row10.Append(32);
  row10.Append(37);
  row10.Append(16);
  row10.Append(94);
  row10.Append(29);
  stepped_vector.Append(row10);

--row11 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14);
  row11.Append(71);
  row11.Append(44);
  row11.Append(65);
  row11.Append(25);
  row11.Append(43);
  row11.Append(91);
  row11.Append(52);
  row11.Append(97);
  row11.Append(51);
  row11.Append(14);
  stepped_vector.Append(row11);

--row12 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57);
  row12.Append(11);
  row12.Append(33);
  row12.Append(28);
  row12.Append(77);
  row12.Append(73);
  row12.Append(17);
  row12.Append(78);
  row12.Append(39);
  row12.Append(68);
  row12.Append(17);
  row12.Append(57);
  stepped_vector.Append(row12);

--row13 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48);
  row13.Append(71);
  row13.Append(52);
  row13.Append(38);
  row13.Append(17);
  row13.Append(14);
  row13.Append(91);
  row13.Append(43);
  row13.Append(58);
  row13.Append(50);
  row13.Append(27);
  row13.Append(29);
  row13.Append(48);
  stepped_vector.Append(row13);

--row14 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31);
  row14.Append(66);
  row14.Append(4);
  row14.Append(68);
  row14.Append(89);
  row14.Append(53);
  row14.Append(67);
  row14.Append(30);
  row14.Append(73);
  row14.Append(16);
  row14.Append(69);
  row14.Append(87);
  row14.Append(40);
  row14.Append(31);
  stepped_vector.Append(row14);

--row15 : constant One_D_Vec.Vector := One_D_Vec.To_Vector(4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23);
  row15.Append(62);
  row15.Append(98);
  row15.Append(27);
  row15.Append(23);
  row15.Append(9);
  row15.Append(70);
  row15.Append(98);
  row15.Append(73);
  row15.Append(93);
  row15.Append(38);
  row15.Append(53);
  row15.Append(60);
  row15.Append(4);
  row15.Append(23);
  stepped_vector.Append(row15);

  for i in reverse 2 .. 15 loop
    for j in 1 .. i - 1 loop
      stepped_vector(i-1)(j) := stepped_vector(i-1)(j) + Integer'Max(stepped_vector(i)(j), stepped_vector(i)(j+1));
    end loop;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(stepped_vector(1)(1)), Side => Both));
end pe018;
