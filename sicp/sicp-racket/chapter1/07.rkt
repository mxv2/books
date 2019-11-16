; Problem: (sqrt 0.000001) -> 0.031260655525445276
; Solution is new 'better-good-enough' procedure
#lang sicp

(#%require rackunit)

(define (sqrt-iter guess guess_prev x)
  (if (better-good-enough? guess guess_prev)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (better-good-enough? guess guess_prev)
  (< (abs (- guess guess_prev)) 0.0001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))

(check-= (sqrt 0.000001) 0.001 0.0001)

