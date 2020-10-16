#! /usr/bin/env racket
#lang racket
(define max3 999)
(define maxi max3)

(define min3 100)
(define mini min3)
(define minj mini)

; number->list
(define (n2l n)
  (string->list (number->string n))
)

(define (palindromic? pn)
  (let ((pn (n2l pn)))
    (equal? (reverse pn) pn)
  )
)

(define (jloop maxv minv)
  (for/fold ([maxpj 0]) ([j (in-range maxv minv -1)])
    (let ((prod (* maxv j)))
      (if (palindromic? prod) 
        (max prod maxpj)
        maxpj
      )
    )
  )
)

; we need to search through the permitted number set in pairs so we use two loops
; however we can short circuit the computation when we find each palindrome
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
