(define (assoc key records)
    (cond ((null? records) false)
          ((equal? key (caar records)) (car records))
          (else (assoc key (cdr records)))))
(define (lookup key table)
    (let ((record (assoc key (cdr table))))
        (if record
            (cdr record)
            false)))
(define (insert! key value table)
    (let ((record (assoc key (cdr table))))
        (if record
            (set-cdr! record value)
            (set-cdr! table
                      (cons (cons key value)
                            (cdr table)))))
    'ok)
(define (make_table)
    (list '*table*))
(define table_a (make_table))
(lookup 'a table_a)
(insert! 'a 'b table_a)
(lookup 'a table_a)

;; 2-d table
(define (lookup key_1 key_2 table)
    (let ((sub_table (assoc key_1 (cdr table))))
        (if sub_table
            (let ((record (assoc key_2 (cdr sub_table))))
                (if record
                    (cdr record)
                    false))
            false)))
(define (insert! key_1 key_2 value table)
    (let ((sub_table (assoc key_1 (cdr table))))
        (if sub_table
            (let ((record (assoc key_2 (cdr table))))
                (if record
                    (set-cdr! record value)
                    (set-cdr! sub_table
                              (cons (cons key_2 value)
                                    (cdr sub_table)))))
            (set-cdr! table 
                      (cons (list key_1 (cons key_2 value))
                            (cdr table)))))
    'ok)

;; local tables
(define (make_table)
    (let ((local_table (list '*table*)))
        (define (lookup key_1 key_2)
            (let ((sub_table (assoc key_1 (cdr local_table))))
                (if sub_table
                    (let ((record (assoc key_2 (cdr sub_table))))
                        (if record
                            (cdr record)
                            false))
                    false)))
        (define (insert! key_1 key_2 value)
            (let ((sub_table (assoc key_1 (cdr local_table))))
                (if sub_table
                    (let ((record (assoc key_2 (cdr sub_table))))
                        (if record
                            (set-cdr! record value)
                            (set-cdr! sub_table
                                      (cons (cons key_2 value)
                                            (cdr sub_table)))))
                    (set-cdr! local_table
                              (cons (list key_1 (cons key_2 value))
                                    (cdr local_table)))))
            'ok)
        (define (dispatch m)
            (cond ((eq? m 'lookup) lookup)
                  ((eq? m 'insert!) insert!)
                  (else (error "Unknown operation: TABLE" m))))
        dispatch))
(define operation_table (make_table))
(define get (operation_table 'lookup))
(define put (operation_table 'insert!))
(put 'a 'b 1)
(get 'a 'b)