#! /usr/bin/env racket
#lang racket

(define THRESHOLD 1000)

(define (psum num digsum)
  (if (> num 9)
    (let-values ([(q r) (quotient/remainder num 10)])
      (psum q (+ digsum r))
    )
    (+ digsum num)
  )
)

(psum (expt 2 THRESHOLD) 0)
