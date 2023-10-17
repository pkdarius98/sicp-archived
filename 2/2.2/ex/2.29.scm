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
    (car (cdr branch)))

(define branch_a (make_branch 1 2))
(define branch_b (make_branch 2 2))
(define mobile_a (make_mobile branch_a branch_b))
(define mobile_b (make_mobile branch_a branch_b))

(define branch_c (make_branch 3 mobile_a))
(define branch_d (make_branch 4 mobile_b))

(define mobile_c (make_mobile branch_c branch_d))
mobile_c
(left_branch mobile_c)
(branch_length (left_branch mobile_c))
(right_branch mobile_c)
(branch_structure (left_branch mobile_c))

(define (total_weight mobile)
    (cond ((null? mobile) 0)
          ((not (pair? mobile)) mobile)
          (else (+ (total_weight (branch_structure (left_branch mobile)))
                   (total_weight (branch_structure (right_branch mobile)))))))
(total_weight mobile_c)

(define (torque branch)
    (* (branch_length branch) (total_weight (branch_structure branch))))
branch_c
(torque branch_c)

(define (balanced? mobile)
    (if (not (pair? mobile))
        true
        (and (= (torque (left_branch mobile)) (torque (right_branch mobile)))
             (balanced? (branch_structure (left_branch mobile)))
             (balanced? (branch_structure (right_branch mobile))))))
(balanced? mobile_c)