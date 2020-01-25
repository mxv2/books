#lang sicp

(define (cont-frac n d k)
  (define (iter i result)
    (if (> i 0)
      (iter (- i 1) (/ (n i) (+ (d i) result)))
      result))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac 
    (lambda (i) (if (= i 1) x (- (* x x))))
    (lambda (i) (if (= i 1) 1.0 (- (* 2 i) 1.0)))
    k))

