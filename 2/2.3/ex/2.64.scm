(define (list_to_tree elements)
    (car (partial_tree elements (length elements))))
(define (partial_tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left_size (quotient (- n 1) 2)))
            (let ((left_result (partial_tree elts left_size)))
                (let ((left_tree (car left_result))
                      (non_left_elts (cdr left_result))
                      (right_size (- n (+ left_size 1))))
                    (let ((this_entry (car non_left_elts))
                          (right_result (partial_tree (cdr non_left_elts) right_size)))
                        (let ((right_tree (car right_result))
                              (remain_elts (cdr right_result)))
                            (cons (make_tree this_entry left_tree right_tree)
                                  remain_elts))))))))
(list_to_tree '(1 2 3))