#lang sicp

(#%require rackunit)

(define (fringe tree)
  (define (fringe-leaf src dest)
    (if (null? src)
        dest
        (if (not (pair? (car src)))
            (cons (car src)
                  (fringe-leaf (cdr src) dest))
            (append (fringe-leaf (car src) (list))
                    (fringe-leaf (cdr src) dest)))))
  
  (fringe-leaf tree (list)))

(define x 
  (list (list 1 2) (list 3 4)))

(check-equal? (fringe x) (list 1 2 3 4))
(check-equal? (fringe (list x x)) (list 1 2 3 4 1 2 3 4))
