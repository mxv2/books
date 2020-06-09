#lang sicp

(#%require rackunit)

(define (square-list items)
  (if (null? items)
      nil
      (cons 
        (* (car items) (car items))
        (square-list (cdr items)))))

(check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(check-equal? (square-list-map (list 1 2 3 4)) (list 1 4 9 16))
