(defglobal ?*nodo-gen* = 0)


(defrule derecha
	?f<-(robot ?x ?y caja $?c almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (< ?x ?x1))
	(not(obstaculo =(+ ?x 1) ?y))
	(test(eq(member$(create$ C (+ ?x 1) ?y) $?c) FALSE))
	(test(eq(member$(create$ A (+ ?x 1) ?y) $?a) FALSE))
	(not(almacen =(+ ?x 1) ?y))
	(test (< ?nivel ?prof))
=>
	(assert (robot (+ ?x 1) ?y caja $?c almacen $?a nivel (+ ?nivel 1) movimiento derecha))
	(bind ?*nodo-gen*(+ ?*nodo-gen* 1)))
	
	
(defrule izquierda
	?f<- (robot ?x ?y caja $?c almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (> ?x 1))
	(not(obstaculo =(- ?x 1) ?y))
	(test(eq(member$(create$ C (- ?x 1) ?y) $?c) FALSE))
	(test(eq(member$(create$ A (- ?x 1) ?y) $?a) FALSE))
	(test (< ?nivel ?prof))
=>
	(assert (robot (- ?x 1) ?y caja $?c almacen $?a nivel (+ ?nivel 1) movimiento izquierda))
	(bind ?*nodo-gen*(+ ?*nodo-gen* 1)))
	
	
(defrule abajo
	?f<- (robot ?x ?y caja $?c almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (< ?y ?y1))
	(not(obstaculo ?x =(+ ?y 1)))
	(test(eq(member$(create$ C ?x (+ ?y 1)) $?c) FALSE))
	(test(eq(member$(create$ A ?x (+ ?y 1)) $?a) FALSE))
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (+ ?y 1) caja $?c almacen $?a nivel (+ ?nivel 1) movimiento abajo))
	(bind ?*nodo-gen*(+ ?*nodo-gen* 1)))
	
	
(defrule arriba
	?f<- (robot ?x ?y caja $?c almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (> ?y 1))
	(not(obstaculo ?x =(- ?y 1)))
	(test(eq(member$(create$ C ?x (- ?y 1)) $?c) FALSE))
	(test(eq(member$(create$ A ?x (- ?y 1)) $?a) FALSE))
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (- ?y 1) caja $?c almacen $?a nivel (+ ?nivel 1) movimiento arriba))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule caja-derecha
	?f<- (robot ?x ?y caja $?c1 =(+ ?x 1) ?y $?c2 almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(not(obstaculo = (+ ?x 1) ?y ))
	(test(eq(member$(create$ C (+ ?x 2) ?y) $?c1) FALSE))
	(test(eq(member$(create$ A (+ ?x 2) ?y) $?a) FALSE))
	(test(eq(member$(create$ C (+ ?x 2) ?y) $?c2) FALSE))
	(test (< (+ ?x 1) ?x1))
	(test (< ?nivel ?prof))
=>
	(assert (robot (+ ?x 1) ?y caja $?c1 (+ ?x 2) ?y $?c2 almacen $?a nivel (+ ?nivel 1) movimiento derecha))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule caja-izquierda

	?f<- (robot ?x ?y caja $?c1 =(- ?x 1) ?y $?c2 almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(not(obstaculo = (- ?x 1) ?y ))
	(test(eq(member$(create$ C (- ?x 2) ?y) $?c1) FALSE))
	(test(eq(member$(create$ A (- ?x 2) ?y) $?a) FALSE))
	(test(eq(member$(create$ C (- ?x 2) ?y) $?c2) FALSE))
	(test (> (- ?x 1) ?x1))
	(test (< ?nivel ?prof))
=>
	(assert (robot (- ?x 1) ?y caja $?c1 (- ?x 2) ?y $?c2 almacen $?a nivel (+ ?nivel 1) movimiento izquierda))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule caja-abajo
	?f<- (robot ?x ?y caja $?c1 ?x =(+ ?y 1) $?c2 almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (< (+ ?y 1) ?y1))
	(not(obstaculo ?x =(+ ?y 1)))
	(test(eq(member$(create$ C ?x (+ ?y 2)) $?c1) FALSE))
	(test(eq(member$(create$ A ?x (+ ?y 2)) $?a) FALSE))
	(test(eq(member$(create$ C ?x (+ ?y 2)) $?c2) FALSE))
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (+ ?y 1) caja $?c1 ?x (+ ?y 2) $?c2 almacen $?a nivel (+ ?nivel 1) movimiento abajo))
	(bind ?*nodo-gen*(+ ?*nodo-gen* 1)))
	
	
