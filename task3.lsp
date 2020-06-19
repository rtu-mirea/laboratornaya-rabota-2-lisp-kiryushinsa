;Кирюшин ивбо0517
;Практическая №2

    ;Задание 3
        ;Сжатие/разжатие списка
        ;(list 1 1 1 1 0 1 0 0 0 0 0 0 1 1) =>  ((4 1) 0 1 (6 0) (2 1))
        ;Задание состоит в том, чтобы написать 2 функции:
            ;1. compress, которая выполняет сжатие
            ;2. decompress, которая возвращает список к нормальному виду

(defun compress (lst &optional (flag 1))
  (cond
    ((null lst) nil) ;при отсутствии элементов 
    ((equal (car lst) (cadr lst)) (compress (cdr lst) (+ 1 flag))) ;если два числа подряд одинаковые, то прибавить флаг
    ((> flag 1) (cons (cons (car lst) (list flag)) (compress (cdr lst)))) ; конкатенация в один список количества вхождений и маркера числа(или символа)
    (t (cons (car lst) (compress (cdr lst))))
    ))


(defun decompress (lst &optional (flag 0))
  (cond
    ((null lst) nil)
    ((atom (car lst)) (cons (car lst) (decompress (cdr lst))))
    ((if (< flag (cadar lst))
         (cons (caar lst) (decompress lst (+ 1 flag)))
         (decompress (cdr lst))))
    ))



(print (compress '(8 8 8 1 2 2 3 9 9 1 1 1 1 3 4 5)))
(print (decompress ( compress '(8 8 8 1 2 2 3 9 9 1 1 1 1 3 4 5))))