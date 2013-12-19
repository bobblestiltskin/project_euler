#! /usr/bin/env racket
#lang racket

(require racket/file)

(define ifile "../names.txt")

(define (name->num name)
  (for/fold ([lsum 0]) ([i (string->list name)]) (+ lsum (- (char->integer i) 64)))
)

(define-values (num sum) 
  (for/fold ([index 1][nsum 0]) 
          ([name (sort (string-split (string-trim (file->string ifile) "\"") "\",\"") string<?)])
          (values (+ index 1) (+ (* index (name->num name)) nsum))
  )
)
sum
