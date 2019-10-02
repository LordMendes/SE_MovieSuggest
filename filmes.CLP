(deftemplate Qnt (slot qnt))
(deftemplate Final ( slot final))
(deftemplate Principal (slot principal))
(deftemplate Personagem (slot personagem))
(deftemplate Classe ( slot classe))
(deftemplate ParteMelhor ( slot parteMelhor))
(deftemplate Atores (slot atores))
(deftemplate Alcance (slot alcance))
(deftemplate Oscar (slot oscar))

; ------------------
; -----ENTRADAS-----
; ------------------

(defrule getQnt 
	(declare (salience 800))
	=>
	(printout t "Você prefere filmes com que tipo continuidade?(trilogia/saga/unico): ")
	(bind ?response (read))
	(assert (Qnt (qnt ?response))))

(defrule getFinal
	(declare (salience 800))
	=>
	(printout t "Você prefere que tipo de final? (feliz/triste): ")
	(bind ?response (read))
	(assert (Final (final ?response))))

(defrule getPrincipal
	(declare (salience 500))
	=>
	(printout t "Você prefere que quantidade de personagens principais?(único/grupo): ")
	(bind ?response (read))
	(assert (Principal (principal ?response))))

(defrule getPersonagem
	(declare (salience 900))
	=>
	(printout t "Você prefere filmes com personagens humanos ou animais/objetos(humanos/objetos): ")
	(bind ?response (read))
	(assert (Personagem (personagem ?response))))

(defrule getClasse
	(declare (salience 1000))
	=>
	(printout t "Qual classe de filme você prefere?(fantosioso/realista/documental): ")
	(bind ?response (read))
	(assert (Classe (classe ?response))))

(defrule getParteMelhor
	(declare (salience 400))
	=>
	(printout t "O que é mais importate pra você?(final/contexto): ")
	(bind ?response (read))
	(assert (ParteMelhor (parteMelhor ?response))))

(defrule getAtores
	(declare (salience 400))
	=>
	(printout t "Atores/Atrizes famosos são importante?(sim/não): ")
	(bind ?response (read))
	(assert (Atores (atores ?response))))

(defrule getAlcance
	(declare (salience 700))
	=>
	(printout t "Você prefere filme com que alcance?(blocksbuster/cult): ")
	(bind ?response (read))
	(assert (Alcance (alcance ?response))))

(defrule getOscar
	(declare (salience 600))
	=>
	(printout t "Oscar é importante?(sim/não): ")
	(bind ?response (read))
	(assert (Oscar (oscar ?response))))

;---------------------------
;--------REGRAS-------------
;---------------------------