#lang sicp

(#%require "intervals.rkt")
(#%require rackunit)

(define a (make-interval 1 5))
(define wa (width a))
(check-equal? wa 2)

(define b (make-interval -2 3))
(define wb (width b))
(check-equal? wb 5/2)

(check-equal? (width (add-interval a b)) (+ wa wb))
(check-equal? (width (sub-interval a b)) (+ wa wb))

(check-equal? (width (mul-interval a b)) 25/2)
(check-equal? (width (div-interval a b)) 25/2)
