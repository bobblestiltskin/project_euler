-module(pe001).
-export([start/0]).

max() -> 999.

start() ->
  pe001(max(), 0).
  
pe001(N, Result) when N > 0, N rem 3 == 0; N rem 5 == 0 ->
    pe001(N-1, N+Result);
    
pe001(N, Result) when N > 0 ->
    pe001(N-1, Result);
    
pe001(N, Result) ->
    io:format("~w~n", [Result]).
