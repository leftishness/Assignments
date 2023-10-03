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
(define stretch
  (lambda (func n)
    (lambda (x)
      (cond
        [(= x n) (not (func n))]
        [else (func x)]))))

;((stretch even? 1) 0)
;((stretch even? 1) 1)
;((stretch even? 1) 2)
;((stretch even? 1) 3)
;(filter (stretch even? 1) '(0 1 2 3 4 5))
;(filter (stretch (stretch even? 1) 3) '(0 1 2 3 4 5))
;(filter (stretch (stretch (stretch even? 1) 3) 7) '(0 1 2 3 4 5))

; problem 4
(define walk-symbol
  (lambda (x s)
    (cond
      [(assv x s) (walk-symbol (cdr (assv x s)) s)]
      [else x])))

;(walk-symbol 'a '((a . 5)))
;(walk-symbol 'a '((b . c) (a . b)))
;(walk-symbol 'a '((a . 5) (b . 6) (c . a)))
;(walk-symbol 'c '((a . 5) (b . (a . c)) (c . a)))
;(walk-symbol 'b '((a . 5) (b . ((c . a))) (c . a)))
;(walk-symbol 'd '((a . 5) (b . (1 2)) (c . a) (e . c) (d . e)))
;(walk-symbol 'd '((a . 5) (b . 6) (c . f) (e . c) (d . e)))

; problem 5
