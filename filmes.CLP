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
	(printout t "Voce prefere filmes com que tipo continuidade?(trilogia/saga/unico): ")
	(bind ?response (read))
	(assert (Qnt (qnt ?response))))

(defrule getFinal
  	(declare (salience 100))
	=>
	(printout t "Voce prefere que tipo de final? (feliz/triste): ")
	(bind ?response (read))
	(assert (Final (final ?response))))

(defrule getPrincipal
  	(declare (salience 100))
	=>
	(printout t "Voce prefere que quantidade de personagens principais?(unico/grupo): ")
	(bind ?response (read))
	(assert (Principal (principal ?response))))

(defrule getPersonagem
  	(declare (salience 100))
	=>
	(printout t "Voce prefere filmes com personagens humanos ou animais/objetos(humanos/objetos): ")
	(bind ?response (read))
	(assert (Personagem (personagem ?response))))

(defrule getClasse
	(declare (salience 100))
	=>
	(printout t "Qual classe ou aspectos de filme voce prefere?(fantosioso/realista/documental/animacao/si-fi): ")
	(bind ?response (read))
	(assert (Classe (classe ?response))))

(defrule getParteMelhor
	(declare (salience 100))
	=>
	(printout t "O que e mais importate pra voce?(final/contexto/plottwist): ")
	(bind ?response (read))
	(assert (ParteMelhor (parteMelhor ?response))))

(defrule getAtores
	(declare (salience 100))
	=>
	(printout t "Atores/Atrizes famosos sao importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Atores (atores ?response))))

(defrule getAlcance
	(declare (salience 100))
	=>
	(printout t "Voce prefere filme com que alcance?(blockbuster/cult/sessao_da_tarde): ")
	(bind ?response (read))
	(assert (Alcance (alcance ?response))))

(defrule getOscar
   	(declare (salience 100))
	=>
	(printout t "Oscar e importante?(sim/nao): ")
	(bind ?response (read))
	(assert (Oscar (oscar ?response))))

(defrule getFaixa
   	(declare (salience 100))
	=>
	(printout t "Qual a faixa indicativa que melhor reflete sua preferencia(infantil/familia/adulto): ")
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
	(or (Classe (classe fantasioso )) (Classe (classe sessao_da_tarde)))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao ))
	(Alcance (alcance cult ))
	(Oscar (oscar nao ))
	(Faixa (faixa familia ))
	=>
	(assert (filme escolhido))
	(printout t "A fantástica Fabrica de Chocolate (1971)" crlf))

; Velozes e Furiosos
(defrule filme2
	(Qnt (qnt saga))
	(or (Final (final feliz)) (Final (final triste)))
	(Principal (principal grupo))
	(Personagem (personagem humanos))
	(or (Classe (classe realista )) (Classe (classe fantasioso)))
	(ParteMelhor (parteMelhor contexto))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance sessao_da_tarde)))
	(Oscar (oscar nao ))
	(Faixa (faixa familia))
	=>
	(assert (filme escolhido))
	(printout t "Filmes de Velozes e Furiosos" crlf))

; Filmes da Marvel
(defrule filme3
	(Qnt (qnt saga ))
	(or (Final (final feliz )) (Final (final triste)))
	(or (Principal (principal grupo )) (Principal (principal unico)))
	(or (Personagem (personagem humanos )) (Personagem (personagem objetos)))
	(or (Classe (classe fantasioso )) (Classe (classe si-fi)))
	(ParteMelhor (parteMelhor contexto))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance (alcance blockbuster ))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa familia ))
	=>
	(assert (filme escolhido))
	(printout t "Filmes da Marvel (2008 - 2019)" crlf))

; Senhor do Aneis
(defrule filme4
	(Qnt (qnt trilogia))
	(Final (final feliz ))
	(Principal (principal grupo ))
	(or (Personagem (personagem humanos )) (Personagem (personagem objetos)))
	(Classe (classe fantasioso ))
	(or (ParteMelhor (parteMelhor contexto)) )
	(or (Atores (atores sim )) (Atores (atores nao)))
	(Alcance (alcance blockbuster))
	(or (Oscar (oscar nao)) (Oscar (oscar sim)))
	(Faixa (faixa familia ))
	=>
	(assert (filme escolhido))
	(printout t "O Senhor dos Aneis (2001 - 2003)" crlf))

