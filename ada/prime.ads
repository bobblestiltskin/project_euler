package prime is

  type prime_array is array (Positive range <>) of Integer;

  function isprime(num : Integer) return boolean;

  function isprime_array(num : Integer; known_primes : prime_array) return boolean;

end prime;
