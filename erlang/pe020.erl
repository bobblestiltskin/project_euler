-module(pe020).
-export([start/0]).

max() -> 100.

start() ->
  pe020(max()).
  
pe020(N) ->
  X = fact(N),
  Y = sum_list(integer_to_list(X), 0),
  io:format("~w~n", [Y]).

sum_list([], S) ->
  S;

sum_list([H|T], S) ->
  sum_list(T, H + S - 48).

fact(1) ->
  1;

fact(N) ->
  N * fact(N -1).
