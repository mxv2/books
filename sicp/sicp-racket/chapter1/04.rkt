#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; example of applicative-order evaluation
; > (a-plus-abs-b 10 -5)
; begin body of procedure
; > ((if (> b 0) + -) a b))
; substitute the formal parameters
; > ((if (> -5 0) + -) 10 -5)
; the arguments of special form and expression are already evaluated
; evaluate 'predicate'
; > (> -5 0) -> false
; use 'alternative' part
; (- 10 -5)
; evaluate the result expression
; > (- 10 -5) -> 15

(#%require rackunit)

(check-equal? (a-plus-abs-b 10 -5) 15)

