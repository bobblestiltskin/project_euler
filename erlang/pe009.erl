-module(pe009).
-export([start/0]).

sum() -> 1000.

start() ->
  pe009(1, 2).

pe009(I, J) ->
  Bool = high_eq_lowmid(I, J),
  LastJ = sum() - (I + 1),
  if
    Bool ->
      K = sum() - (I + J),
      P = I * J * K,
      io:format("~w~n", [P]);
    J =:= LastJ ->
      pe009(I + 1, I + 2);
    true ->
      pe009(I, J + 1)
  end.

high_eq_lowmid(I, J) ->
   K = sum() - (I + J),
   I2 = I * I,
   J2 = J * J,
   K2 = K * K,
  [Low , Mid, High] = lists:sort([I2, J2, K2]),
  (Low + Mid =:= High).
