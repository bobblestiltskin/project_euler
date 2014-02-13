-module(pe017).
-export([start/0]).

thoucount() -> 11. % "one thousand"
hcount() -> 7. % "hundred" 
handcount() -> 10. % "hundred and "
units() -> ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"].
tens() -> ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty", "twentyone", "twentytwo", "twentythree", "twentyfour", "twentyfive", "twentysix", "twentyseven", "twentyeight", "twentynine", "thirty", "thirtyone", "thirtytwo", "thirtythree", "thirtyfour", "thirtyfive", "thirtysix", "thirtyseven", "thirtyeight", "thirtynine", "forty", "fortyone", "fortytwo", "fortythree", "fortyfour", "fortyfive", "fortysix", "fortyseven", "fortyeight", "fortynine", "fifty", "fiftyone", "fiftytwo", "fiftythree", "fiftyfour", "fiftyfive", "fiftysix", "fiftyseven", "fiftyeight", "fiftynine", "sixty", "sixtyone", "sixtytwo", "sixtythree", "sixtyfour", "sixtyfive", "sixtysix", "sixtyseven", "sixtyeight", "sixtynine", "seventy", "seventyone", "seventytwo", "seventythree", "seventyfour", "seventyfive", "seventysix", "seventyseven", "seventyeight", "seventynine", "eighty", "eightyone", "eightytwo", "eightythree", "eightyfour", "eightyfive", "eightysix", "eightyseven", "eightyeight", "eightynine", "ninety", "ninetyone", "ninetytwo", "ninetythree", "ninetyfour", "ninetyfive", "ninetysix", "ninetyseven", "ninetyeight", "ninetynine"].

start() ->
  UC = lcount(units(), 0),
  TC = lcount(tens(), 0),
  HC = clcount(units(), hcount(), 0),
  HAUC = clucount(units(), handcount(), 0),
  HATC = clucount(tens(), handcount(), 0),
  io:format("~w~n", [thoucount()+HATC+HAUC+HC+TC+UC]).

lcount([], Result) ->
  Result;
  
lcount([H|T], Result) ->
  lcount(T, length(H) + Result).

clcount([], _C, Result) ->
  Result;
  
clcount([H|T], C, Result) ->
  clcount(T, C, length(H) + C + Result).

clucount([], _C, Result) ->
  Result;
  
% need to find out how to pass through 2 lists and loop over them nested
% don't really like to hardcode units() here...

clucount([H|T], C, Result) ->
  X = clcount(units(), length(H) + C, 0),
  clucount(T, C, X + Result).
