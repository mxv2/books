#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(define (repeated f times)
  (lambda (x)
    (repeated-iter f times x)))

(define (repeated-iter f times x)
  (if (= times 1)
    (f x)
    (repeated-iter f (dec times) (f x))))

(check-eq? ((repeated square 2) 5) 625)
