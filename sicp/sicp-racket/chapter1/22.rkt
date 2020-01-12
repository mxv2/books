#lang sicp

(#%require racket/include)
(include "fast_prime.rkt")

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  ; Improvement for exercise 1.24
  (if (fast-prime? n 10000) 
    (report-prime n (- (runtime) start-time))
    nil))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes-iter n found)
  (cond ((>= found 3) found)
        ((even? n) (search-for-primes-iter (inc n) found))
        ((equal? (timed-prime-test n) nil) (search-for-primes-iter (inc n) found))
        (else (search-for-primes-iter (inc n) (inc found)))))

(define (search-for-primes n)
  (newline)
  (display "search primes after ")
  (display n)
  (search-for-primes-iter n 0))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)

