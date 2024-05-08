--  this computes projecteuler.net problem 022

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors; use Ada.Containers;
with Ada.Containers.Generic_Sort;

procedure pe022 is

MAXNAMES: constant Integer := 50;

type Unbounded_String_Array is array (Positive range <>) of Unbounded_String;

namesa:  Unbounded_String_Array(1 .. MAXNAMES) := (others => To_Unbounded_String(""));
tmp_string : Unbounded_String := To_Unbounded_String("");

Input_File: File_Type;

package String_Vec is new Ada.Containers.Vectors (Index_Type   => Positive, Element_Type => Unbounded_String);
names  : String_Vec.Vector := String_Vec.To_Vector(1);
names_length  : Integer := 0;

function US_Before(L, R: Natural) return Boolean is 
begin
  return namesa(L) < namesa(R);
end US_Before;

procedure US_Swap(L, R: in Natural) is
begin
   tmp_string := namesa(L);
   namesa(L) := namesa(R);
   namesa(R) := tmp_string;
end US_Swap;

procedure US_G_Sort is new Ada.Containers.Generic_Sort (Positive, Before => US_Before, Swap => US_Swap);

function To_Unbounded_String_Array(V: String_Vec.Vector; A: IN OUT Unbounded_String_Array) return Unbounded_String_Array is
  vlen: Natural := Natural(V.Length);
begin
      Put_Line (Integer'Image(vlen));
    for I in 1 .. vlen loop
        A(I) := V.Element(I);
      Put_Line (To_String(A(I)));
    end loop;
    return A;
end To_Unbounded_String_Array;

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

begin
  Ada.Text_IO.Open (File => Input_File, Mode => In_File, Name => "../names.txt");
  names := text_file_to_string_vector(Input_File);
  Ada.Text_IO.Close (File => Input_File); 

  namesa := To_Unbounded_String_Array(names, namesa);
  names_length := Integer(names.Length);
  Put_Line (Integer'Image(names_length));
--  namesa.US_G_Sort(First => 1, Last => names_length);
  US_G_Sort(First => 1, Last => names_length);
--  for n of names loop
  for n of namesa loop
    if To_String(n)'Length /= 0 then
    Put_Line (To_String(n));
    end if;
  end loop;
end pe022;
--  names = []
--  start = 1
--  name = name_string[start:len(name_string) - 1]
--  names.append(name)
--  names.sort()
--
--  total = 0
--  for i in range(len(names)):
--    letters = 0
--    for j in range(len(names[i])):
--      letters += ord(names[i][j]) - 64
--    total += letters * (i+1)
--
--  print(total)
--  return 0
