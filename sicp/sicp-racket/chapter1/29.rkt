#lang sicp

(#%require rackunit)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (as-even x)
  (cond ((even? x) x)
        ((> x 2) (+ x 1))
        (else 2)))

(define (simpson-integral-iter f a h n)
  (define (y-mult k)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 2)
          (else 4)))

  (define (y k)
    (* (y-mult k)
       (f (+ a (* k h)))))

  (* (/ h 3) (sum y 1 inc n)))

(define (simpson-integral f a b n)
  (define (h a b n)
    (/ (- b a) n))
  (simpson-integral-iter f a (h a b (as-even n)) (as-even n)))

(define (cube x)
  (* x x x))

(check-equal? (simpson-integral cube 0 1 100) 1/4)

(check-equal? (simpson-integral cube 0 1 1000) 1/4)

