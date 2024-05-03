with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

procedure pe017 is

onek : constant String := "one thousand";
oneklen : constant Integer := 12;
hcount : constant Integer := 7; -- "hundred" 
handcount : constant Integer := 10; -- "hundred and "

type String_Array is array (Positive range <>) of Unbounded_String;

units:  constant String_Array := (To_Unbounded_String("one"), To_Unbounded_String("two"), To_Unbounded_String("three"), To_Unbounded_String("four"), To_Unbounded_String("five"), To_Unbounded_String("six"), To_Unbounded_String("seven"), To_Unbounded_String("eight"), To_Unbounded_String("nine"));

tens:  constant String_Array := (To_Unbounded_String("ten"), To_Unbounded_String("eleven"), To_Unbounded_String("twelve"), To_Unbounded_String("thirteen"), To_Unbounded_String("fourteen"), To_Unbounded_String("fifteen"), To_Unbounded_String("sixteen"), To_Unbounded_String("seventeen"), To_Unbounded_String("eighteen"), To_Unbounded_String("nineteen"), To_Unbounded_String("twenty"), To_Unbounded_String("twentyone"), To_Unbounded_String("twentytwo"), To_Unbounded_String("twentythree"), To_Unbounded_String("twentyfour"), To_Unbounded_String("twentyfive"), To_Unbounded_String("twentysix"), To_Unbounded_String("twentyseven"), To_Unbounded_String("twentyeight"), To_Unbounded_String("twentynine"), To_Unbounded_String("thirty"), To_Unbounded_String("thirtyone"), To_Unbounded_String("thirtytwo"), To_Unbounded_String("thirtythree"), To_Unbounded_String("thirtyfour"), To_Unbounded_String("thirtyfive"), To_Unbounded_String("thirtysix"), To_Unbounded_String("thirtyseven"), To_Unbounded_String("thirtyeight"), To_Unbounded_String("thirtynine"), To_Unbounded_String("forty"), To_Unbounded_String("fortyone"), To_Unbounded_String("fortytwo"), To_Unbounded_String("fortythree"), To_Unbounded_String("fortyfour"), To_Unbounded_String("fortyfive"), To_Unbounded_String("fortysix"), To_Unbounded_String("fortyseven"), To_Unbounded_String("fortyeight"), To_Unbounded_String("fortynine"), To_Unbounded_String("fifty"), To_Unbounded_String("fiftyone"), To_Unbounded_String("fiftytwo"), To_Unbounded_String("fiftythree"), To_Unbounded_String("fiftyfour"), To_Unbounded_String("fiftyfive"), To_Unbounded_String("fiftysix"), To_Unbounded_String("fiftyseven"), To_Unbounded_String("fiftyeight"), To_Unbounded_String("fiftynine"), To_Unbounded_String("sixty"), To_Unbounded_String("sixtyone"), To_Unbounded_String("sixtytwo"), To_Unbounded_String("sixtythree"), To_Unbounded_String("sixtyfour"), To_Unbounded_String("sixtyfive"), To_Unbounded_String("sixtysix"), To_Unbounded_String("sixtyseven"), To_Unbounded_String("sixtyeight"), To_Unbounded_String("sixtynine"), To_Unbounded_String("seventy"), To_Unbounded_String("seventyone"), To_Unbounded_String("seventytwo"), To_Unbounded_String("seventythree"), To_Unbounded_String("seventyfour"), To_Unbounded_String("seventyfive"), To_Unbounded_String("seventysix"), To_Unbounded_String("seventyseven"), To_Unbounded_String("seventyeight"), To_Unbounded_String("seventynine"), To_Unbounded_String("eighty"), To_Unbounded_String("eightyone"), To_Unbounded_String("eightytwo"), To_Unbounded_String("eightythree"), To_Unbounded_String("eightyfour"), To_Unbounded_String("eightyfive"), To_Unbounded_String("eightysix"), To_Unbounded_String("eightyseven"), To_Unbounded_String("eightyeight"), To_Unbounded_String("eightynine"), To_Unbounded_String("ninety"), To_Unbounded_String("ninetyone"), To_Unbounded_String("ninetytwo"), To_Unbounded_String("ninetythree"), To_Unbounded_String("ninetyfour"), To_Unbounded_String("ninetyfive"), To_Unbounded_String("ninetysix"), To_Unbounded_String("ninetyseven"), To_Unbounded_String("ninetyeight"), To_Unbounded_String("ninetynine"));

count: Integer;
ilength: Integer;
jlength: Integer;

begin
  count := 0;
  for unit of units loop
    ilength := Ada.Strings.Unbounded.Length (Source => unit);
    count := count + ilength;
  end loop;
  for ten of tens loop
    ilength := Ada.Strings.Unbounded.Length (Source => ten);
    count := count + ilength;
  end loop;
  for unit of units loop
    ilength := Ada.Strings.Unbounded.Length (Source => unit);
    count := count + ilength + hcount;
    for unit of units loop
      jlength := Ada.Strings.Unbounded.Length (Source => unit);
      count := count + ilength + handcount + jlength;
    end loop;
    for ten of tens loop
      ilength := Ada.Strings.Unbounded.Length (Source => ten);
      count := count + ilength + handcount + jlength;
    end loop;
  end loop;
  count := count + oneklen - 1; -- contains a space
  Put (Ada.Strings.Fixed.Trim(Integer'Image(count), Side => Both));
end pe017;
