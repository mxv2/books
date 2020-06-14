#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(check-equal? (mmap (lambda (x) (+ x 1)) (list 1 2 3 4 5)) (list 2 3 4 5 6))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(check-equal? (append (list 1 2 3) (list 4 5 6)) (list 1 2 3 4 5 6))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(check-equal? (length (list 1 2 3 4 5 6)) 6)