(defrule caja-arriba
	?f<- (robot ?x ?y caja $?c1 ?x =(- ?y 1) $?c2 almacen $?a nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(mapa ?x1 ?y1)
	(test (> (- ?y 1) ?y1))
	(test(eq(member$(create$ C ?x (- ?y 2)) $?c1) FALSE))
	(test(eq(member$(create$ C ?x (- ?y 2)) $?c2) FALSE))
	(test(eq(member$(create$ A ?x (- ?y 2)) $?a) FALSE))
	(not(obstaculo ?x =(- ?y 1)))
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (- ?y 1) caja $?c1 ?x (- ?y 2) $?c2 almacen $?a nivel (+ ?nivel 1) movimiento abajo))
	(bind ?*nodo-gen*(+ ?*nodo-gen* 1)))
	
	
(defrule almacen-derecha
	?f<- (robot ?x ?y caja $?c1 C =(+ ?x 1) ?y $?c2 almacen $?a1 =(+ ?x 2) ?y 0 $?a2 nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(test (< ?nivel ?prof))
=>
	(assert (robot (+ ?x 1) ?y caja $?c1 $?c2 almacen $?a1 =(+ ?x 2) ?y 1 $?a2 nivel (+ ?nivel 1) movimiento derecha))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule almacen-izquierda
	?f<- (robot ?x ?y caja $?c1 C =(- ?x 1) ?y $?c2 almacen $?a1 =(- ?x 2) ?y 0 $?a2 nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(test (< ?nivel ?prof))
=>
	(assert (robot (- ?x 1) ?y caja $?c1 $?c2 almacen $?a1 =(- ?x 2) ?y 1 $?a2 nivel (+ ?nivel 1) movimiento izquierda))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule almacen-abajo
	?f<- (robot ?x ?y caja $?c1 C ?x =(+ ?y 1) $?c2 almacen $?a1 ?x =(+ ?y 2) 0 $?a2 nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (+ ?y 1) caja $?c1 $?c2 almacen $?a1 ?x =(+ ?y 2) 1 $?a2 nivel (+ ?nivel 1) movimiento derecha))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))
	
	
(defrule almacen-arriba
	?f<- (robot ?x ?y caja $?c1 C ?x =(- ?y 1) $?c2 almacen $?a1 ?x =(- ?y 2) 0 $?a2 nivel ?nivel movimiento ?mov)
	(profundidad-maxima ?prof)
	(test (< ?nivel ?prof))
=>
	(assert (robot ?x (- ?y 1) caja $?c1 $?c2 almacen $?a1 ?x =(- ?y 2) 1 $?a2 nivel (+ ?nivel 1) movimiento arriba))
	(bind ?*nodo-gen* (+ ?*nodo-gen* 1)))

;; ========================================================
;; =========      ESTRATEGIA DE CONTROL DE BUSQUEDA    ========
;; ========================================================
;; La regla 'objetivo' se utiliza para detectar cuando se ha alcanzado el estado objetivo	

	
(deffunction inicio()
	(reset)
	(printout t "Profundidad maxima:")
	(bind ?prof (read))
	(printout t "Tipo de busqueda " crlf "1.- Anchura" crlf "2.- Profundidad" crlf)
	(bind ?b (read))
	(if (= ?b 1)
		then (set-strategy breadth)
		else (set-strategy depth))
    (printout t " Ejecuta run para poner en marcha el programa " crlf)
	(assert (obstaculo 1 3))
	(assert (obstaculo 4 1))
	(assert (obstaculo 4 3))
	(assert (obstaculo 4 4))
	(assert (obstaculo 4 5))
	(assert (obstaculo 5 3))
	(assert (obstaculo 8 3))
	(assert (mapa 8 5))
	(assert (robot 1 4 caja C 2 2 C 3 4 C 6 2 almacen A 7 1 0 A 5 4 0 A 5 5 0 nivel 0 movimiento nulo))
	(assert (profundidad-maxima ?prof)))
	
	
(defrule objetivo
	(declare (salience 100))
	?f<-(robot ?x ?y caja almacen $?a nivel ?nivel movimiento ?mov)
=>
    (printout t "SOLUCION ENCONTRADA EN EL NIVEL " ?nivel crlf)
    (printout t "NUMERO DE NODOS EXPANDIDOS O REGLAS DISPARADAS " ?*nodo-gen* crlf)
    
    (halt))
	
	
(defrule no_solucion
	(declare (salience -99))
	
=> 	
	(printout t "SOLUCION NO ENCONTRADA" crlf)
	(printout t "NUMERO DE NODOS GENERADOS " ?*nodo-gen* crlf)
	
	(halt))

