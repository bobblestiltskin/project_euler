-module(pe022).
-export([start/0]).

start() ->
   X = file:read_file("../names.txt"),
  pe022(X).
  
pe022({error, Reason}) ->
  io:format("Broken File: ~w~n", [Reason]);
  
pe022({ok, Binary}) ->
  L = lists:sort(string:tokens(binary_to_list(Binary), ",")),
  process_list(L, 0, 0).
  
process_list([], _Index, Sum) ->
  io:format("~w~n", [Sum]);

process_list([H|T], Index, Sum) ->
  Word = string:sub_string(H, 2, length(H) - 1),
  NewIndex = Index + 1,
  WordSum = process_word(Word, 0),
  process_list(T, NewIndex, (NewIndex * WordSum) + Sum).

process_word([], Sum) ->
  Sum;

process_word([H|T], Sum) ->
  process_word(T, H - 64 + Sum).
