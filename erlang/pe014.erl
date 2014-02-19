-module(pe014).
-export([start/0]).

max() -> 1000000.

start() ->
  pe014(0, 0, 1, max()).
  
pe014(Maxv, Maxi, I, M) when I < M ->
  Next = pe014(0, I),
  if 
    Next > Maxv ->
      pe014(Next, I, I + 1, M);
    true ->
      pe014(Maxv, Maxi, I + 1, M)
  end;
      
pe014(_Maxv, Maxi, _I, _M) ->
  io:format("~w~n", [Maxi]).
    
pe014(C, N) when N =:= 1 ->
  C;

pe014(C, N) when N rem 2 =:= 0 ->
  pe014(C + 1, N div 2);
    
pe014(C, N) ->
  pe014(C + 1, 3 * N + 1).
