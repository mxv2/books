#lang sicp

(#%require rackunit)

(define (square x)
  (* x x))

(define (square-list-try items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(check-equal? (square-list-try (list 1 2 3 4)) (list 16 9 4 1))

(define (square-list-fix items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))

(check-equal? (square-list-fix (list 1 2 3 4)) (cons (cons (cons (cons nil 1) 4) 9) 16))
