#lang sicp

(#%require rackunit)

(define zero 
  (lambda (f) 
    (lambda (x) x)))

(check-eq? ((zero nil) 0) 0)
(check-eq? ((zero nil) 1) 1)

(define (add-1 n)
  (lambda (f) 
    (lambda (x) 
      (f ((n f) x)))))

(define one 
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))
