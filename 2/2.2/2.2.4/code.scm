; (define wave2 (beside wave (flip_vert wave)))
; (define wave4 (below wave2 wave2))

; (define (flipped_pairs painers)
;     (let ((painter2 (beside painter (flip_vert painers))))
;         (below painter2 painter2)))
; (define wave4 (flipped_pairs wave))

; (define (right_split painter n)
;     (if (= n 0)
;         painter
;         (let ((smaller (right_split painter (- n 1))))
;             (beside painter (below smaller smaller)))))
; (define (up_split painter n)
;     (if (= n 0)
;         painter
;         (let ((smaller (up_split painter (- n 1))))
;             (below (beside smaller smaller) painter))))
; (define (corner_split painter n)
;     (if (= n 0)
;         painter
;         (let ((up (up_split painter (- n 1)))
;               (right (right_split painter (- n 1)))
;             (let ((top_left (beside up up))
;                   (bottom_right (below right right))
;                   (corner (corner_split painter (- n 1))))
;                 (beside (below painter top_left)
;                         (below bottom_right corner)))))))

; (define (square_limit painter n)
;     (let ((quarter (corner_split painter n)))
;         (let ((half (beside (flip_horizontal quarter) quarter)))
;             (below (flip_vert half) half))))

; (define (square_of_for tl tr bl br)
;     (lambda (painter)
;         (let ((top (beside (tl painter)
;                            (tr painter)))
;               (bottom (beside (bl painter)
;                               (br painter))))
;             (below bottom top))))

; (define (flipped_pairs painter)
;     (let ((combine4 (square_of_for identity flip_vert identity flip_vert)))
;         (combine4 painter)))

; (define (square_limit painter n)
;     (let ((combine4 (square_of_for flip_horizontal identity rotate180 flip_vert)))
;         (combine4 (corner_split painter n))))

(define (frame_coord_map frame)
    (lambda (v)
        (add_vect
            (origin_frame frame)
            (add_vect
                (scale_vect (xcor_vect v)
                            (edge1_frame frame))
                (scale_vect (ycor_vect v)
                            (edge2_frame frame))))))

(define (make_vect x y)
    (cons x y))

(define (xcor_vect v)
    (car v))

(define (ycor_vect v)
    (cdr v))

(define (add_vect v1 v2)
    (make_vect (+ (xcor_vect v1) (xcor_vect v2))
               (+ (ycor_vect v1) (ycor_vect v2))))

(define (sub_vect v1 v2)
    (make_vect (- (xcor_vect v1) (xcor_vect v2))
               (- (ycor_vect v1) (ycor_vect v2))))

(define (scale_vect v n)
    (make_vect (* (xcor_vect v) n)
               (* (ycor_vect v) n)))

(define (make_frame origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

(define (origin_frame frame)
    (car frame))

(define (edge1_frame frame)
    (car (cdr frame)))

(define (edge2_frame frame)
    (cdr (cdr frame)))

(define (for_each proc items)
    (if (not (null? items))
        (begin 
            (proc (car items))
            (for_each proc (cdr items)))))

(define (segments_to_painter segment_list)
    (lambda (frame)
        (for_each
            (lambda (segment)
                (newline)(display "segment: ")(display segment)
                (draw_line
                    ((frame_coord_map frame) (start_segment segment))
                    ((frame_coord_map frame) (end_segment segment))))
            segment_list)))

(define (make_segment vect_start vect_end)
    (cons vect_start vect_end))
(define (start_segment segment)
    (car segment))
(define (end_segment segment)
    (cdr segment))