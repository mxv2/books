(#%require racket/include)
(include "smallest_divisor.rkt")

(define (prime? n)
    (= n (smallest-divisor n)))

