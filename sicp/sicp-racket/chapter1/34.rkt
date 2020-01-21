#lang sicp

(define (f g) (g 2))

(define (square x) (* x x))

(f square)

(f (lambda (z) (* z (+ z 1))))

; Expect error cause 2 is not procedure. (2 2)
; (f f)

