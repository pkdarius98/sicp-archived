(define (tree_to_list_1 tree)
  (if (null? tree)
      '()
      (append 
       (tree_to_list_1 
        (left-branch tree))
       (cons (entry tree)
             (tree_to_list_1 
              (right-branch tree))))))

(tree_to_list_1 (list 3 (list 2) (list 1)))

(define (tree_to_list_2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list 
         (left-branch tree)
         (cons (entry tree)
               (copy-to-list 
                (right-branch tree)
                result-list)))))
  (copy-to-list tree '()))

(tree_to_list_2 (list 3 (list 2) (list 1)))