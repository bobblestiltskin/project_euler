-module(pe002).
-export([start/0]).

maxv() -> 4000000.

start() ->
  pe002(0, 1, 0, maxv()).
  
pe002(_Prev, Current, Sum, Maxv) when (Current >= Maxv) ->
    io:format("~w~n", [Sum]);
    
pe002(Prev, Current, Sum, Maxv) when (Current rem 2 == 0) ->
    pe002(Current, Prev+Current, Sum+Current, Maxv);
    
pe002(Prev, Current, Sum, Maxv) ->
    pe002(Current, Prev+Current, Sum, Maxv).
