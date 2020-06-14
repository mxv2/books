#lang sicp

(#%require "sequences.rkt")
(#%require rackunit)

(define (reverse-right sequence)
  (fold-right 
   (lambda (x y) (append y (list x))) nil sequence))

(check-equal? (reverse-right (list 1)) (list 1))
(check-equal? (reverse-right (list 1 2)) (list 2 1))
(check-equal? (reverse-right (list 1 4 9 16 25)) (list 25 16 9 4 1))

(define (reverse-left sequence)
  (fold-left 
   (lambda (x y) (cons y x)) nil sequence))

(check-equal? (reverse-left (list 1)) (list 1))
(check-equal? (reverse-left (list 1 2)) (list 2 1))
(check-equal? (reverse-left (list 1 4 9 16 25)) (list 25 16 9 4 1))
