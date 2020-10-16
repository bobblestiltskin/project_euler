#! /usr/bin/env racket
#lang racket

(define THRESHOLD 500)

(define (divides? a b)
  (zero? (remainder a b)))

; this counts the factors of n from 1 to sqrt n
(define (sqrt-factors n)
  (for/fold ([nf 0]) ([i (in-range 1 (sqrt n))])
     (if (divides? n i)
        (add1 nf)
        nf)))

; count the factors of n - is 2 * num to sqrt of n
; and need to add 1 if the square root is integral
(define (num-factors n)
  (let ((ssum (* 2 (sqrt-factors n)))
        (sroot (sqrt n)))
    (if (integer? sroot)
        (add1 ssum)
              ssum)))

(define (get-triangle threshold)
  (for/fold ([triangle 0][numf 0]) ([i (in-naturals 1)])
    #:break (> numf threshold)
    (values (+ triangle i) (num-factors (+ triangle i)))))

(define-values (tr numf) (get-triangle THRESHOLD))

tr
