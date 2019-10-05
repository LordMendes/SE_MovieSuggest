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
	(printout t "Voc� prefere filmes com que tipo continuidade?(trilogia/saga/unico): ")
	(bind ?response (read))
	(assert (Qnt (qnt ?response))))

(defrule getFinal
  	(declare (salience 100))
	=>
	(printout t "Voc� prefere que tipo de final? (feliz/triste): ")
	(bind ?response (read))
	(assert (Final (final ?response))))

(defrule getPrincipal
  	(declare (salience 100))
	=>
	(printout t "Voc� prefere que quantidade de personagens principais?(unico/grupo): ")
	(bind ?response (read))
	(assert (Principal (principal ?response))))

(defrule getPersonagem
  	(declare (salience 100))
	=>
	(printout t "Voc� prefere filmes com personagens humanos ou animais/objetos(humanos/objetos): ")
	(bind ?response (read))
	(assert (Personagem (personagem ?response))))

(defrule getClasse
	(declare (salience 100))
	=>
	(printout t "Qual classe ou aspectos de filme voc� prefere?(fantosioso/realista/documental/animacao/sifi): ")
	(bind ?response (read))
	(assert (Classe (classe ?response))))

(defrule getParteMelhor
	(declare (salience 100))
	=>
	(printout t "O que � mais importate pra voc�?(final/contexto/plottwist): ")
	(bind ?response (read))
	(assert (ParteMelhor (parteMelhor ?response))))

(defrule getAtores
	(declare (salience 100))
	=>
	(printout t "Atores/Atrizes famosos s�o importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Atores (atores ?response))))

(defrule getAlcance
	(declare (salience 100))
	=>
	(printout t "Voc� prefere filme com que alcance?(blockbuster/cult/sessao_da_tarde): ")
	(bind ?response (read))
	(assert (Alcance (alcance ?response))))

(defrule getOscar
   	(declare (salience 100))
	=>
	(printout t "Oscar � importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Oscar (oscar ?response))))

(defrule getFaixa
   	(declare (salience 100))
	=>
	(printout t "Qual a faixa indicativa que melhor reflete sua prefer�ncia(infantil/familia/adulto): ")
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
	(Alcance (alcance cult )))
	(Oscar (oscar nao ))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "A fant�stica Fabrica de Chocolate (1971)" crlf))

;Velozes e Furiosos
(defrule filme2
	(Qnt (qnt saga))
	(or (Final (final feliz)) (Final (final triste)))
	(Principal (principal grupo ))
	(Personagem (personagem humanos ))
	(or (Classe (classe realista )) (Classe (classe fantasioso)) (Classe (classe sifi)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance (alcance blockbuster)) (Alcance (alcanse sessao_da_tarde)))
	(Oscar (oscar nao ))
	(or (Faixa (faixa familia) (Faixa (faixa adulto))))
	=>
	(assert (grad done))
	(printout t "Filmes de Velozes e Furiosos" crlf))

; Filmes da Marvel
(defrule filme3
	(Qnt (qnt saga ))
	(or (Final (final feliz )) (Final (final triste)))
	(or (Principal (principal grupo )) (Principal (principal unico)))
	(or (Personagem (personagem humanos )) (Personagem (personagem objetos)))
	(or (Classe (classe fantasioso )) (Classe (classe sifi)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance (alcance blockbuster ))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "Filmes da Marvel (2008 - 2019)" crlf))

; Senhor do An�is
(defrule filme4
	(Qnt (qnt trilogia))
	(or (Final (final feliz )) (Final (final triste)))
	(Principal (principal grupo ))
	(or (Personagem (personagem humanos )) (Personagem (personagem objetos)))
	(Classe (classe fantasioso ))
		(or (ParteMelhor (parteMelhor contexto)) )
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance (alcance blockbuster))
	(or (Oscar (oscar nao)) (Oscar (oscar sim)))
	(Faixa (faixa familia ))
	=>
	(assert (grad done))
	(printout t "O Senhor dos An�is (2001 - 2003)" crlf))

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
	(or (Oscar (oscar nao)) (Oscar (oscar sim)))
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
	(or (Atores (atores sim )) (Atores (atores nao)))
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
	(Classe (classe documental))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao))
	(or (Alcance (alcance blockbuster )) (Alcance ( alcance cult)))
	(Oscar (oscar nao ))
	(Faixa (faixa familia))
	=>
	(assert (grad done))
	(printout t "John Wick (2014 - 2019)" crlf))

; Poderoso Chef�o
(defrule filme8
	(or (Qnt (qnt trilogia)) (Qnt (qnt unico)))
	(or (Final (final feliz )) (Final (final triste)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto) (ParteMelhor (parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance (alcance blockbuster )) (Alcance ( alcance cult)))
	(or (Oscar (oscar nao)) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "O Poderoso Chef�o (1973)" crlf))	

; Scarface
(defrule filme9
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor final))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance (alcance blockbuster )) (Alcance ( alcance cult)))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Scarface (1983)" crlf))	

