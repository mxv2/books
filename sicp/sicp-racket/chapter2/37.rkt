#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(define v (list 1 2 3 4))
(define w (list 4 5 6 6))
(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(check-equal? (dot-product v w) 56)

(define (matrix-*-vector m v)
  (mmap (lambda (row) (dot-product row v)) m))

(check-equal? (matrix-*-vector m w) (list 56 113 161))

(define (transpose mat)
  (accumulate-n cons nil mat))

(check-equal? (transpose m) 
              (list (list 1 4 6)
                    (list 2 5 7)
                    (list 3 6 8)
                    (list 4 6 9)))

(define n (list (list 1 1 1) (list 2 2 2) (list 3 3 3) (list 4 4 4)))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
      (map (lambda (row) (matrix-*-vector cols row)) m)))

(check-equal? (matrix-*-matrix m n)
              (list (list 30 30 30) 
                    (list 56 56 56) 
                    (list 80 80 80)))