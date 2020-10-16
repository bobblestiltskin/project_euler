#! /usr/bin/env racket
#lang racket

(define THRESHOLD 20)

; compute (2n)!/((n!)*(n!))

(define (psum num)
  (for/fold ([p 1]) ([i (in-range (add1 num) (add1 (+ num num)))][j (in-range 1 (add1 num))])
    (/ (* p i) j)))

(psum THRESHOLD)
