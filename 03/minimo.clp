(deftemplate numeros
   (multislot valores))

(deffacts datos
   (numeros (valores 3 5 8)))

(defglobal ?*min* = 1000000000)

(defrule encontrar-minimo
   (numeros (valores $?lista))
   =>
   (foreach ?v ?lista
      (if (> ?*min* ?v) then
         (bind ?*min* ?v)
      )
   )
   (printout t "menor: " ?*min* crlf)
)


