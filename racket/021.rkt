#! /usr/bin/env racket
#lang racket

(define num 10000)

; a bit more elegant than the function in 012?
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

; hash the numbers against the sum of their factors
(define ht (make-hash))
(for ([i (in-range num)])
  (hash-set! ht i (sum-factors i)))

; use 3 different conditions for clarity - it would be possible
; to use 'and' to combine the logic though the clarity may suffer?
(define (amicable-sum n)
  (for/fold ([total 0]) ([i (in-range n)])
    (let ((hri (hash-ref ht i)))
      (cond
        [(< hri n) 
          (cond 
            [(= i hri) total]
            [else 
              (cond
                [(= (hash-ref ht hri) i) (+ i total)]
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
