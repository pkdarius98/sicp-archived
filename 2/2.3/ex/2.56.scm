(define (exponentiation? x)
    (and (pair? x) (eq? (car x) '^)))

(define (base e)
    (cadr e))

(define (exponent e)
    (caddr e))

(define (make_exponentiation b t)
    (cond ((or (=number? b 0) (=number? b 1) (=number? t 1)) b)
          ((=number? t 0) 1)
          (else (list '^ b t))))

(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp)
                (if (same_variable? exp var) 1 0))
          ((sum? exp)
                (make_sum (deriv (addend exp) var)
                          (deriv (augend exp) var)))
          ((product? exp)
                (make_sum   (make_product (multiplier exp)
                                          (deriv (multiplicand exp) var))
                            (make_product (deriv (multiplier exp) var)
                                          (multiplicand exp))))
          ((exponentiation? exp)
                (make_product (exponent exp)
                              (make_exponentiation (base exp)
                                                   (make_sum (exponent exp) -1))))
          (else (error "unknown expression type: DERIV" exp))))