#! /usr/bin/env racket
#lang racket

(define num 10000)

(define (sum-factors n)
  (for/fold ([sumf 1]) ([i (in-range 2 (sqrt n) 1)])
     (let-values ([(q r) (quotient/remainder n i)])
       (cond
         [(zero? r)
           (cond 
             [(= i q) (+ sumf q)]
             [else    (+ sumf q i)]
           )
         ]
         [else sumf]
      )
    )
  )
)

(define ht (make-hash))
(for ([i (in-range num)])
  (hash-set! ht i (sum-factors i)))

(define (amicable-sum n)
  (for/fold ([total 0]) ([i (in-range n)])
    (let ((hr1 (hash-ref ht i)))
      (cond
        [(< hr1 n) 
          (cond 
            [(= i hr1)  total]
            [else 
              (cond
                [(= (hash-ref ht hr1) i) (+ i total)]
                [else total]
              )
            ]
          )
        ]
        [else total]
      )
    )
  )
)

(amicable-sum num)
