#lang sicp

(#%require rackunit)

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))

(check-eq? (car (cons 1 2)) 1)
(check-eq? (car (cons 2 1)) 2)

(define (cdr z)
  (z (lambda (p q) q)))

(check-eq? (cdr (cons 1 2)) 2)
(check-eq? (cdr (cons 2 1)) 1)
