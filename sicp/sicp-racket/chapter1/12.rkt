#lang sicp

(#%require rackunit)

(define (pascal-triangle-element-at width depth)
  (if (or (= width 1) (= width depth))
    1
    (+ (pascal-triangle-element-at (- width 1) (- depth 1))
       (pascal-triangle-element-at width (- depth 1)))))

(check-equal? (pascal-triangle-element-at 3 5) 6)
(check-equal? (pascal-triangle-element-at 5 14) 715)
(check-equal? (pascal-triangle-element-at 8 15) 3432)
(check-equal? (pascal-triangle-element-at 8 10) 36)