; Bonequinha de Luxo
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
	(printout t "John Wick (2014 - 2019)" crlf))

; Poderoso Chefao
(defrule filme8
	(or (Qnt (qnt trilogia)) (Qnt (qnt unico)))
	(or (Final (final feliz )) (Final (final triste)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao)))
	(or (Alcance (alcance blockbuster )) (Alcance ( alcance cult)))
	(or (Oscar (oscar nao)) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "O Poderoso Chefao (1973)" crlf))	

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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
	(printout t "Donnie Darko (2001)" crlf))
	

; AKIRA
(defrule filme11
	(Qnt (qnt unico))
	(or (Final (final triste)) (Final (final feliz)))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(or (Classe (classe fantasioso)) (Classe (classe si-fi)) (Classe (classe animacao)))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao))
	(Alcance ( alcance cult))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
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
	(assert (filme escolhido))
	(printout t "Clube da Luta (1999)" crlf))	

; Taxi Driver
(defrule filme17
	(Qnt (qnt unico))
	(Final(final triste))
	(Principal(principal unico))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor plottwist)))
	(or (Atores (atores sim )) (Atores (atores nao )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance cult)))
	(Oscar (oscar nao))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Taxi Driver (1976)" crlf))

; De volta para o futuro
(defrule filme18
	(Qnt (qnt trilogia))
	(Final(final feliz))
	(Principal(principal grupo))
	(Personagem (personagem humanos))
	(or (Classe (classe fantasioso)) (Classe (classe si-fi)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor (parteMelhor final)))
	(Atores (atores nao ))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance cult)) (Alcance (alcance sessao_da_tarde)))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(or (Faixa (faixa familia)) (Faixa  (faixa infantil)))
	=>
	(assert (filme escolhido))
	(printout t "Triologia de volta para o futuro (1985)" crlf))

; Tempos Modernos
(defrule filme19
	(Qnt (qnt unico))
	(Final(final feliz))
	(Principal(principal unico))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
		(or (Atores (atores sim )) (Atores (atores nao )))
	(Alcance (alcance cult))
	(Oscar (oscar nao))
	(or (Faixa  (faixa infantil)) (Faixa (faixa adulto)))
	=>
	(assert (filme escolhido))
	(printout t "Tempos Modernos (1936)" crlf))

; Pulp Fiction
(defrule filme20
	(Qnt (qnt unico))
	(or (Final(final feliz)) (Final  (final triste)))
	(or (Principal(principal unico)) (Principal (principal grupo)))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores sim ))
	(Alcance (alcance cult))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Pulp fiction (1995)" crlf))
	
; StarWars
(defrule filme21
	(Qnt (qnt saga))
	(Final(final feliz))
	(Principal (principal grupo))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(Classe (classe si-fi))
	(ParteMelhor (parteMelhor contexto))  
	(or (Atores (atores sim )) (Atores (atores nao )))
	(Alcance (alcance blockbuster))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa familia))
	=>
	(assert (filme escolhido))
	(printout t "StarWars (1999 ~ 2019)" crlf))

; Curtindo a vida adoidado
(defrule filme22
	(Qnt (qnt unico))
	(Final(final feliz))
	(Principal (principal grupo))
	(Personagem (personagem humanos))
	(Classe (classe realista))
	(ParteMelhor (parteMelhor contexto))
	(Atores (atores nao))
	(Alcance (alcance sessao_da_tarde))
	(Oscar (oscar nao))
	(Faixa (faixa familia))
	=>
	(assert (filme escolhido))
	(printout t "Curtindo a vida adoidado (1986)" crlf))

; Alien
(defrule filme23
	(Qnt (qnt saga))
	(Final(final triste))
	(or (Principal(principal unico)) (Principal (principal grupo)))
	(or (Personagem (personagem humanos)) (Personagem(personagem objetoss)))
	(Classe (classe si-fi))
	(or (ParteMelhor (parteMelhor plottwist)) (ParteMelhor (parteMelhor final)))
	(Atores (atores nao ))
	(Alcance (alcance cult))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa  (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Alien - o Oitavo passageiro (1979)" crlf))

; Matrix
(defrule filme24
	(Qnt (qnt trilogia))
	(Final(final feliz))
	(or (Principal(principal unico)) (Principal (principal grupo)))
	(Personagem(personagem humanos))
	(Classe (classe si-fi))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor final)))
	(or (Atores (atores sim)) (Atores (atores nao)))
	(Alcance (alcance blockbuster))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(or (Faixa (faixa adulto)) (Faixa (faixa familia)))
	=>
	(assert (filme escolhido))
	(printout t "Triologia Matrix (1999 ~ 2003)" crlf))

