#lang racket

(#%require "intervals.rkt")
(#%require rackunit)

(define a (make-interval 2 5))
(define b (make-interval 1 4))

(define d (div-interval a b))
(check-equal? (lower-bound d) 1/2)
(check-equal? (upper-bound d) 5)

(define with-zero (make-interval 0 3))

(define zero (div-interval with-zero a))
(check-equal? (lower-bound zero) 0)
(check-equal? (upper-bound zero) 3/2)

(check-exn
   exn:fail?
   (lambda ()
    (div-interval a with-zero)))
