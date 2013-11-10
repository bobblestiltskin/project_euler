#lang racket
(define maxnum 600851475143)
(define (divides? a b)
  (= (remainder a b) 0))

(define (L i maxp number)
  (cond [(= number 1) maxp]
        [(divides? number i) (L (+ i 2) i (/ number i))]
        [else (L (+ i 2) maxp number)]))

(define (eloop maxp number)
  (cond [(= number 2) 2]
        [(even? number) (eloop 2 (/ number 2))]
        [else (L 3 0 number)])
)

(eloop 0 maxnum)
