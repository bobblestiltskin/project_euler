-module(pe012).
-export([start/0]).

max() -> 500.

start() ->
  pe012(max(), 0, 0, 0).
  
pe012(Max, Len, _I, Total) when (Len > Max) ->
  io:format("~w~n", [Total]);
    
pe012(Max, _Len, I, Total) ->
  Next = Total + I,
  Result = sqrt_factors(0, Next, 0),
  pe012(Max, Result, I + 1, Next).
    
sqrt_factors(I, N, NF) ->
  if
    ((I * I) =:= N) ->
      (2 * NF) + 1;
    ((I * I) > N) ->
      (2 * NF);
    (N rem I =:= 0) ->
      sqrt_factors(I + 1, N, NF + 1);
    true ->
      sqrt_factors(I + 1, N, NF)
  end.
