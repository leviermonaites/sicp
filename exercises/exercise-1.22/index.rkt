#!/usr/local/racket/bin/racket
#lang racket

(define (runtime) (current-milliseconds))

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
  (fast-prime? n 100000)
)

(define (timed-prime-test n)
  (newline)
  (display n)
  (time (start-prime-test n))
)

(define (start-prime-test n)
  (if (prime? n)
    (display " *** ")
    (display "")
  )
)

(define (report-prime elapsed-time)
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

(search-for-primes 1000000 1000000000)