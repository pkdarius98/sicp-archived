(define (make_table same_key?)
    (let ((local_table (list '*table*)))
        (define (assoc key records)
            (cond ((null? records) false)
                ((same_key? key (caar records)) (car records))
                (else (assoc key (cdr records)))))
        (define (lookup . key)
            (define (lookup_iter keys table)
                (let ((sub_table (assoc (car key) table)))
                    (if sub_table
                        (if (null? (cdr key))
                            (cdr sub_table)
                            (lookup_iter (cdr keys) sub_table))
                        false)))
            (lookup_iter keys local_table))
        (define (insert! value . keys)
            (define (insert_iter! keys table)
                (let ((sub_table (assoc (car keys) (cdr table))))
                    (if sub_table
                        (if (null? (cdr keys))
                            (set-cdr! sub_table value)
                            (insert_iter! (cdr key) sub_table))
                        (set-cdr! table ))))


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
(define operation_table (make_table (lambda (x y) (= x y))))
(define get (operation_table 'lookup))
(define put (operation_table 'insert!))
(put 1 2 1)
(get 1 2)