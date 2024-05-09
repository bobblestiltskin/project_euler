--  this computes projecteuler.net problem 024

--  9! is 362880 so after all the 10 digit numbers which 
--  start with 0 or 1 we will have passed 725760 of the 
--  combinations. The millionth combination will start
--  with a 2, since we need to count 274240 more combinations
--  after 2000000000.
--
--  8! is 40320, so there are that many 10 digit combinations starting 20.
--  The combination starting 22 is invalid (since the numerals must be
--  distinct), so we could count 6 sets of combinations of 40320 up to
--  2700000000 and then we would have seen 725760+241920 leaving 32320 to
--  find.
--
--  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
--  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe024 is

start: Long_Integer := 2780000000;
nend: Long_Integer := 9876543210;
count: Integer := 725760 + 241920 + 30240;
i: Long_Integer := start - 1;

digit_string: String (1 .. 10);

begin
  while i <= nend loop
    i := i + 1;
    digit_string := Ada.Strings.Fixed.Trim(Long_Integer'Image(i), Side => Both);
    if (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "0") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "1") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "2") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "3") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "4") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "5") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "6") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "7") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "8") /= 0)
    and (Ada.Strings.Fixed.Index (Source => digit_string, Pattern => "9") /= 0) then
      count := count + 1;
      if count = 1000000 then
        exit;
      end if;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Long_Integer'Image(i), Side => Both));
end pe024;
