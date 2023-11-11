#!/usr/local/racket/bin/racket
#lang racket

(define (append-to-end lst element)
  (reverse (cons element (reverse lst)))
)

(define (pascal_triangle user_depth)
  (define depth (- user_depth 1))
  (define (calc_nodes layer layer-element nodes)
    (cond 
      ((and (= layer-element layer) (= layer depth))
        (append-to-end nodes 1)        
      )
      ((= layer-element layer) (calc_nodes (+ layer 1) 0 (append-to-end nodes 1)))
      ((= layer-element 0) (calc_nodes layer 1 (append-to-end nodes 1)))
      (else 
        (calc_nodes layer (+ layer-element 1) 
          (append-to-end nodes 
            (
              +
                (list-ref nodes (- (length nodes) layer))
                (list-ref nodes (- (length nodes) layer 1))
            )
          )
        )
      )
    )
  )

  (calc_nodes 0 0 '())
)

(pascal_triangle 6)