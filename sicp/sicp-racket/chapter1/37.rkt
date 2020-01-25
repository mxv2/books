#lang sicp

(define (cont-frac n d k)
  (define (recr n d i)
    (if (= i k)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (recr n d (+ i 1))))))
  (recr n d 1))

(let 
  ((k 11)
   (one (lambda (i) 1.0)))
  (cont-frac one one k))

