-module(pe004).
-export([start/0]).

min3() -> 100.
max3() -> 999.

start() ->
  pe004(min3(), max3(), min3(), max3(), 0).

% i is the outer loop, j is the inner loop
% we compute i*j and keep the largest palindrome in BestP
pe004(Mini, I, Minj, J, BestP) when ((I =:= Mini) and (J =:= Minj)) ->
  io:format("~w~n", [BestP]);

pe004(Mini, I, Minj, J, BestP) when (J =:= Minj) ->
  pe004(Mini, I - 1, Minj, max3(), BestP);

pe004(Mini, I, Minj, J, BestP) ->
  Product = I * J,
  Updating = is_palindrome(Product) and (Product > BestP),

  Next = if
    (Updating =:= true) -> Product;
    true -> BestP
  end, 

  Istop = if
    (Updating =:= true) -> Product div 1000;
    true -> Mini
  end, 

  Jstop = if
    (Updating =:= true) -> Product div 1000;
    true -> Minj
  end, 

  pe004(Istop, I, Jstop, J - 1, Next).

is_palindrome(Number) ->
  integer_to_list(Number) =:= lists:reverse(integer_to_list(Number)).

