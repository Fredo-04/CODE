(deftemplate Pais
   (slot Nombre)
   (multislot Bandera))

(deffacts datos
   (Pais (Nombre Argentina) (Bandera Blanco Celeste))
   (Pais (Nombre España) (Bandera Rojo Amarillo))
   (Pais (Nombre Francia) (Bandera Azul Blanco Rojo))
   (Pais (Nombre Brasil) (Bandera Verde Amarillo Azul Blanco))
   (Pais (Nombre Alemania) (Bandera Negro Rojo Amarillo))
   (Pais (Nombre Italia) (Bandera Verde Blanco Rojo)))

(deffacts consulta
   (ColoresABuscar Blanco Amarillo))

(defrule buscar-paises
   (ColoresABuscar $?colores)
   (Pais (Nombre ?nombre) (Bandera $?bandera))
   (test (subsetp ?colores ?bandera))
   =>
   (printout t "El pais " ?nombre " tiene todos los colores especificados en su bandera." crlf))
