;Кирюшин ивбо0517
;Практическая №2
    ;Задание 2
    ;Чтение файла и вывод его содержимого (файл текстовый)
(defun readFile(path)
(let ((in (open path :if-does-not-exist :create)))
    ;Открывает файл на чтение (по умолчанию), если его нет создает
      (when in
            (loop for line = (read-line in nil)
            while line do (format t "~a~%" line))
      (close in)))
)

(print ( readFile "file.txt"  ) )