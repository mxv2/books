#lang sicp

(define (cont-frac n d k)
  (define (recr n d i)
    (if (= i k)
      (/ (n k) (d k))
      (/ (n i) (+ (d i) (recr n d (+ i 1))))))
  (recr n d 1))

(define (d-euler i)
  (if (< (remainder i 3) 2)
             1.0
             (* 2.0 (/ (+ i 1) 3))))

(let 
  ((k 15)
   (one (lambda (i) 1.0)))
  (cont-frac one d-euler k))

