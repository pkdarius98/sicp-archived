(define rand
    (let ((x random_init))
        (define (dispatch message)
            (cond ((eq? message 'generate) 
                    (set! x (rand_update x)) 
                    x)
                  ((eq? message 'reset)
                    (lambda (new_value)
                        (set! x new_value))))))
    dispatch)
rand