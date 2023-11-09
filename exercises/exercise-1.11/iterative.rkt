#!/usr/local/racket/bin/racket
#lang racket

(define (f-iter a b c n count)
  (if (or(< count n) (= count n))
    (f-iter (+ a (* 2 b) (* 3 c)) a b n (+ count 1))
    a
  )
)

(define (f n)
  (if (< n 3)
    n
    (f-iter 2 1 0 n 3)
  )
)

(f 5)