(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (square x)
  (* x x))

(define (divides? a b)
    (= (remainder b a) 0))

;; Improvement from exercise 1.23
(define (next test-divisor)
  (if (= test-divisor 2)
    3
    (+ test-divisor 2)))

