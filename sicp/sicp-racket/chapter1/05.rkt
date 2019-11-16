#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; do not uncomment
; (test 0 (p))

; In applicate-order evaluation arguments of procedure or special form should be evaluated firstly.
; But call 'p' procedure returns (p).
; This means that procedure 'test' would not terminate (infinite recursion).

; In normal-order evaluation predicate evaluates at first. 
; And consequent will be selected cause (= 0 0) is true. 
; Procedure 'test' would be terminated and will return 0.

