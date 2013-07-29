#! /usr/bin/env racket
#lang racket
(define mysum 0)
(define (add-to-sum i)
  (set! mysum (+ mysum i)))
(for ([i (in-range 1 1000)])
  (if (or (= (modulo i 3) 0) (= (modulo i 5) 0)) (add-to-sum i) null))
(printf (string-append (number->string mysum) "\n"))
