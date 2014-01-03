#! /usr/bin/env racket
#lang racket
(define number 10001)

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

; given a prime it tests subsequent odd numbers until a prime is found
(define (next-prime n)
  (cond [(< n 2) 2]
        [else (cond [(even? n) (cond [(= 2 n) 3]
                                     [else (next-prime (sub1 n))])]
                    [else (let ((try (+ 2 n)))
                            (cond [(prime? try) try]
                                  [else (next-prime try)]))])
        ])
)

; this will recurse getting the next prime until the counter stops
(define (nth-prime n p)
  (if (= n 0)
      p
      (nth-prime (sub1 n) (next-prime p))
  )
)

(nth-prime 10001 1)
