#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(check-equal? (accumulate-n + 0 x) (list 22 26 30))
