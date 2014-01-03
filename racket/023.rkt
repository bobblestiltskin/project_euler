#! /usr/bin/env racket
#lang racket

(define num 28123)

; another sum factors definition - maybe better as a utility library?
(define (sum-factors-ltsr n)
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

(define (sum-factors n)
  (cond
    [(> n 4)
      (let ((sr (integer-sqrt n)))
        (if (= (* sr sr) n)
          (+ (sum-factors-ltsr n) sr)
          (sum-factors-ltsr n)
        )
      )]
    [(= n 4) 3]
    [(= n 3) 1]
    [(= n 2) 1]
    [(= n 1) 1]
  )    
)

(define (abundant? n)
  (< n (sum-factors n))
)

; generate a bit vector with elements set when the index is abundant 
(define (abundant-bit-vector n)
  (list->vector (map abundant? (stream->list (in-range 1 (add1 n)))))
)

(define bit-vector (abundant-bit-vector num))

(define (abundant-bit-set? i bve)
  (if bve
     (add1 i)
      -1
  )
)

; create a vector of abundant numbers
(define (num-vector bv)
  (list->vector 
    (filter positive?
      (map abundant-bit-set? (stream->list (in-range num))
                             (vector->list bv)
      )
    )
  )
)

; for the input number i, return 0 if it can is the sum of 2 abundant numbers, or i+1 if not
(define (process-num-vector i nv bv)
  (let ((nexti (add1 i)))
    (for/fold ([retv -1]) ([j (in-range (vector-length nv))] #:break (= retv 0))
      (let ((jval (vector-ref nv j)))
        (cond
          [(< nexti (vector-ref nv j)) nexti]
          [else 
            (let ((jidiff (- nexti jval)))
              (if (and (> jidiff 0) (vector-ref bv (sub1 jidiff)))
                0
                nexti
              )
            )
          ]
        )
      )
    )
  )
)

; sum the integers which are not the sum of 2 abundant numbers
(define (process-ints n nv bv)
  (for/fold ([total 0]) ([i (in-range n)])
    (let ((pnl (process-num-vector i nv bv)))
      (+ total pnl)
    )
  )
)

(process-ints num (num-vector bit-vector) bit-vector)
