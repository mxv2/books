#lang sicp

(#%require "segments.rkt")
(#%require rackunit)

(define p1 (make-point 1 2))
(check-eq? (x-point p1) 1)
(check-eq? (y-point p1) 2)

(define p2 (make-point -1 -2))
(check-eq? (x-point p2) -1)
(check-eq? (y-point p2) -2)

(define s (make-segment p1 p2))
(check-eq? (x-point (start-segment s)) 1)
(check-eq? (y-point (start-segment s)) 2)
(check-eq? (x-point (end-segment s)) -1)
(check-eq? (y-point (end-segment s)) -2)

(define mp (midpoint-segment s))
(check-eq? (x-point mp) 0)
(check-eq? (y-point mp) 0)
