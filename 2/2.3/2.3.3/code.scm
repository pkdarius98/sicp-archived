;; unordered list
(define (element_of_set? x set)
    (cond ((null? set) (display 1)false)
          ((equal? x (car set)) (display 2)true)
          (else (display 3)(element_of_set? x (cdr set)))))
(define (adjoin_set x set)
    (if (element_of_set? x set)
        set
        (cons x set)))
(define (intersection_set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element_of_set? (car set1) set2) (cons (car set1) (intersection_set (cdr set1) set2)))
          (else (intersection_set (cdr set1) set2))))
(define (union_set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((element_of_set? (car set1) set2) (union_set (cdr set1) set2))
          (else (cons (car set1) (union_set (cdr set1) set2)))))
(define set1 '(1 2))
(adjoin_set 2 set1)

(intersection_set '(1 2 3) '(3 4 5))
(union_set '(1 5) '(3 4 5))

;; ordered list
(define (element_of_set? x set)
    (cond ((null? set) false)
          ((= x (car set)) true)
          ((< x (car set)) false)
          (else (element_of_set? x (cdr set)))))
(define (intersection_set set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1))
              (x2 (car set2)))
            (cond ((= x1 x2) (cons x1 (intersection_set (cdr set1) (cdr set2))))
                  ((< x1 x2) (intersection_set (cdr set1) set2))
                  ((< x2 x1) (intersection_set set1 (cdr set2)))))))
(define (adjoin_set x set)
    (cond ((null? set) (cons x '()))
          ((< x (car set)) (cons x set))
          ((= x (car set)) set)
          (else (cons (car set) (adjoin_set x (cdr set))))))
(adjoin_set 1 '(2 3 4))
(adjoin_set 1 '(0 1 2))
(adjoin_set 1 '(0 2 3))
(adjoin_set 4 '(0 1 2))

(define (union_set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          (else (let ((x1 (car set1))
                      (x2 (car set2)))
                    (cond ((< x1 x2) (cons x1 (union_set (cdr set1) set2)))
                          ((> x1 x2) (cons x2 (union_set set1 (cdr set2))))
                          (else (cons x1 (union_set (cdr set1) (cdr set2)))))))))
(union_set '(1 2 3) '(1 3 5))
(union_set '(0 2 3) '(1 3 5))
(union_set '(3 4 5) '(1 3 5))

;; tree
(define (entry tree) (car tree))
(define (left_branch tree) (cadr tree))
(define (right_branch tree) (caddr tree))
(define (make_tree entry left right)
    (list entry left right))
(define (element_of_set? x set)
    (cond ((null? set) false)
          ((= x (entry set)) true)
          ((< x (entry set)) (element_of_set? x (left_branch set)))
          ((> x (entry set)) (element_of_set? x (right_branch set)))))
(define (adjoin_set x set)
    (cond ((null? set) (make_tree x '() '()))
          ((= x (entry set)) set)
          ((< x (entry set)) (make_tree (entry set) (adjoin_set x (left_branch set)) (right_branch set)))
          ((> x (entry set)) (make_tree (entry set) (left_branch set) (adjoin_set x (right_branch set))))))

(define (tree_to_list_1 tree)
  (if (null? tree)
      '()
      (append 
       (tree_to_list_1 
        (left_branch tree))
       (cons (entry tree)
             (tree_to_list_1 
              (right_branch tree))))))

(define z  (make_tree 1 '() (make_tree 2 '() (make_tree 3 '() (make_tree 4 '() (make_tree 5 '() '()))))))
(tree_to_list_1 z)

(define (tree_to_list_2 tree)
  (define (copy_to_list tree result_list)
    (if (null? tree)
        result_list
        (copy_to_list 
         (left_branch tree)
         (cons (entry tree)
               (copy_to_list 
                (right_branch tree)
                result_list)))))
  (copy_to_list tree '()))

(tree_to_list_2 z)

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
(define (balancing_tree tree)
    (list_to_tree (tree_to_list_1 tree)))