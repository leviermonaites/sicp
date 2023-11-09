#!/usr/local/racket/bin/racket
#lang racket

(define (abs x)
  (if (< x 0) (- x) x)
)

(define (square x) 
  (* x x)
)

(define (good-enough? guess improved-guess x)
  (< (/ (abs (- guess improved-guess)) guess) 0.0000000001)
)

(define (average x y)
  (/ (+ x y) 2)
)

(define (improve-sqrt-guess guess x)
  (average guess (/ x guess))
)

(define (improve-cbrt-guess guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (sqrt-iter guess x)
  (define improved-guess (improve-sqrt-guess guess x))
  (if (good-enough? guess improved-guess x)
    guess
    (sqrt-iter improved-guess x)
  )
)

(define (sqrt x)
  (sqrt-iter 1.0 x)
)

(define (cbrt-iter guess x)
  (define improved-guess (improve-cbrt-guess guess x))
  (if (good-enough? guess improved-guess x)
    guess
    (cbrt-iter improved-guess x)
  )
)

(define (cbrt x)
  (cbrt-iter 1.0 x)
)

(sqrt 9)
(cbrt 729)