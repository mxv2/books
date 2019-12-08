#lang sicp

(#%require rackunit)

(define (fast-expt x n)
  (fast-expt-iter x n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((= b 0) 0)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(define (even? n)
  (= (remainder n 2) 0))

(check-equal? (fast-expt 1 10) 1)
(check-equal? (fast-expt 0 10) 0)
(check-equal? (fast-expt 2 10) 1024)
(check-equal? (fast-expt 3 3) 27)

