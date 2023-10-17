(define (make_mobile left right)
    (list left right))
(define (left_branch mobile)
    (car mobile))
(define (right_branch mobile)
    (car (cdr mobile)))

(define (make_branch length structure)
    (list length structure))
(define (branch_length branch)
    (car branch))
(define (branch_structure branch)
    (cdr branch))

