(deffacts datos
   (vector1 B C A D E E B C E)
   (vector2 E E B C A F E))

(defrule calcular-union
   (vector1 $?lista1)
   (vector2 $?lista2)
   =>
   (bind ?union (create$)) ; Inicializa el conjunto vacío
   (foreach ?elemento ?lista1
      (if (member$ (create$ ?elemento) ?lista2) then
         (if (not (member$ (create$ ?elemento) ?union)) then
            (bind ?union (create$ ?union ?elemento)) ; Agrega el elemento a la unión
         )
      )
   )
   (assert (union ?union))) ; Inserta la unión en la base de hechos

(defrule mostrar-union
   (union $?resultado)
   =>
   (printout t "Union: " ?resultado crlf))