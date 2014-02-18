-module(pe019).
-export([start/0]).

january() -> 31.
february() -> 28.
march() -> 31.
april() -> 30.
may() -> 31.
june() -> 30.
july() -> 31.
august() -> 31.
september() -> 30.
october() -> 31.
november() -> 30.
december() -> 31.
leap_february() -> 29.

num_cycles() -> 25.

year() -> [january(), february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december()].
leap_year() -> [january(), leap_february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december()].
cycle() -> year() ++ year() ++ year() ++ leap_year(). % inefficient but probably preferable to next?
%cycle() -> [
%  january(), february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december(),
%  january(), february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december(),
%  january(), february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december(),
%  january(), leap_february(), march(), april(), may(), june(), july(), august(), september(), october(), november(), december()].

start() ->
  pe019(num_cycles(), cycle(), 2, 0).
  
pe019(NC, _C, _DN, DC) when NC == 0 ->
  io:format("~w~n", [DC]);
  
pe019(NC, C, DN, DC) ->
  {TN, TC} = process_month(C, DN, DC),
  pe019(NC - 1, C, TN, TC).

process_month([], DN, DC) ->
  {DN, DC};

process_month([H|T], DN, DC) ->
  Day = (DN + H) rem 7,
  if
    Day == 0 ->
      process_month(T, Day, DC + 1);
    true ->
      process_month(T, Day, DC)
  end.
