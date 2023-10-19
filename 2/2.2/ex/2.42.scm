(define (adjoin_position row col board)
    (cons (list row col) board))

(define (check? a b)
    (let ((xa (car a))
          (ya (car (cdr a)))
          (xb (car b))
          (yb (car (cdr b))))
        (or  (= xa xb)
             (= ya yb)
             (= (abs (- xa xb)) (abs (- ya yb)))
             )))

(define (safe? k positions)
    (define (iter current positions)
        (if (null? positions)
            #t
            (and (not (check? current (car positions)))
                (iter current (cdr positions)))))
                
    (iter (car positions) (cdr positions)))

(define (queens board_size)
    (define (queen_cols k)
        (if (= k 0)
            (list '())
            (filter
                (lambda (positions)
                    (safe? k positions)
                    )
                (flatmap 
                    (lambda (rest_of_queens)
                        (map 
                            (lambda (new_row)
                                (adjoin_position new_row k rest_of_queens))
                            (enumerate_interval 1 board_size)))
                    (queen_cols (- k 1))))))
    (queen_cols board_size))
(length (queens 8))