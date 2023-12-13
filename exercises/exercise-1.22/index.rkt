#!/usr/local/racket/bin/racket
#lang racket

(define (square a)
  (* a a)
)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
    ((even? exp)
      (remainder
        (square (expmod base (/ exp 2) m)) 
        m
      )
    )
    (else
      (remainder
        (* base (expmod base (- exp 1) m))
        m
      )
    )
  )
)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a)
  )
  (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
  (cond 
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)
  )
)

(define (prime? n)
  (fast-prime? n 10)
)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (* (current-inexact-milliseconds) 1000000))
)

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (* (current-inexact-milliseconds) 1000000) start-time))
    (display "")
  )
)

(define (report-prime n elapsed-time)
  (display " *** ")
  (display elapsed-time)
)

(define (search-for-primes n1 n2)
  (cond
    ((or (= n1 n2) (> n1 n2)) (display "\n END"))
    ((even? n1) (search-for-primes (+ n1 1) n2))
    (else 
      (begin
        (timed-prime-test n1)
        (search-for-primes (+ n1 2) n2)
      )
    )
  )
)

(search-for-primes 1000000000 1000000100)