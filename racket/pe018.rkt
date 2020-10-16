#! /usr/bin/env racket
#lang racket

(define row1 (list 75))
(define row2 (list 95 64))
(define row3 (list 17 47 82))
(define row4 (list 18 35 87 10))
(define row5 (list 20 04 82 47 65))
(define row6 (list 19 01 23 75 03 34))
(define row7 (list 88 02 77 73 07 63 67))
(define row8 (list 99 65 04 28 06 16 70 92))
(define row9 (list 41 41 26 56 83 40 80 70 33))
(define rowa (list 41 48 72 33 47 32 37 16 94 29))
(define rowb (list 53 71 44 65 25 43 91 52 97 51 14))
(define rowc (list 70 11 33 28 77 73 17 78 39 68 17 57))
(define rowd (list 91 71 52 38 17 14 91 43 58 50 27 29 48))
(define rowe (list 63 66 04 68 89 53 67 30 73 16 69 87 40 31))
(define rowf (list 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23))

(define triangle (list rowe rowd rowc rowb rowa row9 row8
                       row7 row6 row5 row4 row3 row2 row1))

; recursively process a row - pushing the max of each pair of elements on to a list
; the output listis reversed and returned on termination
(define (pair-max inlist outlist)
  (cond 
    [(null? (rest inlist)) (reverse outlist)]
    [else (let ([outlist (flatten (list (max (first inlist) (second inlist)) outlist))])
           (pair-max (rest inlist) outlist))]))

; recursively process the triangle and a row - pulling off the bottom row each iteration
; rowsum created here is a sum of the bottom row of the triangle with the pair-max of the input row
(define (process-triangle triangle row)
  (cond
    [(null? triangle) (first row)]
    [else (let ([rowsum (for/list ([i (pair-max row null)] [j (first triangle)]) (+ i j))])
           (process-triangle (rest triangle) rowsum))]))

; triangle contains all rows but rowf arranged from rowe to row1
(process-triangle triangle rowf)
