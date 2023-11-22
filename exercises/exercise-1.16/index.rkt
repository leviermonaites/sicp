#!/usr/local/racket/bin/racket
#lang racket

(define (even? n)
  (integer? (/ n 2))
)

(define (square n)
  (* n n)
)

(define (my-expt b n)
    (cond
    ((= n 0) 1)
    ((= n 1) b)
    ((even? n) (my-expt (square b) (/ n 2)))
    (else (my-expt (square b) (- n 1)))
  )
)