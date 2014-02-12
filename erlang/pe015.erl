-module(pe015).
-export([start/0]).

max() -> 20.

start() ->
  pe015(max()).
  
pe015(N) ->
  Twon = fact(N + N),
  Onen = fact(N),
  io:format("~w~n", [Twon div (Onen * Onen)]).

fact(1) ->
  1;

fact(N) ->
  N * fact(N -1).
