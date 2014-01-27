-module(pe001).
-export([pe001/1]). 


pe001(N) ->
  pe001(N, 0).
  
pe001(N, Result) when (N > 0) and (N rem 3 == 0) or (N rem 5 == 0) ->
    pe001(N-1, N+Result);
    
pe001(N, Result) when N > 0 ->
    pe001(N-1, Result);
    
pe001(N, Result) ->
    io:format("~n"), Result.
