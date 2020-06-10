#lang sicp

(#%require rackunit)

(define (deep-reverse a)
  (define (shift src dest)
    (if (null? src)
      dest
      (shift
        (cdr src) 
        (cons 
          (if (pair? (car src))
            (shift (car src) (list))
            (car src))
          dest))))

  (shift a (list)))

(define x 
  (list (list 1 2) (list 3 4)))

(check-equal? (deep-reverse x) (list (list 4 3) (list 2 1)))
