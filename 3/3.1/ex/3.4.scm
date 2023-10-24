(define (make_account password balance)
    (let ((wrong_time 0))
        (define (withdraw amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount))
                        balance)
                    "Insufficient funds"))
        (define (deposit amount)
            (set! balance (+ balance amount))
            balance)
        (define (call_the_cops)
            "Call_the_cops")
        (define (warning _)
            (if (< wrong_time 7)
                (begin (set! wrong_time (+ 1 wrong_time))
                    "Incorrect password")
                (call_the_cops)))
        (define (dispatch p m)
            (cond ((not (eq? p password)) warning)
                ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request:  MAKE_ACCOUNT" m))))
        dispatch))
(define acc (make_account '123 100))
((acc '123 'withdraw) 50)
((acc '12 'withdraw) 60)
((acc '123 'deposit) 40)
((acc '123 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)
((acc '12 'withdraw) 60)