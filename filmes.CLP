(deftemplate Qnt (slot qnt))
(deftemplate Final ( slot final))
(deftemplate Principal (slot principal))
(deftemplate Personagem (slot personagem))
(deftemplate Classe ( slot classe))
(deftemplate ParteMelhor ( slot parteMelhor))
(deftemplate Atores (slot atores))
(deftemplate Alcance (slot alcance))
(deftemplate Oscar (slot oscar))
(deftemplate Faixa (slot faixa))

; ------------------
; -----ENTRADAS-----
; ------------------

(defrule getQnt 
  	(declare (salience 100))
	=>
	(printout t "Você prefere filmes com que tipo continuidade?(trilogia/saga/unico): ")
	(bind ?response (read))
	(assert (Qnt (qnt ?response))))

(defrule getFinal
  	(declare (salience 100))
	=>
	(printout t "Você prefere que tipo de final? (feliz/triste): ")
	(bind ?response (read))
	(assert (Final (final ?response))))

(defrule getPrincipal
  	(declare (salience 100))
	=>
	(printout t "Você prefere que quantidade de personagens principais?(unico/grupo): ")
	(bind ?response (read))
	(assert (Principal (principal ?response))))

(defrule getPersonagem
  	(declare (salience 100))
	=>
	(printout t "Você prefere filmes com personagens humanos ou animais/objetos(humanos/objetos): ")
	(bind ?response (read))
	(assert (Personagem (personagem ?response))))

(defrule getClasse
	(declare (salience 100))
	=>
	(printout t "Qual classe de filme você prefere?(fantosioso/realista/documental): ")
	(bind ?response (read))
	(assert (Classe (classe ?response))))

(defrule getParteMelhor
	(declare (salience 100))
	=>
	(printout t "O que é mais importate pra você?(final/contexto): ")
	(bind ?response (read))
	(assert (ParteMelhor (parteMelhor ?response))))

(defrule getAtores
	(declare (salience 100))
	=>
	(printout t "Atores/Atrizes famosos são importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Atores (atores ?response))))

(defrule getAlcance
	(declare (salience 100))
	=>
	(printout t "Você prefere filme com que alcance?(blocksbuster/cult): ")
	(bind ?response (read))
	(assert (Alcance (alcance ?response))))

(defrule getOscar
   	(declare (salience 100))
	=>
	(printout t "Oscar é importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Oscar (oscar ?response))))

(defrule getFaixa
   	(declare (salience 100))
	=>
	(printout t "Qual a faixa indicativa que melhor reflete sua preferência(infantil/familia/adulto): ")
	(bind ?response (read))
	(assert (Faixa (faixa ?response))))

;---------------------------
;--------REGRAS-------------
;---------------------------
; A Fantastica Fabrica de Chocolate
(defrule filme1
	(Qnt (qnt unico ))
	(Final (final feliz ))
	(or (Principal (principal grupo )) (Principal (principal unico)))
	(Personagem (personagem humanos ))
	(Classe (classe fantasioso ))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor final)))
	(Atores (atores nao ))
	(Alcance (alcance cult ))
	(Oscar (oscar nao ))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "A fantástica Fabrica de Chocolate (1971)" crlf))

;Velozes e Furiosos
(defrule filme2
	(Qnt (qnt saga))
	(or (Final (final feliz)) (Final (final triste)))
	(Principal (principal grupo ))
	(Personagem (personagem humanos ))
	(or (Classe (classe realista )) (Classe (classe fantasioso)))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores sim))
	(Alcance (alcance blocksbuster))
	(Oscar (oscar nao ))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "Filmes de Velozes e Furiosos" crlf))

; Filmes da Marvel
(defrule filme3
	(Qnt (qnt saga ))
	(or (Final (final feliz )) (Final (final triste)))
	(or (Principal (principal grupo )) (Principal (principal unico)))
	(or (Personagem (personagem humanos )) (Personagem (personagem objetos)))
	(Classe (classe fantasioso ))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores sim ))
	(Alcance (alcance blocksbuster ))
	(or (Oscar (oscar nao )) (Oscar (oscar sim))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "Filmes da Marvel (2008 - 2019)" crlf))

; Senhor do Anéis
(defrule filme4
	(Qnt (qnt trilogia))
	(or (Final (final feliz )) (Final (final triste)))
	(Principal (principal grupo ))
	(or (Personagem (personagem humanos )) (Personagem (personagens objetos)))
	(Classe (classe fantasioso ))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores sim))
	(Alcance (alcance blockbuster))
	(Oscar (oscar sim))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "O Senhor dos Anéis (2001 - 2003)" crlf))

;Bonequinha de Luxo
(defrule filme5
	(Qnt (qnt unico ))
	(Final (final feliz ))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor final))
	(Atores (atores nao ))
	(Alcance (alcance cult ))
	(Oscar (oscar sim ))
	(or (Faixa (faixa adulto)) (Faixa (faixa familia)))
	=>
	(assert (grad done))
	(printout t "Bonequinha de Luxo (1961)" crlf))

; John Wick
(defrule filme6
	(Qnt (qnt trilogia))
	(or (Final (final feliz )) (Final (final triste)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores sim))
	(Alcance (alcance blockbuster ))
	(Oscar (oscar nao ))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "John Wick (2014 - 2019)" crlf))

; Documentario Indie Game
(defrule filme7
	(Qnt (qnt trilogia))
	(Final (final feliz ))
	(Principal (principal grupo))
	(Personagem (personagem humanos ))
	(Classe (classe documental
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao))
	(or (Alcance (alcance blockbuster )) (Alcance ( alcance cult)))
	(Oscar (oscar nao ))
	(Faixa (faixa familia))
	=>
	(assert (grad done))
	(printout t "John Wick (2014 - 2019)" crlf))

	
(defrule None
   (declare (salience -100))
   (and (not (grad done)))
   =>
   (printout t "Qualquer filme do Adam Sandler !" crlf))


