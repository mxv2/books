#lang sicp

(#%require rackunit)

(define (mult a b)
  (cond ((= a 0) 0)
        ((= a 1) b)
        ((even? a) (double (mult (halve a) b)))
        (else (+ b (mult (- a 1) b)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(check-equal? (mult 0 1) 0)
(check-equal? (mult 1 1) 1)
(check-equal? (mult 2 1) 2)
(check-equal? (mult 2 2) 4)
(check-equal? (mult 4 5) 20)
(check-equal? (mult 3 52) 156)
(check-equal? (mult 100 2) 200)

