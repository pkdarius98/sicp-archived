(define sample_tree 
    (make_code_tree 
        (make_leaf 'A 4)
        (make_code_tree
            (make_leaf 'B 2)
            (make_code_tree
                (make_leaf 'D 1)
                (make_leaf 'C 1)))))
sample_tree
(define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(decode sample_message sample_tree)