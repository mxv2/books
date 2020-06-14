#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(check-equal? (fold-right / 1 (list 1 2 3)) 3/2)
(check-equal? (fold-left  / 1 (list 1 2 3)) 1/6)

(check-equal? (fold-right list nil (list 1 2 3)) (list 1 (list 2 (list 3 (list)))))
(check-equal? (fold-left  list nil (list 1 2 3)) (list 1 2 3))
