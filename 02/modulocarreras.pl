carrera(ingenieria_sistemas) :- tiene(matematicas), tiene(tecnologia).
carrera(medicina) :- tiene(biologia), tiene(salud).
carrera(derecho) :- tiene(argumentacion), tiene(justicia).
carrera(arquitectura) :- tiene(creatividad), tiene(diseno).
carrera(psicologia) :- tiene(escucha_activa), tiene(salud).
carrera(administracion) :- tiene(liderazgo), tiene(negocios).

tiene(X) :- write('¿Te gusta '), write(X), write('? (si/no): '), read(si).

iniciar :-
    write('Responde las siguientes preguntas:'), nl,
    (carrera(C), write('Podrías estudiar: '), write(C), nl, fail; true).