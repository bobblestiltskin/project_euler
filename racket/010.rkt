#! /usr/bin/env racket
#lang racket

(define number 2000000)
;(define number 10)

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

(define (sum-primes number)
  (for/fold ([psum 0]) ([i (in-naturals)] #:when (prime? i))
    #:break (> i number)
    (+ i psum)
  )
)

(sum-primes number)
