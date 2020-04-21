#lang sicp

(#%require rackunit)

(define (repeated f times)
  (lambda (x)
    (repeated-iter f times x)))

(define (repeated-iter f times x)
  (if (= times 1)
    (f x)
    (repeated-iter f (dec times) (f x))))

(define (average a b c)
  (/ (+ a b c) 3))

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (smooth-n f n)
  ((repeated smooth n) f))

(define (square x)
  (* x x))

(define (check-eq-delta a b delta)
  (check < (abs (- a b)) delta))

(define delta 0.000000000000001)

(check-eq-delta ((smooth square) 4) 16.000000000066663 delta)
(check-eq-delta ((smooth-n square 1) 4) 16.000000000066663 delta)

(check-eq-delta ((smooth (smooth (smooth square))) 4) 16.000000000199996 delta)
(check-eq-delta ((smooth-n square 3) 4) 16.000000000199996 delta)
