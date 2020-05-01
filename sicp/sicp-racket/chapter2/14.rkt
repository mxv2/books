#lang sicp

(#%require "intervals.rkt")

(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(define r1 (make-center-percent 100 1))
(define r2 (make-center-percent 100 5))
(define r3 (make-center-percent 100 1))

(exact->inexact (percent (div-interval r1 r2)))
(exact->inexact (percent (div-interval r2 r1)))
(exact->inexact (percent (div-interval r1 r3)))
