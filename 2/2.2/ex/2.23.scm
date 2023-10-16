(define (for_each proc items)
    (if (not (null? items))
        (begin 
            (proc (car items))
            (for_each proc (cdr items)))))
(for_each (lambda (x) (newline) (display x))
          (list 57 321 88))