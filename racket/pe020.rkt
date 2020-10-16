#! /usr/bin/env racket
#lang racket

(define num 100)

(define (factorial n)
  (cond
    [(= 1 n) 1]
    [else (* n (factorial (sub1 n)))]))

; add digits recursively, dividing by 10 each iteration
(define (sum-digits n sofar)
  (cond
    [(< n 10) (+ n sofar)]
    [else (let-values ([(q r) (quotient/remainder n 10)])
          (sum-digits q (+ r sofar)))]))

(sum-digits (factorial num) 0)
