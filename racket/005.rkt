#! /usr/bin/env racket
#lang racket
(define number 20)

; prime? adapted from http://danf.wordpress.com/2011/03/05/testing-for-primes-scheme/

(define (divides? a b)
  (zero? (remainder a b)))

(define (prime? n)
  (cond 
    [(or (= n 1) (= n 0)) #f]
    [(= n 2) #t]
    [(even? n) #f]
    [else 
      (let prime-test ([d 3])
        (cond 
          [(> (* d d) n) #t]
          [(divides? n d) #f]
          [else (prime-test (+ d 2))]
        )
      )
    ]
  )
)

; this function will return the largest number base m which is less than n
; e.g. max-base-m-lt-n 2 1 20 - will return 16 (2**4)
;      max-base-m-lt-n 3 1 20 - will return 9  (3**2)
;      max-base-m-lt-n 3 1 30 - will return 27 (3**3)
(define (max-base-m-lt-n m last n)
  (if (> (* m last) n)
     last
     (max-base-m-lt-n m (* m last) n)
  )
)

; we only look at the prime numbers - and for each we use the function
; max-base-m-lt-n to get the largest number (base m < n)
(for/fold ([lcm 1])([i (in-range 2 (add1 number))])
  (if (prime? i)
     (* lcm (max-base-m-lt-n i 1 number))
     lcm
  )
)
