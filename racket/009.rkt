#! /usr/bin/env racket
#lang racket
(define mymax 1000)

(for*/fold ([result 0]) ([i (in-range 1 mymax)]
                         [j (in-range i (- mymax i))])
   #:break (> result 0)
  (let* ((sum (+ i j))
         (k (- mymax sum)) 
         (squares (sort (list (sqr i) (sqr j) (sqr k)) <)))
; if (a*a)+(b*b)==(c*c) -- this may not be the best way to split a list of 3?
    (if (= (+ (car squares) (car(cdr squares))) (car(cdr(cdr squares))))
     (* i j k)
     0
    )
  ) 
)
