#lang sicp

(#%require rackunit)

(define (cons x y)
  (* (power 2 x) (power 3 y)))

(define (power a n)
  (if (= n 0)
    1
    (* a (power a (- n 1)))))

(define (car z)
  (max-dividing-power z 2))

(define (cdr z)
  (max-dividing-power z 3))

(define (max-dividing-power x a)
  (if (= (remainder x a) 0)
    (+ (max-dividing-power (/ x a) a) 1)
    0))

(check-eq? (car (cons 1 2)) 1)
(check-eq? (car (cons 2 1)) 2)

(check-eq? (cdr (cons 1 2)) 2)
(check-eq? (cdr (cons 2 1)) 1)
