-module(pe005).
-export([start/0]).

maxv() -> 20.

start() ->
  pe005(1, maxv(), 1).

pe005(I, Max, LCM) when I > Max ->
  io:format("~w~n", [LCM]);

pe005(I, Max, LCM) ->
  IsPrime = is_prime(I),
  if
    IsPrime ->
      pe005(I + 1, Max, LCM * max_base_m_lt_n(I, 1, Max));
    true -> 
      pe005(I + 1, Max, LCM)
  end.

max_base_m_lt_n(M, Last, N) when (M * Last) > N ->
  Last;

max_base_m_lt_n(M, Last, N) ->
  max_base_m_lt_n(M, (M * Last), N).

is_prime(Number) when Number == 1; Number == 0  ->
  false;

is_prime(Number) when Number == 2 ->
  true;

is_prime(Number) when Number rem 2 == 0 ->
  false;

is_prime(Number) ->
  prime_test(3, Number).

prime_test(Div, Number) when (Div * Div) > Number ->
  true;

prime_test(Div, Number) when Number rem Div == 0 ->
  false;

prime_test(Div, Number) ->
  prime_test(Div + 2, Number).
