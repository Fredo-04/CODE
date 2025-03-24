(deftemplate numero
   (slot valor))

(deffacts datos
   (numero (valor 2))
   (numero (valor 5))
   (numero (valor 8))
)

(defglobal ?*suma* = 0)

(defrule sumar-elementos
   (numero (valor ?v))
   =>
   (bind ?*suma* (+ ?*suma* ?v)))

(defrule mostrar-suma
   (declare (salience -10))
   =>
   (printout t "La suma total es: " ?*suma* crlf))