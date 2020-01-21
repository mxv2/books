#lang sicp

(#%require rackunit)

(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
      result
      (accumulate-iter (next a) (combiner result (term a)))))
  
  (accumulate-iter a null-value))

(define (sum term a next b)
  (define (sum-combiner result a)
    (+ result a))

  (accumulate sum-combiner 0 term a next b))

(define (cube x) (* x x x))

(check-equal? (sum cube 1 inc 10) 3025)

(define (product term a next b)
  (define (prod-combiner result a)
    (* result a))

  (if (> a b)
    0
    (accumulate prod-combiner 1 term a next b)))

(define (identity x) x)

(check-equal? (product identity 1 inc 10) 3628800)