; O Exterminador do Futuro
(defrule filme25
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal (principal grupo))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(Classe (classe si-fi))
	(ParteMelhor (parteMelhor contexto ))   
	(or (Atores (atores sim )) (Atores (atores nao )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance sessao_da_tarde)))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t " Exterminador do Futuro (1984 ~2019)" crlf))

; O Curioso Caso de Benjamim Button
(defrule filme26
	(Qnt (qnt unico))
	(Final(final triste))
	(Principal(principal unico))
	(Personagem(personagem humanos))
	(or (Classe (classe fantasioso)) (Classe (classe realista)))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor final)))   
	(or (Atores (atores sim )) (Atores (atores nao )))
	(Alcance (alcance cult))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa familia))
	=>
	(assert (filme escolhido))
	(printout t " O Curioso caso de Benjamim Button (2009)" crlf))

; Harry Potter
(defrule filme27
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(or (Principal (principal grupo)) (Principal (principal unico)))
	(or (Personagem (personagem objetos)) (Personagem(personagem humanos)))
	(Classe (classe fantasia))
	(ParteMelhor (parteMelhor contexto ))   
	(or (Atores (atores sim )) (Atores (atores nao )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance sessao_da_tarde)))
	(Oscar (oscar nao))
	(or (Faixa (faixa infantil)) (Faixa (faixa familia)))
	=>
	(assert (filme escolhido))
	(printout t " Harry Potter (2001 ~2011)" crlf))

; Piratas do Caribe
(defrule filme28
	(Qnt (qnt saga))
	(Final(final feliz))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe fantasia))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)))   
	(or (Atores (atores sim )) (Atores (atores nao )))
	(or (Alcance (alcance blockbuster)) (Alcance (alcance sessao_da_tarde)))
	(Oscar (oscar nao))
	(Faixa (faixa familia))
	=>
	(assert (filme escolhido))
	(printout t " Piratas do Caribe (2013 ~ 2017)" crlf))

; Divertida Mente
(defrule filme29
	(Qnt (qnt unico))
	(Final (final feliz))
	(Principal (principal grupo))
	(Personagem (personagem objetos))
	(or (Classe (classe fantasioso)) (Classe (classe animacao)))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor final)))
	(Atores (atores nao))
	(Alcance ( alcance sessao_da_tarde))
	(or (Oscar (oscar nao)) (Oscar (oscar nao)))
	(Faixa (faixa infantil))
	=>
	(assert (filme escolhido))
	(printout t " Divertida Mente (2015)" crlf))


; Rei Leao
(defrule filme30
	(or (Qnt (qnt unico)) (Qnt (qnt saga)))
	(Final (final feliz))
	(Principal (principal unico))
	(Personagem (personagem humanos ))
	(Classe (classe animacao))
	(or (ParteMelhor (parteMelhor contexto)) (ParteMelhor(parteMelhor final)))
	(Atores (atores nao))
	(Alcance ( alcance blockbuster))
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa infantil))
	=>
	(assert (filme escolhido))
	(printout t " Rei Leao (1994 ~ 2019)" crlf))


; Batman 
(defrule filme31
	(Qnt (qnt triologia))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)) (ParteMelhor(parteMelhor final)))   
	(or (Atores (atores sim )) (Atores (atores nao )))
 	(Alcance (alcance blockbuster)) 
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t " Batman de Christofer Nolan (2005 ~ 2012)" crlf))


; MadMax 
(defrule filme32
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto ) ) (ParteMelhor(parteMelhor plottwist)) (ParteMelhor(parteMelhor final)))   
	(or (Atores (atores sim )) (Atores (atores nao )))
 	(Alcance (alcance cult)) 
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Mad Max (1979 ~ 2015)" crlf))


