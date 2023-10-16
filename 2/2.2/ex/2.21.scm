(define (square_list items)
    (map (lambda (x) (* x x)) items))
(square_list (list 1 2 3 4))

(define (scale_list items)
    (if (null? items)
        '()
        (let (x (car items))
            (cons (* x x) (scale_list (cdr items))))))
(square_list (list 1 2 3 4))



(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things)) answer)))) ;; last item will be the first item in square list
  (iter items '()))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer ;; create nested list with 2 item: another nested list and squared item
                    (square (car things))))))
  (iter items '()))
(square-list (list 1 2 3 4))