; Donnie Darko
(defrule filme10
	(Qnt (qnt unico))
	(or (Final (final triste)) (Final (final feliz)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(or (Classe (classe realista)) (Classe (classe fantasioso)))
	(ParteMelhor (parteMelhor contexto))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance ( alcance cult))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Donnie Darko (2001)" crlf))
	

; AKIRA
(defrule filme11
	(Qnt (qnt unico))
	(or (Final (final triste)) (Final (final feliz)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(or (Classe (classe fantasioso)) (Classe (classe sifi)) (Classe (classe animacao)))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao))
	(Alcance ( alcance cult))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Akira (1988)" crlf))	

; A Origem
(defrule filme12
	(Qnt (qnt unico))
	(Final (final feliz))
	(or (Principal (principal grupo)) (Principal (principal unico)))
	(Personagem (personagem humanos ))
	(or (Classe (classe realista)) (Classe (classe fantasioso)))
	(or (ParteMelhor (parteMelhor final)) (ParteMelhor (parteMelhor contexto)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance ( alcance blockbuster))
	(or (Oscar (oscar sim)) (Oscar (oscar nao)))
	(or (Faixa (faixa infatil)) (Faixa (faixa familia)))
	=>
	(assert (grad done))
	(printout t "A Origem (2010)" crlf))	

; Ilha do Medo
(defrule filme13
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor final)) (ParteMelhor (parteMelhor contexto)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance ( alcance blockbuster ))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Ilha do Medo (2010)" crlf))	

; A espera de um milagre
(defrule filme14
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal (principal grupo))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance ( alcance blockbuster )) (Alcance  (alcance sessao_da_tarde)))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "A espera de um milagre (1999)" crlf))

; Um sonho de liberdade
(defrule filme15
	(Qnt (qnt unico))
	(Final (final feliz))
	(Principal (principal grupo))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor final)) (ParteMelhor (parteMelhor contexto)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance ( alcance blockbuster )) (Alcance  (alcance sessao_da_tarde)))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Um sonho de liberdade (1994)" crlf))

; Clube da Luta
(defrule filme16
	(Qnt (qnt unico))
	(or (Final (final feliz)) (Final (final triste)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor final)) (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance ( alcance blockbuster ))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Clube da Luta (1999)" crlf))	

;Taxi Driver
(defrule filme17
	(Qnt (qnt unico))
	(Final(final tirste))
	(Principal(pricipal unico))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor plottwist)))
	((Atores (atores sim )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance cult)))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Taxi Driver" crlf))

;De volta para o futuro
(defrule filme18
	(Qnt (qnt trilogia))
	(Final(final feliz))
	(Principal(pricipal grupo))
	(Personagem (personagem humanos))
	(or (Classe (classe fantasioso)) (Classe (classe sifi)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor final)))
	((Atores (atores nao )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance cult)) (Alcance (alcance sessao_da_tarde)))
	(Oscar (oscar sim))
	(or (Faixa (faixa familia)) (Faixa  (faixa infantil)))
	=>
	(assert (grad done))
	(printout t "Triologia de volta para o futuro" crlf))

;Tempos Modernos
(defrule filme19
	(Qnt (qnt unico))
	(Final(final feliz))
	(Principal(pricipal unico))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	((Atores (atores sim )))
	(Alcance (alcance cult))
	(Oscar (oscar sim))
	(or (Faixa  (faixa infantil)) (Faixa (faixa adulto)))
	=>
	(assert (grad done))
	(printout t "Charlie Chaplin Tempos Modernos" crlf))

;Tarantino
(defrule filme20
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final  (final triste)))
	(or (Principal(pricipal unico)) Principal (principal grupo))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor plottwist)) )
	((Atores (atores sim )))
	(or (Alcance (alcance cult)) (Alcance (alcance blockbuster)))
	(Oscar (oscar sim))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Filmes do diretor Quentin Tarantino" crlf))
	
;StarWars
(defrule filme21
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final  (final triste)))
	(or (Principal(pricipal unico)) Principal (principal grupo))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(or (Classe (classe sifi)) (Classe(classse fantasia)))
	(or (ParteMelhor (parteMelhor plottwist)) (ParteMelhor (parteMelhor contexto)))  
	((Atores (atores sim )))
	(or (Alcance (alcance cult)) (Alcance (alcance blockbuster)))
	(Oscar (oscar sim))
	(or (Faixa (faixa adulto)) (Faixa (faixa infantil)) (Faixa (faixa familia)) )
	=>
	(assert (grad done))
	(printout t "StarWars" crlf))

;Curtindo a vida adoidado
(defrule filme22
	(Qnt (qnt unico))
	(Final(final feliz))
	(Principal(pricipal unico))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao ))
	(Alcance (alcance sessao_da_tarde))
	(Oscar (oscar nao))
	(or (Faixa (faixa familia)) (Faixa  (faixa infantil)))
	=>
	(assert (grad done))
	(printout t "Curtindo a vida adoidado" crlf))

