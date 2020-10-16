#! /usr/bin/env racket
#lang racket
; this computes the largest prime factor of maxnum
(define maxnum 600851475143)
(define (divides? a b)
  (zero? (remainder a b)))

; Dan Prager wrote the next function
; http://www.mail-archive.com/users@racket-lang.org/msg20214.html
(define (L i number)
  (cond [(= number 1) (- i 2)]
        [(divides? number i) (L (+ i 2) (/ number i))]
        [else (L (+ i 2) number)]))

; handle the edge cases - i.e. factors of 2 since the general case works for odd numbers
(define (eloop number)
  (cond [(= number 2) 2]
        [(even? number) (eloop (/ number 2))]
        [else (L 3 number)])
)

(eloop maxnum)
