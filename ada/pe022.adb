--  this computes projecteuler.net problem 022

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors; use Ada.Containers;
with Ada.Containers.Generic_Sort;

procedure pe022 is

MAXNAMES: constant Integer := 50000;

package String_Vec is new Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Unbounded_String);
names  : String_Vec.Vector := String_Vec.To_Vector(1);

-- using the names variable inside these function bodies looks ... different
-- but they work and http://www.ada-auth.org/standards/12rat/html/Rat12-8-7.html

function SV_Before(L, R: Natural) return Boolean is 
begin
  return names(L) < names(R);
end SV_Before;

procedure SV_Swap(L, R: in Natural) is
tmp_string : Unbounded_String := To_Unbounded_String("");
begin
   tmp_string := names(L);
   names(L) := names(R);
   names(R) := tmp_string;
end SV_Swap;

procedure SV_G_Sort is new Ada.Containers.Generic_Sort (Positive, Before => SV_Before, Swap => SV_Swap);

function letter_count(word: Unbounded_String) return Integer is
  count : Integer := 0;
  iletter : Integer := 0;
  letter  : Character;

begin
  for i in 1 .. Length(word) loop
    letter := Element(word, i);
    iletter := CHARACTER'POS(letter) - 64;
    count := count + iletter;
  end loop;

  return count;
end letter_count;

function text_file_to_string_vector(in_file : File_Type) return String_Vec.Vector is
  One_Char : CHARACTER;
  building_name: Boolean := false;
  name_string: Unbounded_String := To_Unbounded_String("");
  names : String_Vec.Vector;

begin
             -- Read and display but search for End of lines
  loop       -- using a look ahead method
     exit when End_Of_File(in_file);
     Get(in_file, One_Char);
     if One_Char = '"' then
       if building_name then
         names.Append(name_string);
         name_string := To_Unbounded_String("");
       end if;
       building_name := not building_name;
     else
       if building_name then
         Append(name_string, One_Char);
       end if;
     end if;
  end loop;
  return names;
end text_file_to_string_vector;

Input_File: File_Type;
names_length  : Integer := 0;
count: Integer := 0;
index : Integer := 1;

begin
  Ada.Text_IO.Open (File => Input_File, Mode => In_File, Name => "../names.txt");
  names := text_file_to_string_vector(Input_File);
  Ada.Text_IO.Close (File => Input_File); 

  names_length := Integer(names.Length);
  SV_G_Sort(First => 1, Last => names_length);
  for n of names loop
    if To_String(n)'Length /= 0 then
      count := count + (letter_count(n) * index);
    end if;
    index := index + 1;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(count), Side => Both));
end pe022;
