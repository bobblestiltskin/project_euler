#! /usr/bin/env racket
#lang racket

(define num 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450)

(define minv 1000000000000)

; this function will return the product of the five digits at the right of num
(define (one-prod num)
   (define-values (q1 r1) (quotient/remainder num 10))
   (define-values (q2 r2) (quotient/remainder q1 10))
   (define-values (q3 r3) (quotient/remainder q2 10))
   (define-values (q4 r4) (quotient/remainder q3 10))
   (define-values (q5 r5) (quotient/remainder q4 10)) 
   (define-values (q6 r6) (quotient/remainder q5 10)) 
   (define-values (q7 r7) (quotient/remainder q6 10)) 
   (define-values (q8 r8) (quotient/remainder q7 10)) 
   (define-values (q9 r9) (quotient/remainder q8 10)) 
   (define-values (qa ra) (quotient/remainder q9 10)) 
   (define-values (qb rb) (quotient/remainder qa 10)) 
   (define-values (qc rc) (quotient/remainder qb 10)) 
   (define-values (qd rd) (quotient/remainder qc 10)) 
   (* rd rc rb ra r9 r8 r7 r6 r5 r4 r3 r2 r1)
)

; work through num from the right dropping a digit each iteration 
; and passing through highest best so far
; stop when the number has 12 digits and return the highest
(define (div-print num maxv)
  (cond [(< num minv) maxv]
        [else (let ((candidate (one-prod num))
                    (next (quotient num 10)))
                (cond [(> candidate maxv) (div-print next candidate)]
                      [else (div-print next maxv)]))]
  )
)

(div-print num 0)
