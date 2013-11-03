#lang racket
(define number 600851475143)
(define maxp 0)

(define divides?
  (lambda (a b)
    (= (remainder a b) 0)))

(define (set-vars i) 
  (set! maxp i)
  (set! number (/ number i))
)

(define (loop)
  (for ([i (in-range 3 number 2)] #:break (= number 1))
    (if (divides? number i)
      (set-vars i)  
      0
    )
  )
  (printf "~a\n" maxp)
)

(loop)
