#lang sicp

(#%require rackunit)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
                guess))

; solution
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)))

(define (check-eq-delta a b delta)
  (check < (abs (- a b)) delta))

(let ((a 4)
      (b -8)
      (c 7))
  (check-eq-delta (newtons-method (cubic a b c) 1) -5.6389 0.0001))
