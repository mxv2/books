#lang racket

(#%require rackunit)

(define (same-parity x . w)
  (define (collect term l)
    (cond
      ((null? l) l)
      ((term (car l)) (cons (car l) (collect (cdr l))))
      (else (collect (cdr l)))))

  (if (odd? x)
    (cons x (collect odd? w))
    (cons x (collect even? w))))

(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7) (list 2 4 6))
