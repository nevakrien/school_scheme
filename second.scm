#lang scheme

;finds the semetric diffrence of 2 lists
;this function has stable indexing
(define (set-dif a b)
  ;checks if the element x is in the list s
  (define (is-in x s)
    (if (null? s) #f
    (if (equal? (car s) x) #t (is-in x (cdr s)))
    ))

  ;gathers all elementts in "in" that are not in "ref"
  (define (get-missing in ref)
    (foldr (λ (x acc) (if (is-in x ref)
          acc (cons x acc )))
     '()
     in
   ))

  (append (get-missing a b) (get-missing b a))
)

(set-dif '(a b c d) '(x b d w))  