#! /usr/bin/env racket
#lang racket

(define units (list "one" "two" "three" "four" "five" "six" "seven" "eight" "nine"))
(define tens (list "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen" "twenty" "twentyone" "twentytwo" "twentythree" "twentyfour" "twentyfive" "twentysix" "twentyseven" "twentyeight" "twentynine" "thirty" "thirtyone" "thirtytwo" "thirtythree" "thirtyfour" "thirtyfive" "thirtysix" "thirtyseven" "thirtyeight" "thirtynine" "forty" "fortyone" "fortytwo" "fortythree" "fortyfour" "fortyfive" "fortysix" "fortyseven" "fortyeight" "fortynine" "fifty" "fiftyone" "fiftytwo" "fiftythree" "fiftyfour" "fiftyfive" "fiftysix" "fiftyseven" "fiftyeight" "fiftynine" "sixty" "sixtyone" "sixtytwo" "sixtythree" "sixtyfour" "sixtyfive" "sixtysix" "sixtyseven" "sixtyeight" "sixtynine" "seventy" "seventyone" "seventytwo" "seventythree" "seventyfour" "seventyfive" "seventysix" "seventyseven" "seventyeight" "seventynine" "eighty" "eightyone" "eightytwo" "eightythree" "eightyfour" "eightyfive" "eightysix" "eightyseven" "eightyeight" "eightynine" "ninety" "ninetyone" "ninetytwo" "ninetythree" "ninetyfour" "ninetyfive" "ninetysix" "ninetyseven" "ninetyeight" "ninetynine"))
(define huncount 7)
(define handcount 10)
(define thoucount 11)

(define (unit-count)
  (for/fold ([count 0]) ([u (values units)])
    (+ count (string-length u))))
    
(define (tens-count)
  (for/fold ([count 0]) ([t (values tens)])
    (+ count (string-length t))))

(define (hundreds-count)
  (for/fold ([count 0]) ([u (values units)])
    (+ count (string-length u) huncount)))

(define (hundreds-and-units-count)
  (for*/fold ([count 0]) ([h (values units)][u (values units)])
;    (printf "h is ~s and u is ~s\n" h u)
    (+ count (string-length h) (string-length u) handcount)))

(define (hundreds-and-tens-count)
  (for*/fold ([count 0]) ([h (values units)][t (values tens)])
;    (printf "h is ~s and t is ~s\n" h t)
    (+ count (string-length h) (string-length t) handcount)))

(define (one-to-onek-letter-sum)
  (+ (unit-count) (tens-count) (hundreds-count) (hundreds-and-units-count) 
     (hundreds-and-tens-count) thoucount))

(one-to-onek-letter-sum)
