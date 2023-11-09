#!/user/local/racket/bin/racket
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

(define (improve guess x)
  (average guess (/ x guess))
)

(define (sqrt-iter guess x)
  (define improved-guess (improve guess x))
  (if (good-enough? guess improved-guess x)
    guess
    (sqrt-iter improved-guess x)
  )
)

(define (sqrt x)
  (sqrt-iter 1.0 x)
)

(sqrt 9)