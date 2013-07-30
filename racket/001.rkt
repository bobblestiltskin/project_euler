#! /usr/bin/env racket
#lang racket
(define (add-item i sum)
  (cond
    [(< i 1) sum]
    [else (if (or (= (modulo i 3) 0) (= (modulo i 5) 0))
             (add-item (- i 1) (+ sum i)) 
             (add-item (- i 1) sum))
    ]
  )
)
(add-item 999 0)
