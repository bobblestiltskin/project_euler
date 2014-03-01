-module(pe024).
-export([start/0]).

%  9! is 362880 so after all the 10 digit numbers which 
%  start with 0 or 1 we will have passed 725760 of the 
%  combinations. The millionth combination will start
%  with a 2, since we need to count 274240 more combinations
%  after 2000000000.
%
%  8! is 40320, so there are that many 10 digit combinations starting 20.
%  The combination starting 22 is invalid (since the numerals must be
%  distinct), so we could count 6 sets of combinations of 40320 up to
%  2700000000 and then we would have seen 725760+241920 leaving 32320 to
%  find.
%
%  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
%  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

startcount() -> 997920.
startnum() -> 2780000000.
digitnum() -> 9876543210.

num2set(N) ->
  sets:from_list(integer_to_list(N)).

digit_set() -> 
  sets:from_list(integer_to_list(digitnum())).

start() ->
  pe024(startnum(), startcount()).
  
pe024(N, Result) when Result =:= 1000000 ->
  io:format("~w~n", [N - 1]);
    
pe024(N, Result) ->
  SizeSubtract = sets:size(sets:subtract(digit_set(), num2set(N))),
  if
    SizeSubtract =:= 0 ->
%  io:format("N is ~w, Result is ~w, SS is ~w~n", [N, Result, SizeSubtract]),
      pe024(N + 1, Result + 1);
    true ->
      pe024(N + 1, Result)
  end.
