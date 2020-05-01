#lang racket

(#%require "intervals.rkt")
(#%require rackunit)

(check-equal? 
  (mul-interval 
    (make-interval 1 5)
    (make-interval 2 3))
  (mcons 2 15))

(check-equal? 
  (mul-interval 
    (make-interval 1 5)
    (make-interval -2 3))
  (mcons -10 15))

(check-equal? 
  (mul-interval 
    (make-interval 1 5)
    (make-interval -3 -2))
  (mcons -15 -2))

(check-equal? 
  (mul-interval 
    (make-interval -1 5)
    (make-interval 2 3))
  (mcons -3 15))

(check-equal? 
  (mul-interval 
    (make-interval -1 5)
    (make-interval -2 3))
  (mcons -10 15))

(check-equal? 
  (mul-interval 
    (make-interval -1 5)
    (make-interval -3 -2))
  (mcons -15 3))

(check-equal? 
  (mul-interval 
    (make-interval -5 -1)
    (make-interval 2 3))
  (mcons -15 -3))

(check-equal? 
  (mul-interval 
    (make-interval -5 -1)
    (make-interval -2 3))
  (mcons -15 -3))

(check-equal? 
  (mul-interval 
    (make-interval -5 -1)
    (make-interval -3 -2))
  (mcons 2 15))

(check-equal? 
  (mul-interval 
    (make-interval -1 2)
    (make-interval -4 5))
  (mcons -8 10))