; Tropa de Elite
(defrule filme33
	(Qnt (qnt saga))
	(or (Final(final feliz)) (Final (final triste)))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto )) (ParteMelhor(parteMelhor plottwist)) (ParteMelhor(parteMelhor final)))   
	(or (Atores (atores sim )) (Atores (atores nao )))
 	(Alcance (alcance cult)) 
	(or (Oscar (oscar nao )) (Oscar (oscar sim)))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Tropa de Elite (2007)" crlf))

; Ilha das Flores
(defrule filme34
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal(principal grupo)) 
	(Personagem(personagem humanos))
	(Classe (classe documental))
	(ParteMelhor (parteMelhor contexto ))  
	(Atores (atores nao ))
 	(Alcance (alcance cult)) 
	(Oscar (oscar nao ))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Ilha das Flores (1989)" crlf))


; Seremos Historia
(defrule filme35
	(Qnt (qnt unico))
	(Final (final feliz))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe documental))
	(ParteMelhor (parteMelhor contexto ))  
	(or (Atores (atores sim )) (Atores (atores nao )))
 	(or (Alcance (alcance cult)) (Alcance (alcance blockbuster)))
	(Oscar (oscar nao ))
	(or (Faixa (faixa adulto)) (Faixa (faixa familia)))
	=>
	(assert (filme escolhido))
	(printout t "Seremos História? (2016)" crlf))


; Democracia em Vertigem
(defrule filme36
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal(principal grupo)) 
	(Personagem(personagem humanos))
	(Classe (classe documental))
	(ParteMelhor (parteMelhor contexto ))  
	(Atores (atores nao ))
 	(Alcance (alcance cult)) 
	(Oscar (oscar nao ))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Democracia em vertigem (2019)" crlf))

; Kurt Cobain: Montage of Heck
(defrule filme37
	(Qnt (qnt unico))
	(Final (final triste))
	(Principal(principal unico)) 
	(Personagem(personagem humanos))
	(Classe (classe documental))
	(ParteMelhor (parteMelhor contexto ))  
	(Atores (atores nao ))
    (Alcance (alcance cult))
	(Oscar (oscar nao ))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Kurt Cobain: Montage of Heck (2015)" crlf))

; Shrek
(defrule filme38
	(Qnt (qnt saga))
	(Final (final feliz))
	(Principal(principal unico)) 
	(Personagem(personagem objetos))
	(or (Classe (classe animacao)) (Classe (classe fantasia)))
	(or (ParteMelhor (parteMelhor contexto )) (ParteMelhor (parteMelhor final ))) 
	(Atores (atores nao ))
    	(Alcance (alcance blockbuster))
	(Oscar (oscar nao ))
	(or (Faixa (faixa infantil)) (Faixa (faixa familia)))
	=>
	(assert (filme escolhido))
	(printout t "Shrek (2001 ~ 2010)" crlf))

; Planeta dos Macacos
(defrule filme39
	(Qnt (qnt triologia))
	(or (Final (final feliz)) (Final (final triste)))
	(Principal(principal unico)) 
	(or (Personagem (personagem humanos)) (Personagem(personagem objetos)))
	(or (Classe (classe realista)) (Classe (classe si-fi)))
	(or (ParteMelhor (parteMelhor contexto )) (ParteMelhor (parteMelhor final ))) 
	(or(Atores (atores sim )) (Atores (atores nao )))
    	(Alcance (alcance blockbuster))
	(Oscar (oscar nao ))
	(or (Faixa (faixa adulto)) (Faixa (faixa familia)))
	=>
	(assert (filme escolhido))
	(printout t "Planeta dos Macacos (2011 ~ 2017)" crlf))

; Django Livre
(defrule filme40
	(Qnt (qnt unico))
	(or (Final (final feliz)) (Final (final triste)))
	(or (Principal(principal unico)) (Principal (principal grupo)))
	(Personagem(personagem humanos))
	(Classe (classe realista))
	(or (ParteMelhor (parteMelhor contexto )) (ParteMelhor (parteMelhor final ))) 
	(or(Atores (atores sim )) (Atores (atores nao )))
    	(Alcance (alcance blockbuster))
	(or (Oscar (oscar sim)) (Oscar (oscar nao )))
	(Faixa (faixa adulto))
	=>
	(assert (filme escolhido))
	(printout t "Django Livre (2012)" crlf))


(defrule None
   (declare (salience -100))
   (and (not (filme escolhido)))
   =>
   (printout t "Qualquer filme do Adam Sandler (1989 ~ 2019)" crlf))


