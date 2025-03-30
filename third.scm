#lang scheme


;slowly drains elements from right creating pairs left+right1 x right2
(define (elem-permute left x right)
  (define new (append left (cons x right)))

  (if (null? right)  (list new)
       (cons  new
             (elem-permute
                 (append left (list(car right)))
                 x
                 (cdr right)

              )))
   )

;generates all permutations of a list l
(define  (my_permutations l)
  (if (null? (cdr l)) (list l)
  (foldl (λ (perm acc)
           (append acc (elem-permute null (car l) perm))
           )
         null
         (my_permutations (cdr l))
   )
))

;(elem-permute null 'x '(1 2 3 4) )

(my_permutations '(1 2 3))