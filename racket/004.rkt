#lang racket
(define max3 999)
(define maxi max3)
(define maxj maxi)

(define min3 100)
(define mini min3)
(define minj mini)

(define (n2l n)
  (string->list (number->string n))
)

(define (palindromic? pn)
  (let ((pn (n2l pn)))
    (equal? (reverse pn) pn)
  )
)

(define (jloop maxj minj)
  (for/fold ([maxpj 0]) ([j (in-range maxj minj -1)])
    (let ((prod (* maxj j)))
      (if (palindromic? prod) 
        (max prod maxpj)
        maxpj
      )
    )
  )
)

(for/fold ([maxp 0]) ([i (in-range maxi mini -1)])
  (let ((maxpj (jloop i minj)))
    (if (> maxpj maxp)
       ; shrink the minima 
       ; 3 x performance optimisation
       (let ((newmin (/ maxpj 1000)))
         (set! mini newmin)
         (set! minj newmin)
         maxpj
       )
       maxp
    )
  )
)
