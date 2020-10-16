#! /usr/bin/env racket
#lang racket
(define mymax 1000)

; run i from 1 to max, and j from i+1 to max-i
; then set k to max - (i+j) and order the squares of each
; stop and return when the largest is equal to the sum of the smaller pair
(for*/fold ([result 0]) ([i (in-range 1 mymax)]
                         [j (in-range (add1 i) (- mymax i))])
   #:break (> result 0)
  (let* ((k (- mymax (+ i j))) 
         (squares (sort (list (sqr i) (sqr j) (sqr k)) <)))
    (if (= (+ (first squares) (second squares)) (last squares))
     (* i j k)
     0
    )
  ) 
)
