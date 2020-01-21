#lang sicp

(#%require rackunit)

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(check-equal? (factorial 0) 1)
(check-equal? (factorial 1) 1)
(check-equal? (factorial 5) 120)
(check-equal? (factorial 10) 3628800)

(define (pi-product n)
  (define (numerator-term n)
    (if (even? n)
      (+ n 2)
      (+ n 1)))

  (define (denominator-term n)
    (if (odd? n)
      (+ n 2)
      (+ n 1)))

  (* 4
     (/ (product numerator-term 1 inc n)
        (product denominator-term 1 inc n))))

(newline)
(display (exact->inexact (pi-product 6)))
(newline)

