#lang sicp

(#%require rackunit)

(define (cube-root-iter guess guess_prev x)
  (if (better-good-enough? guess guess_prev)
    guess
    (cube-root-iter (improve guess x) guess x)))

(define (better-good-enough? guess guess_prev)
  (< (abs (- guess guess_prev)) 0.0001))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess))
     3))

(define (cube-root x)
  (cube-root-iter 1.0 0.0 x))

(check-= (cube-root 0.000000001) 0.001 0.0001)

