#lang racket

(#%require rackunit)

(define (last-pair list)
  (if (null? list)
    (error "empty list")
    (if (null? (cdr list))
      list
      (last-pair (cdr list)))))

(check-equal? (last-pair (list 23 72 149 34)) (list 34))
(check-exn exn:fail? (lambda () (last-pair (list))))
