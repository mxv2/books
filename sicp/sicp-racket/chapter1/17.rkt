#lang sicp

(#%require rackunit)

(define (mult a b)
  (if (or (= a 0) (= b 0))
    0
    (mult-iter a b 0)))

(define (mult-iter a b k)
  (cond ((= a 1) (max k b))
        ((even? a) (mult-iter (halve a) b (+ k (double b))))
        (else (mult-iter (- a 1) b (+ k b)))))

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

