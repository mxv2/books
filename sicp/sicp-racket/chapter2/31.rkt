#lang sicp

(#%require rackunit)

(define (tree-map term tree)
  (map (lambda (sub-tree)
               (if (pair? sub-tree)
                   (tree-map term sub-tree)
                   (term sub-tree)))
        tree))

(define (square x)
  (* x x))

(define (square-tree tree) 
  (tree-map square tree))

(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(check-equal? (square-tree tree)
              (list 1
                    (list 4 (list 9 16) 25)
                    (list 36 49)))
