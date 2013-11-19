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

(define (max-base-m-lt-n m last n)
  (if (> (* m last) n)
     last
     (max-base-m-lt-n m (* m last) n)
  )
)

(for/fold ([lcm 1])([i (in-range 2 (add1 number))])
  (if (prime? i)
     (* lcm (max-base-m-lt-n i 1 number))
     lcm
  )
)
