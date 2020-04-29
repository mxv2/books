#lang sicp

(#%require "intervals.rkt")
(#%require rackunit)

(define a (make-interval 0 5))
(define b (make-interval 1 4))

(define s (sub-interval a b))
(check-eq? (lower-bound s) -4)
(check-eq? (upper-bound s) 4)
