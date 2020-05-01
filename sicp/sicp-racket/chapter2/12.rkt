#lang racket

(#%require "intervals.rkt")
(#%require rackunit)

(define a (make-center-percent 5 10))

(check-equal? (lower-bound a) 9/2)
(check-equal? (upper-bound a) 11/2)
(check-equal? (percent a) 10)
