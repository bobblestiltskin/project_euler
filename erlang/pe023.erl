-module(pe023).
-export([start/0]).

max() -> 28123.

start() ->
  pe023(max()).
  
pe023(N) ->
  L = abundant_list([], 1, N),
  S = nested_sum(L, L, [], N),
  Sum = sum_lists(S, 0, 0),
  io:format("~w~n", [Sum]).

sum_lists([], _I, Sum) ->
  Sum;

sum_lists([H|T], I, Sum) ->
  sum_lists(T, H, I, Sum).

sum_lists(L, H, I, Sum) when H =:= I ->
  sum_lists(L, H + 1, Sum);

sum_lists(L, H, I, Sum) ->
  sum_lists(L, H, I + 1, I + Sum).

nested_sum([], _L, S, _N) ->
  lists:usort(S);

nested_sum([H|T], L, S, N) ->
  nested_sum(H, T, L, L, S, N).

nested_sum(H, T, L, [H1|L1], S, N) ->
  if
    (H + H1) < N ->
      nested_sum(H, T, L, L1, [H + H1|S], N);
    true ->
      nested_sum(T, L, S, N)
  end.
  
abundant_list(L, N, M) when N =:= M ->
  lists:reverse(L);

abundant_list(L, N, M) ->
  X = sum_factors(2, N, 1),
  if
    X > N ->
      abundant_list([N | L], N + 1, M);
    true ->
      abundant_list(L, N + 1, M)
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
