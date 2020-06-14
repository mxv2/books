#lang sicp

(#%provide mmap accumulate accumulate-n
           fold-left fold-right)

(define (mmap p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) 
              nil sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (mmap car seqs))
            (accumulate-n op init (mmap cdr seqs)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (accumulate op initial sequence))
