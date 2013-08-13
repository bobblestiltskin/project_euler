#! /usr/bin/env racket
#lang racket
(define MAX 4000000)
(define (fib-sum prev current sum)
  (cond
    [(> current MAX) sum]
    [(= (modulo current 2) 0) (fib-sum current (+ prev current) (+ sum current))]
    [else (fib-sum current (+ prev current) sum)]
  )
)
(fib-sum 0 1 0)
