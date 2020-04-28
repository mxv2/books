#lang sicp

(#%require "intervals.rkt")
(#%require rackunit)

(define x (make-interval 1 5))
(check-eq? (upper-bound x) 5)
(check-eq? (lower-bound x) 1)
