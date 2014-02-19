-module(pe021).
-export([start/0]).

max() -> 10000.

start() ->
  pe021(max()).
  
pe021(N) ->
  S = pe021([], 1, 0, N),
  io:format("~w~n", [S]).

pe021(_L, N, S, M) when N =:= M ->
  S;

pe021(L, N, S, M) ->
  X = sum_factors(2, N, 1),
  if
    X < N ->
      I = lists:nth(N - X, L),
      if 
        I =:= N ->
          pe021([X | L], N + 1, X + N + S, M);
        true -> 
          pe021([X | L], N + 1, S, M)
      end;
    true ->
      pe021([X | L], N + 1, S, M)
  end.

sum_factors(I, N, S) when (I * I) > N ->
  S;

sum_factors(I, N, S) ->
  Q = N div I,
  R = N rem I,
  if
    R =:= 0 ->
      if
        I =:= Q ->
          sum_factors(I + 1, N, S + Q);
        true ->
          sum_factors(I + 1, N, S + Q + I)
      end;
    true ->
      sum_factors(I + 1, N, S)
  end.
