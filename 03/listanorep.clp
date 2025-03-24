(deffacts datos
   (vector1 B C A D E E B C E)
   (vector2 E E B C A F E))

(defrule calcular-union
   (vector1 $?lista1)
   (vector2 $?lista2)
   =>
   (bind ?union (create$))
   (foreach ?elemento ?lista1
      )))
)

(defrule mostrar-union
   (union $?resultado)
   =>
   (printout t "Union: " ?resultado crlf))

