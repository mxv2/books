#lang sicp

(#%require rackunit)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (ss) (cons (car s) ss)) rest)))))

(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(subsets (list 1 2 3))
