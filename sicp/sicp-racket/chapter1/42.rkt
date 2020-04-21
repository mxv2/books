#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(check-eq? ((compose square inc) 6) 49)
