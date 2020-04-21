#lang sicp

(#%require rackunit)

(define (double f)
  (lambda (x)
    (f (f x))))

(check-eq? ((double inc) 1) 3)
(check-eq? (((double (double double)) inc) 5) 21)
