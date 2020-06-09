#lang sicp

(#%require rackunit)

(define (reverse a)
  (define (shift src dest)
    (if (null? src)
      dest
      (shift
        (cdr src) 
        (cons (car src)
              dest))))
  (shift a (list)))

(check-equal? (reverse (list 1)) (list 1))
(check-equal? (reverse (list 1 2)) (list 2 1))
(check-equal? (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))
