#lang sicp

(#%require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      (+ result 0)
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x)
  (* x x x))

(check-equal? (sum cube 1 inc 10) 3025)

