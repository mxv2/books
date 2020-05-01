#lang sicp

(#%provide 
  make-interval 
  width
  upper-bound 
  lower-bound 
  add-interval 
  sub-interval 
  mul-interval 
  div-interval)

(define (make-interval a b) (cons a b))

(define (upper-bound z)
  (cdr z))

(define (lower-bound z)
  (car z))

(define (width z)
  (/ (- (upper-bound z) (lower-bound z)) 2))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (sub-interval x y)
  (make-interval 
    (- (lower-bound x) (upper-bound y))
    (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond 
        ((and (> lx 0) (> ly 0)) (make-interval (* lx ly) (* ux uy)))
        ((and (> lx 0) (< ly 0) (>= uy 0)) (make-interval (* ux ly) (* ux uy)))
        ((and (> lx 0) (< uy 0)) (make-interval (* ux ly) (* lx uy)))
        
        ((and (< ux 0) (>= ly 0)) (make-interval (* lx uy) (* ux uy)))
        ((and (< ux 0) (< ly 0) (>= uy 0)) (make-interval (* lx uy) (* ux uy)))
        ((and (< ux 0) (< uy 0)) (make-interval (* ux uy) (* lx ly)))

        ((and (< lx 0) (>= ux 0) (>= ly 0)) (make-interval (* lx uy) (* ux uy)))
        ((and (< lx 0) (>= ux 0) (< uy 0)) (make-interval (* ux ly) (* lx ly)))
        
        (else (make-interval 
                  (min (* lx uy) (* ux ly))
                  (max (* lx ly) (* ux uy)))))))

(define (div-interval x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
    (error "dividing to zero")  
    (mul-interval x 
                  (make-interval 
                    (/ 1 (upper-bound y)) 
                    (/ 1 (lower-bound y))))))
