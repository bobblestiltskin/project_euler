with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe004 is

   function Reverse_It (Item : String) return String is
      Result : String (Item'Range);
   begin
      for I in Item'range loop
         Result(Result'Last - I + Item'First) := Item(I);
      end loop;
      return Result;
   end Reverse_It;

max3 : Integer := 999;
min3 : Integer := 0;
maxp : Integer := 3;

mini : Integer := min3;
minj : Integer := min3;
maxj : Integer := max3;

product : Integer;

package S  renames Ada.Strings;
package SF renames Ada.Strings.Fixed;

product_string : String(1 .. 6);
reverse_string : String(1 .. 6);

begin
  for i in reverse mini + 1 .. max3 loop
    for j in reverse minj + 1 .. maxj loop
      product := i * j;

      SF.Move (
        Source  => Integer'Image(product),
        Target  => product_string,
        Drop    => S.Left,
        Justify => S.Right,
        Pad     => S.Space);

      SF.Move (
        Source  => Reverse_It(product_string),
        Target  => reverse_string,
        Drop    => S.Right,
        Justify => S.Left,
        Pad     => S.Space);

      if ((product_string = reverse_string) and (product > maxp)) then
        maxp := product;
      end if;

    end loop;
    maxj := i;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(maxp), Side => Both));
end pe004;
