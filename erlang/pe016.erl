-module(pe016).
-export([start/0]).

expt() -> 1000.

start() ->
  Res = pe016(pow(2, expt()), 0),
  io:format("~w~n", [Res]).
  
pe016(N, Result) when N > 9 ->
  R = N rem 10,
  Q = N div 10,
  pe016(Q, R+Result);
    
pe016(N, Result) ->
  N + Result.

% derived from http://www.evanmiller.org/joy-of-erlang.html
% Raise A to the B power (positive)
pow(_A, 0) -> 1;
pow(A, B) -> A * pow(A, B - 1).
