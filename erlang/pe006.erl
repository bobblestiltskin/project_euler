-module(pe006).
-export([start/0]).

maxv() -> 100.

start() ->
  pe006(1, maxv()).

pe006(I, Max) ->
  Sum_sq = sum_sq(I, Max, 0),
  Sq_sum = sq_sum(I, Max),
  io:format("~w~n", [abs(Sq_sum - Sum_sq)]).

ap_sum(Min, Max) ->
  ((Max + Min) * ((Max - Min) + 1)) div 2.

sq_sum(Min, Max) ->
  Sum = ap_sum(Min, Max),
  Sum * Sum.

sum_sq(I, Max, Sum) when I > Max ->
  Sum;

sum_sq(I, Max, Sum) ->
  sum_sq(I + 1, Max, Sum + (I * I)).

