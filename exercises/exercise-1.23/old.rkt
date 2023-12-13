#!/usr/local/racket/bin/racket
#lang racket

(define (square n) (* n n))

(define (smallest-divisor n) 
  (define start-time (* (current-inexact-milliseconds) 1000000))
  (define result (find-divisor n 2))
  (define end-time (* (current-inexact-milliseconds) 1000000))
  (display "Time taken: ")
  (display (- end-time start-time))
  (newline)
  result
)


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))
  )
)

(define (divides? a b) (= (remainder b a) 0))
