#! /usr/bin/env racket
#lang racket

(define january 31)
(define february 28)
(define march 31)
(define april 30)
(define may 31)
(define june 30)
(define july 31)
(define august 31)
(define september 30)
(define october 31)
(define november 30)
(define december 31)
(define leap-february 29)

(define year (list january february march april may june july 
                   august september october november december))
(define leap-year (list january leap-february march april may june july 
                        august september october november december))
(define cycle (flatten (list year year year leap-year)))
(define num-cycles 25)

(define (process-month m daycount daynum)
  (let ([nextdn (+ daynum m)])
    (if (zero? (remainder nextdn 7))
      (values (add1 daycount) nextdn)
      (values daycount nextdn)
    )
  )
)

(define-values (c n) 
               (for*/fold ([daycount 0][daynum 2]) 
                          ([i (in-range 25)][m cycle])
                 (process-month m daycount daynum)))
c
