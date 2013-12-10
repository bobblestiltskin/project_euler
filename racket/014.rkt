#! /usr/bin/env racket
#lang racket

(define THRESHOLD 1000000)

(define (divides? a b)
  (zero? (remainder a b)))

(define (nextv n)
  (if (divides? n 2)
     (arithmetic-shift n -1) ; n/2
     (+ (* n 3) 1)))

(define (collatz n counter)
  (let ([nv (nextv n)]
        [ni (add1 counter)])
    (if (= 1 nv)
      ni
      (collatz nv ni)
    )
  )
)

(define (collatz_loop num)
  (for/fold ([maxi 0][maxv 0]) ([i (in-range 1 num)])
    (let ([tmp (collatz i 0)])
      (if (> tmp maxv)
        (values i tmp)
        (values maxi maxv)))))

(define-values (maxi maxv) (collatz_loop THRESHOLD))
maxi
