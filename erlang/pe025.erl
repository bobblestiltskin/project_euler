-module(pe025).
-export([start/0]).

max() -> 1000.

start() ->
  pe025(0, 1, 2, max()).
  
pe025(I, J, N, M) ->
  X = I + J,
  Y = length(integer_to_list(X)),
  if
    Y >= M ->
      io:format("~w~n", [N]);
    true ->
      pe025(J, X, N + 1, M)
  end.
