#lang sicp

(#%require rackunit)

; Procedure has recursive process.
; Evaluating (plus 4 5)
; >(plus 4 5)
; > (inc (plus 3 5))
; > >(plus 3 5)
; > > (inc (plus 2 5))
; > > >(plus 2 5)
; > > > (inc (plus 1 5))
; > > > >(plus 1 5)
; > > > > (inc (plus 0 5))
; > > > > >(plus 0 5)
; > > > > > 5
; < < < < (inc 5)
; < < < (inc 6)
; < < (inc 7)
; < (inc 8)
; <9
; 9
(define (plus a b)
  (if (= a 0)
    b
    (inc (plus (dec a) b))))

(check-equal? (plus 4 5) 9)

; Procedure has iterative process.
; Evaluating (plus2 4 5)
; >(plus2 4 5)
; >(plus2 3 6)
; >(plus2 2 7)
; >(plus2 1 8)
; >(plus2 0 9)
; <9
; 9
(define (plus2 a b)
  (if (= a 0)
    b
    (plus2 (dec a) (inc b))))

(check-equal? (plus2 4 5) 9)

