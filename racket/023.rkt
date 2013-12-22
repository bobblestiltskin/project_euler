#! /usr/bin/env racket
#lang racket

(define num 28123)
;(define num 33)

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

;(for ([i (in-range 1 15)])
;  (printf "i is ~s and sf is ~s\n" i (sum-factors i))
;)
;(printf "i is ~s and sf is ~s\n" 196 (sum-factors 196))

(define (abundant? n)
  (< n (sum-factors n))
)

(define (abundant-bit-vector n)
  (list->vector (map abundant? (stream->list (in-range 1 (add1 n)))))
)

(define bit-vector (abundant-bit-vector num))

;(define (print-num-vector n)
;  (let ((count 0))
;    (for ([i (in-range 0 num)])
;      (if (vector-ref bit-vector i)
;         (printf "true ~s\n" (add1 i))
;         (printf "false ~s\n" (add1 i))
;      )
;    )
;  )
;)

(define (bit-set? i)
  (if (vector-ref bit-vector i)
     (add1 i)
      -1
  )
)

(define (get-num-list n)
  (filter positive? (map bit-set? (stream->list (in-range n))))
)

(define num-list (get-num-list num))
(define num-vector (list->vector num-list))

;(printf "bit vector is ~s\n" bit-vector)
;(print-num-vector num)
;(printf "num list is ~s\n" num-list)
;(printf "num vector is ~s\n" num-vector)

(define (process-num-list i nv)
  (let ((nexti (add1 i)))
;    (printf "i is ~s, nexti ~s\n" i nexti)
    (for/fold ([retv -1]) ([j (in-range (vector-length nv))] #:break (= retv 0))
      (let ((jval (vector-ref nv j)))
        (cond
          [(< nexti (vector-ref nv j)) nexti]
          [else 
            (let ((jidiff (- nexti jval)))
;              (printf "nexti is ~s greater than j of ~s and diff is ~s\n" nexti jval jidiff)
;              (if (member jidiff num-list)
              (if (and (> jidiff 0) (vector-ref bit-vector (sub1 jidiff)))
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

(define (process-ints n nv)
  (for/fold ([total 0]) ([i (in-range n)])
    (let ((pnl (process-num-list i nv)))
;      (if (= pnl 0)
;        (printf "zero: i is ~s and pnl is ~s and total is ~s\n" (add1 i) pnl total)
;        (printf "adding : i is ~s and pnl is ~s and total is ~s\n" (add1 i) pnl (+ total pnl))
;      )
      (+ total pnl)
    )
  )
)

(process-ints num num-vector)
;(printf "length of num list is ~s\n" (length num-list))
;(printf "196 sumf is ~s\n" (sum-factors 196))
