# <p>If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.</p>
# <p>If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used? </p>
# <br /><p class="note"><b>NOTE:</b> Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.</p>

defmodule ProjectEuler do
  def pe017() do
    units = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    tens = ["ten", "eleven", "twelve", "thirteen",
    "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
    "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour",
    "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine",
    "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour",
    "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine",
    "forty", "fortyone", "fortytwo", "fortythree", "fortyfour",
    "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine",
    "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour",
    "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine",
    "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour",
    "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine",
    "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour",
    "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine",
    "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour",
    "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine",
    "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour",
    "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"]

    one_to_99 = sum_list(units, 0) + sum_list(tens, 0)
    String.length("one") + String.length("thousand") + sum_hundreds(units, "hundred", one_to_99, 0) + one_to_99
  end
   
  defp sum_list([], count) do
    count
  end

  defp sum_list(units, count) do
    [head | tail] = units
    sum_list(tail, count + String.length(head))
  end

  defp sum_hundreds([], _, _, count) do
    count
  end

  defp sum_hundreds(units, hundred, one_to_99, count) do
    [head | tail] = units
    unit_len = String.length(head)
    sum_hundreds(tail, hundred, one_to_99, count + ((unit_len + String.length(hundred)) * 100) + (String.length("and") * 99) + one_to_99)
  end
end

IO.puts(ProjectEuler.pe017())
