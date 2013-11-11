#lang racket
(define max3 999)
(define maxi max3)
(define maxj maxi)

(define min3 10)
(define mini min3)
(define minj min3)

(define (n2l n)
  (string->list (number->string n))
)

(define (palindromic? pn)
  (let ((pn (n2l pn)))
    (equal? (reverse pn) pn)
  )
)
 
(for*/fold ([maxp 0]) ([i (in-range maxi mini -1)][j (in-range maxj minj -1)])
  (let ((prod (* i j)))
    (if (palindromic? prod) 
        (max prod maxp)
        maxp
    )
;    (printf "i is ~a, j is ~a, product is ~a, palindrome is ~s\n" i j prod (palindromic? prod))
  )
)
  
