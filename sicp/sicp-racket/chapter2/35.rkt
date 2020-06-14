#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(define (count-leaves t)
  (accumulate + 
              0 
              (mmap (lambda (sub-tree) 
                           (if (pair? sub-tree)
                               (count-leaves sub-tree)
                               1))
                    t)))

(define x (cons (list 1 2) (list 3 4)))
(check-equal? (count-leaves x) 4)

(check-equal? (count-leaves (list x x)) 8)
