#lang sicp

(#%require "rational-numbers.rkt")
(#%require rackunit)

(define one-half (make-rat 1 2))
(check-eq? (numer one-half) 1)
(check-eq? (denom one-half) 2)

(define minus-one-half (make-rat -1 2))
(check-eq? (numer minus-one-half) -1)
(check-eq? (denom minus-one-half) 2)

(define minus-one-third (make-rat 1 -3))
(check-eq? (numer minus-one-third) -1)
(check-eq? (denom minus-one-third) 3)

(define minus-minus-one-half (make-rat -1 -3))
(check-eq? (numer minus-minus-one-half) 1)
(check-eq? (denom minus-minus-one-half) 3)
