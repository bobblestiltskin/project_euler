-module(pe010).
-export([start/0]).

maxv() -> 2000000.

start() ->
  pe010(maxv(), 2, 0).

pe010(MaxV, MaxP, Sum) when (MaxP >= MaxV) ->
  io:format("~w~n", [Sum]);

pe010(MaxV, MaxP, Sum) ->
  pe010(MaxV, next_prime(MaxP), Sum + MaxP).

next_prime(Number) when (Number < 2) ->
  2;

next_prime(Number) when (Number == 2) ->
  3;

next_prime(Number) when (Number rem 2 == 0) ->
  next_prime(Number - 1);

next_prime(Number) ->
  Try = Number + 2,
  IsPrime = is_prime(Try),
  if
    IsPrime ->
      Try;
    true ->
      next_prime(Try)
  end.

is_prime(Number) when ((Number == 1) or (Number == 0))  ->
  false;

is_prime(Number) when (Number == 2) ->
  true;

is_prime(Number) when (Number rem 2 == 0) ->
  false;

is_prime(Number) ->
  prime_test(3, Number).

prime_test(Div, Number) when ((Div * Div) > Number) ->
  true;

prime_test(Div, Number) when (Number rem Div == 0) ->
  false;

prime_test(Div, Number) ->
  prime_test(Div + 2, Number).
