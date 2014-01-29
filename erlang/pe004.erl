-module(pe004).
-export([start/0]).

min3() -> 100.
max3() -> 999.

start() ->
  pe004(min3(), max3(), min3(), max3(), 0).

% i is the outer loop, j is the inner loop
% we compute i*j and keep the largest palindrome in BestP
pe004(Mini, I, Minj, J, BestP) when ((I == Mini) and (J == Minj)) ->
  io:format("~w~n", [BestP]);

pe004(Mini, I, Minj, J, BestP) when (J == Minj) ->
  pe004(Mini, I - 1, Minj, max3(), BestP);

pe004(Mini, I, Minj, J, BestP) ->
  Product = I * J,
  Palindrome = is_palindrome(Product),
  Next = if
    (Palindrome == true) and (Product > BestP) -> Product;
    true -> BestP
  end, 

  pe004(Mini, I, Minj, J - 1, Next).

is_palindrome(Number) ->
  integer_to_list(Number) == lists:reverse(integer_to_list(Number)).

