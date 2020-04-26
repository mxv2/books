#lang sicp

(#%require "segments.rkt")

(#%provide make-rect perimeter area)

(define (make-rect p1 p2)
  (cons p1 p2))

(define (width r)
  (dist-point (car r) (third-point r)))

(define (height r)
  (dist-point (cdr r) (third-point r)))

(define (dist-point p1 p2)
  (sqrt 
    (+ 
      (square (- (x-point p1) (x-point p2)))
      (square (- (y-point p1) (y-point p2))))))

(define (third-point r)
  (make-point (x-point (car r)) (y-point (cdr r))))

(define (square a)
  (* a a))

(define (perimeter r)
  (* 
    (+ (width r) (height r))
    2))

(define (area r)
  (* (width r) (height r)))
