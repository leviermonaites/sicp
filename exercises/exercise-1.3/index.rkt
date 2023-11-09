#!/usr/local/racket/bin/racket
#lang racket

(define (square x)
  (* x x)
)

(define (>= x y)
  (or (> x y) (= x y))
)

(define (sum_of_greatest_squares x y z)
  (cond
    ((or (> x y) (> x z))
      (if (>= y z)
        (+ (square x) (square y))
        (+ (square x) (square y))
      )
    )
    (else (+ (square y) (square z)))
  )
)

(sum_of_greatest_squares 3 4 5)