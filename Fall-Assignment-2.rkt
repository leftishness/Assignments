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
