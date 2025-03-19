#lang scheme
;flattens a list recursively
(define (my-flat l)
  (foldl (λ (x acc)
           (append acc
              (if (list? x) 
                 (my-flat x)
                 (list x))))
    null l)
 )

(my-flat '(1 2 3 (222 (2 1) 2)))