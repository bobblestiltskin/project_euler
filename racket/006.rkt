#lang racket
(define mini 1)
(define maxi 100)

(define (ap-sum mini maxi)
; arithmetic progression sum = (max-min+1)*(max+min)/2
  (/ (* (+ maxi mini) (add1 (- maxi mini))) 2)
)

(define (sq-sum mini maxi)
  (let ((tmp (ap-sum mini maxi)))
    (* tmp tmp)
  )
)
 
(define (sum-sq mini maxi)
  (for/fold ([sumsq 0])([i (in-range mini (add1 maxi))])
    (+ sumsq (sqr i))
  )
)

(define (sumdiff sumsq sqsum)
  (abs (- sumsq sqsum))
)

(sumdiff (sq-sum mini maxi) (sum-sq mini maxi))
