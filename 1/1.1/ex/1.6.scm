(define (new_if predicate then_clause else_clause)
  (cond (predicate then_clause)
        (else else_clause))) ; new_if will evaluate all operands, while "if" will not