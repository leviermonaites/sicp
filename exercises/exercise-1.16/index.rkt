#!/usr/local/racket/bin/racket
#lang racket

(define (even? n)
  (integer? (/ n 2))
)

(define (square n)
  (* n n)
)

(define (my-expt-iter b n a)
  (cond
    ((= n 0) 1)
    ((= n 1) (* b a))
    ((even? n) (my-expt-iter (square b) (/ n 2) a))
    (else (my-expt-iter b (- n 1) (* b a)))
  )
)

(define (my-expt b n)
  (my-expt-iter b n 1)
)