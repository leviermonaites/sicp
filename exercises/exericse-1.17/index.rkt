#!/usr/local/racket/bin/racket
#lang racket

(define (double a)
  (+ a a)
)

(define (halve a)
  (/ a 2)
)

(define (multiply-iter a n i)
    (cond
    ((= n 0) 0)
    ((= n 1) (+ a i))
    ((even? n) (multiply-iter (double a) (halve n) i))
    (else (multiply-iter a (- n 1) (+ a i)))
  )
)

(define (multiply a n)
  (multiply-iter a n 0)
)

(multiply 15 5)