Alien
(defrule filme23
	(Qnt (qnt saga))
	(Final(final triste))
	(or (Principal(pricipal unico)) (Principal grupo))
	(or (Personagem (personagem humanos)) (Personagem(personagem objetoss)))
	(Classe (classe sifi))
	(or (ParteMelhor (parteMelhor plottwist)) (ParteMelhor (parteMelhor final)))
	(Atores (atores nao ))
	(Alcance (alcance cult))
	(Oscar (oscar nao))
	(Faixa  (faixa adulto))
	=>
	(assert (grad done))
	(printout t "Alien - o Oitavo passageiro" crlf))

;Matrix
(defrule filme24
	(Qnt (qnt trilogia))
	(Final(final feliz))
	(or (Principal(pricipal unico)) Principal (principal grupo))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(or (Classe (classe sifi)) (Classe(classse fantasia)))
	(ParteMelhor (parteMelhor contexto ) )   
	((Atores (atores sim )))
	(or (Alcance (alcance cult)) (Alcance (alcance blockbuster)))
	(Oscar (oscar sim))
	(or (Faixa (faixa adulto)))
	=>
	(assert (grad done))
	(printout t "Triologia Matrix" crlf))

;O Exterminador do Futuro
(defrule filme25
	(Qnt (qnt saga))
	(Final(final feliz))
	(or (Principal(pricipal unico)) Principal (principal grupo))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(Classe (classe sifi))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)))   
	((Atores (atores sim )))
	(or (Alcance (alcance cult)) (Alcance (alcance blockbuster)) (Alcance (alcanse sessao_da_tarde)))
	(Oscar (oscar sim))
	(or (Faixa (faixa adulto)))
	=>
	(assert (grad done))
	(printout t " Exterminador do Futuro" crlf))

;O Curioso Caso de Benjamim Button
(defrule filme25
	(Qnt (qnt unico))
	(Final(final feliz))
	(Principal(pricipal unico))
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor final)))   
	((Atores (atores sim )))
	(Alcance (alcance cult))
	(Oscar (oscar nao))
	(Faixa (faixa familia))
	=>
	(assert (grad done))
	(printout t " O Curioso caso de Benjamim Button" crlf))

;Harry Potter
(defrule filme26
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(pricipal unico)) 
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(Classe (classe fantasia))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)))   
	(or ((Atores (atores sim ))) ((Atores (atores nao ))))
	(or (Alcance (alcance blockbuster)) (Alcance (alcanse sessao_da_tarde)))
	(Oscar (oscar nao))
	(or (Faixa (faixa infantil) (Faixa (faixa familia)))
	=>
	(assert (grad done))
	(printout t " Harry Potter" crlf))

;Piratas do Caribe
(defrule filme27
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(pricipal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe fantasia))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)))   
	(or ((Atores (atores sim ))) ((Atores (atores nao ))))
	(or (Alcance (alcance blockbuster)) (Alcance (alcanse sessao_da_tarde)))
	(Oscar (oscar nao))
	(Faixa (faixa familia))
	=>
	(assert (grad done))
	(printout t " Piratas do Caribe" crlf))

;Divertida Mente
(defrule filme28
	(Qnt (qnt unico))
	(Final (final feliz))
	(Principal (principal grupo))
	(Personagem (personagem humanos ))
	(or (Classe (classe fantasioso)) (Classe (classe animacao)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor final))
	(Atores (atores nao))
	(Alcance ( alcance sessao_da_tarde))
	(Oscar (oscar nao))
	(Faixa (faixa infantil))
	=>
	(assert (grad done))
	(printout t " Divertida Mente" crlf))


;ReiLeao
(defrule filme29
	(Qnt (qnt triologia))
	(Final (final feliz))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(or (Classe (classe realisata)) (Classe (classe animacao)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor final))
	(Atores (atores nao))
	(Alcance ( alcance blockbuster))
	(Oscar (oscar nao))
	(Faixa (faixa infantil))
	=>
	(assert (grad done))
	(printout t " Rei Leão" crlf))


;Batman 
(defrule filme30
	(Qnt (qnt triologia))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(pricipal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)) (ParteMelhor(parteMelhor final)))   
	(or ((Atores (atores sim ))) ((Atores (atores nao ))))
 	(Alcance (alcance blockbuster)) 
	(Oscar (oscar sim))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t " Batman triologia de Christofer Nolan" crlf))


;MadMax 
(defrule filme30
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(pricipal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)) (ParteMelhor(parteMelhor final)))   
	(or ((Atores (atores sim ))) ((Atores (atores nao ))))
 	(Alcance (alcance cult)) 
	(Oscar (oscar sim))
	(Faixa (faixa adulto))
	=>
	(assert (grad done))
	(printout t "MadMax" crlf))


(defrule None
   (declare (salience -100))
   (and (not (grad done)))
   =>
   (printout t "Qualquer filme do Adam Sandler !" crlf))


