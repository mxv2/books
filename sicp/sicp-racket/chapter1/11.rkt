#lang sicp

(#%require rackunit)

(define (f-rp n)
  (if (< n 3)
    n
    (+ (f-rp (- n 1))
       (+ (* 2 (f-rp (- n 2)))
          (* 3 (f-rp (- n 3)))))))

(check-equal? (f-rp 2) 2)
(check-equal? (f-rp 3) 4)
(check-equal? (f-rp 4) 11)
(check-equal? (f-rp 5) 25)

(define (f-ip n)
  (if (< n 3)
    n
    (f-ip-iter n 3 0 1 2)))

(define (f-ip-iter n current f1 f2 f3)
  (define (calc_f f1 f2 f3)
    (+ f3 (+ (* 2 f2) (* 3 f1))))

  (if (= current n) 
    (calc_f f1 f2 f3)
    (f-ip-iter n (+ current 1) f2 f3 (calc_f f1 f2 f3))))

(check-equal? (f-ip 2) 2)
(check-equal? (f-ip 3) 4)
(check-equal? (f-ip 4) 11)
(check-equal? (f-ip 5) 25)

