#lang sicp

(#%require racket/include)
(include "fixed_point.rkt")

(fixed-point 
  (lambda (x) (+ 1 (/ 1 x)))
  1.0)

; Result is 1.6180327868852458

