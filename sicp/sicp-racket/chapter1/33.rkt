#lang sicp

(#%require racket/include)
(include "prime.rkt")
(#%require rackunit)

(define (filtered-accumulate combiner null-value filter term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
      result
      (accumulate-iter (next a) 
                       (if (filter a)
                         (combiner result (term a))
                         result))))

  (accumulate-iter a null-value))

(define (sum-squared-primes a b)
  (define (square x) (* x x))
  (filtered-accumulate + 0 prime? square a inc b))

(check-equal? (sum-squared-primes 1 10) 88)

