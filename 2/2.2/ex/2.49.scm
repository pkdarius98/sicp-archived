(define (outline_segment_list frame)
    (let ((oa_vect (origin_frame frame)))
        (let ((ob_vect (add_vect oa_vect (edge1_frame frame)))
              (od_vect (add_vect oa_vect (edge2_frame frame))))
            (let ((oc_vect (add_vect ob_vect (edge2_frame frame))))
                (list oa_vect ob_vect oc_vect od_vect)))))

(define origin_vect (make_vect 1 1))
(define edge1_vect (make_vect 3 1))
(define edge2_vect (make_vect -1 3))
(define frame_1 (make_frame origin_vect edge1_vect edge2_vect))

(define outline_segments_frame_1 (outline_segment_list frame_1))
outline_segments_frame_1
((segments_to_painter outline_segments_frame_1) frame_1)