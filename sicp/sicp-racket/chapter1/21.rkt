#lang sicp

(#%require rackunit)
(#%require racket/include)
(include "smallest_divisor.rkt")

(check-equal? (smallest-divisor 199) 199)
(check-equal? (smallest-divisor 1999) 1999)
(check-equal? (smallest-divisor 19999) 7)

