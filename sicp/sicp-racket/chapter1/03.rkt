#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (solution a b c)
  (cond ((and (< a b) (< a c) (sum-of-squares b c)))
        ((and (< b a) (< b c) (sum-of-squares a c)))
        (else (sum-of-squares a b))))

(check-equal? (solution 3 4 5) 41)

(check-equal? (solution 3 5 4) 41)

(check-equal? (solution 5 4 3) 41)

(check-equal? (solution 4 5 3) 41)

(check-equal? (solution 5 3 4) 41)

(check-equal? (solution 4 3 5) 41)

