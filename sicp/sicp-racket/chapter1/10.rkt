#lang sicp

(#%require rackunit)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(check-equal? (A 1 10) (expt 2 10))
(check-equal? (A 2 4) (expt 2 (expt 2 (expt 2 2))))
(check-equal? (A 3 3) (expt 2 (expt 2 (expt 2 2))))

(define (f n) (A 0 n)) ; -> 2*n
(define (g n) (A 1 n)) ; -> 2^n, n > 0
(define (h n) (A 2 n)) ; -> 2^2^...^2, n > 0

(check-equal? (f 4) 8)
(check-equal? (g 4) 16)
(check-equal? (h 4) 65536)

