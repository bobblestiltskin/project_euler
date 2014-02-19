-module(pe003).
-export([start/0]).

maxv() -> 600851475143.

start() ->
  pe003(maxv()).
  
pe003(Number) when (Number =:= 2) ->
  io:format("~w~n", [2]);
    
pe003(Number) when (Number rem 2 =:= 0) ->
  pe003(Number div 2);
    
pe003(Number) ->
  loop003(3, Number).

loop003(Start, Number) when (Number =:= 1) ->
  io:format("~w~n", [Start - 2]);

loop003(Start, Number) when (Number rem Start =:= 0) ->
  loop003(Start + 2, Number div Start);

loop003(Start, Number) ->
  loop003(Start + 2, Number).
