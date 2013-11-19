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

(define (mypair number)
  (for/fold ([prime 0][primecount 0]) ([i (in-naturals)] #:when (prime? i))
    #:break (= primecount number)
    (values i (add1 primecount))
  )
)

(mypair number)
