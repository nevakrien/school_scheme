#lang scheme

;needs work

(define (set-dif a b)
  (define (is-in x s)
    (if (null? s) #f
    (if (equal? (car s) x) #t (is-in x (cdr s)))
    ))

  (define (get-missing in ref)
    (foldr (λ (x acc) (if (is-in x ref)
          acc (cons x acc )))
     '()
     in
   ))

  (append (get-missing a b) (get-missing b a))
)

(set-dif '(a b c d) '(x b d w))  