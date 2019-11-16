#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(check-equal? (new-if (= 2 3) 0 5) 5)

(check-equal? (new-if (= 1 1) 0 5) 0)

; 'new-if' is procedure and the arguments should be evaluated before applying.
; So, procedure would be not terminated cause calling 'sqrt-iter' (infinite recursion).

