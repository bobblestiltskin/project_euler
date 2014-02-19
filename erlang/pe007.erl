-module(pe007).
-export([start/0]).

maxv() -> 10001.

start() ->
  pe007(1, maxv(), 2).

pe007(I, MaxV, MaxP) when I =:= MaxV ->
  io:format("~w~n", [MaxP]);

pe007(I, MaxV, MaxP) ->
  pe007(I + 1, MaxV, next_prime(MaxP)).

next_prime(Number) when Number < 2 ->
  2;

next_prime(Number) when Number =:= 2 ->
  3;

next_prime(Number) when Number rem 2 =:= 0 ->
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

is_prime(Number) when Number =:= 1; Number =:= 0 ->
  false;

is_prime(Number) when Number =:= 2 ->
  true;

is_prime(Number) when Number rem 2 =:= 0 ->
  false;

is_prime(Number) ->
  prime_test(3, Number).

prime_test(Div, Number) when (Div * Div) > Number ->
  true;

prime_test(Div, Number) when Number rem Div =:= 0 ->
  false;

prime_test(Div, Number) ->
  prime_test(Div + 2, Number).
