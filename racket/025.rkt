#! /usr/bin/env racket
#lang racket

; this returns the index of the first fibonacci number which contains 1000 digits

(define MAXLEN 999)

(define (fib-len prev current index)
  (cond
    [(> (string-length (number->string current)) MAXLEN) index]
    [else (fib-len current (+ prev current) (add1 index))]
  )
)

(fib-len 0 1 1)
