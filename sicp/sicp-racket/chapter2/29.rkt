#lang sicp

(#%require rackunit)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (mobile? x)
    (list? x))

(define (branch-weight b)
  (let ((bs (branch-structure b)))
    (if (mobile? bs)
        (total-weight bs)
        bs)))

(define (total-weight m)
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))

(define m1 (make-mobile (make-branch 1 1) (make-branch 2 2)))
(define m2 (make-mobile (make-branch 5 10) (make-branch 5 m1)))

(check-equal? (total-weight m1) 3)
(check-equal? (total-weight m2) 13)

(define (balanced? m)
  (define (torque b)
    (* (branch-weight b) (branch-length b)))

  (let ((l (left-branch m))
        (ls (branch-structure (left-branch m)))
        (r (right-branch m))
        (rs (branch-structure (right-branch m))))
    (and (= (torque l) (torque r))
         (if (mobile? ls) (balanced? ls) #t)
         (if (mobile? rs) (balanced? rs) #t))))

(check-equal? (balanced? m1) #f)
(check-equal? (balanced? m2) #f)

(define m3 (make-mobile (make-branch 10 2)
                        (make-branch 10 2)))

(check-equal? (balanced? m3) #t)
