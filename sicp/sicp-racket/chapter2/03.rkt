#lang sicp

(#%require "segments.rkt")
(#%require "rectangles.rkt")
(#%require rackunit)

(define r1 (make-rect (make-point 1 2) (make-point -1 -2)))
(check-eq? (perimeter r1) 12)
(check-eq? (area r1) 8)

(define r2 (make-rect (make-point -5 3) (make-point -1 -2)))
(check-eq? (perimeter r2) 18)
(check-eq? (area r2) 20)

