(define (queens2 board_size)
    (define (queen_cols k)
        (if (= k 0)
            (list '())
            (filter
                (lambda (positions)
                    (safe? k positions)
                    )
                (flatmap
                    (lambda (new_row)
                        (map (lambda (rest_of_queens)
                                (adjoin_position new_row k rest_of_queens))
                            (queen_cols (- k 1))))
                    (enumerate_interval 1 board_size)))))
    (queen_cols board_size))
;; T2 = (board_size^board_size) T