#lang racket

; problem 1
(define list-ref
  (lambda (ls n)
    (letrec
      ([nth-cdr (lambda (n)
                  (cond
                    [(= n 0) ls]
                    [else (nth-cdr (sub1 n)) (cdr ls)])
                  )])
      (car (nth-cdr n)))))

;(list-ref '(a b c) 2)
;(list-ref '(a b c) 0)

; problem 2
(define union
  (lambda (lst1 lst2)
    (cond
      [(null? lst2) lst1]
      [(memv (car lst2) lst1) (union lst1 (cdr lst2))]
      [else (cons (car lst2) (union lst1 (cdr lst2)))])))

;(union '() '())
;(union '(x) '())
;(union '(x) '(x))
;(union '(x y) '(x z))

; problem 3
