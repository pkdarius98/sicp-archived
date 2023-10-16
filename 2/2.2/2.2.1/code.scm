(define one_through_for (list 1 2 3 4))
(car one_through_for)
(cdr one_through_for)

(car (cdr one_through_for))

(define (list_ref items n)
    (if (= n 0)
        (car items)
        (list_ref (cdr items) (- n 1))))
(list_ref one_through_for 3)

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))
(define (length items)
    (define (iter a count)
        (if (null? a)
            count
            (iter (cdr a) (+ count 1))))
    (iter items 0))
(define odd (list 1 3 5 7))
(length odd)

(define square (list 1 4 9 16 25))
(append square odd)

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))
(append square odd)

(define (scale_list items factor)
    (if (null? items)
        '()
        (cons (* (car items) factor) (scale_list (cdr items) factor))))
(scale_list (list 1 2 3 4 5) 10)


(define (map proc items)
    (if (null? items)
        '()
        (cons   (proc (car items))
                (map proc (cdr items)))))
(map abs (list -10 2.5 -11.6 17))

(map (lambda (x) (* x x))
     (list 1 2 3 4))

