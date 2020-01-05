(define (problem recomendation_of_books) (:domain Books1)
(:objects
Quijote La_piedra_filosofal La_camara_de_los_secretos El_prisionero_azkaban El_caliz_de_fuego Biblia Amanecer_rojo Hijo_dorado
ONE_PIECE_1 ONE_PIECE_2 ONE_PIECE_3 ONE_PIECE_4 ONE_PIECE_5 ONE_PIECE_6 ONE_PIECE_7 ONE_PIECE_8 ONE_PIECE_9 ONE_PIECE_10 ONE_PIECE_11
ONE_PIECE_12 ONE_PIECE_13 ONE_PIECE_14 ONE_PIECE_15 SUPERMAN_A SUPERMAN_B SUPERMAN_C SUPERMAN_D SUPERMAN_E - book
	January February March April May June July August September October November December - month
	)

(:init
;(= (aux) 0)
(= (max_pages) 800)
(= (saltos) 0)
(= (paginas_mensuales January) 800)
(= (paginas_mensuales February) 800)
(= (paginas_mensuales March) 800)
(= (paginas_mensuales April) 800)
(= (paginas_mensuales May) 800)
(= (paginas_mensuales June) 800)
(= (paginas_mensuales July) 800)
(= (paginas_mensuales August) 800)
(= (paginas_mensuales September) 800)
(= (paginas_mensuales October) 800)
(= (paginas_mensuales November) 800)
(= (paginas_mensuales December) 800)
(= (limit La_piedra_filosofal) 400)
(= (limit La_camara_de_los_secretos) 400)
(= (limit El_prisionero_azkaban) 400)
(= (limit El_caliz_de_fuego) 400)
(= (limit ONE_PIECE_1) 900)
(= (limit ONE_PIECE_2) 200)
(= (limit ONE_PIECE_3) 200)
(= (limit ONE_PIECE_4) 200)
(= (limit ONE_PIECE_5) 200)
(= (limit ONE_PIECE_6) 200)
(= (limit ONE_PIECE_7) 200)
(= (limit ONE_PIECE_8) 200)
(= (limit ONE_PIECE_9) 200)
(= (limit ONE_PIECE_10) 200)
(= (limit ONE_PIECE_11) 200)
(= (limit ONE_PIECE_12) 200)
(= (limit ONE_PIECE_13) 200)
(= (limit ONE_PIECE_14) 200)
(= (limit ONE_PIECE_15) 200)
(= (limit SUPERMAN_A) 100)
(= (limit SUPERMAN_B) 100)
(= (limit SUPERMAN_C) 100)
(= (limit SUPERMAN_D) 600)
(before January February)
(before February March)
(before March April)
(before April May)
(before May June)
(before June July)
(before July August)
(before August September)
(before September October)
(before October November)
(before November December)
(before December January)
(equal January January)
(equal February February)
(equal March March)
(equal April April)
(equal May May)
(equal June June)
(equal July July)
(equal August August)
(equal September September)
(equal October October)
(equal November November)
(equal December December)


	(preced Amanecer_rojo Hijo_dorado)
	(preced Biblia Amanecer_rojo)
	(preced Quijote Biblia)
	(preced El_prisionero_azkaban El_caliz_de_fuego)
	(preced La_camara_de_los_secretos El_prisionero_azkaban)
	(preced La_piedra_filosofal La_camara_de_los_secretos)



	(not_preced SUPERMAN_A)
	(not_preced SUPERMAN_C)

	(preced SUPERMAN_A SUPERMAN_B)

	(paral SUPERMAN_C SUPERMAN_B)
	(paral SUPERMAN_B SUPERMAN_C)

	(preced SUPERMAN_C SUPERMAN_D)

;	        C ->  D
;			^
;			|
;			v
;	A ->    B

	(preced ONE_PIECE_14 ONE_PIECE_15) (preced ONE_PIECE_13 ONE_PIECE_14)
	(preced ONE_PIECE_12 ONE_PIECE_13) (preced ONE_PIECE_11 ONE_PIECE_12)
	(preced ONE_PIECE_10 ONE_PIECE_11) (preced ONE_PIECE_9 ONE_PIECE_10)
	(preced ONE_PIECE_8 ONE_PIECE_9) (preced ONE_PIECE_7 ONE_PIECE_8)
	(preced ONE_PIECE_6 ONE_PIECE_7) (preced ONE_PIECE_5 ONE_PIECE_6)
	(preced ONE_PIECE_4 ONE_PIECE_5) (preced ONE_PIECE_3 ONE_PIECE_4)
	(preced ONE_PIECE_2 ONE_PIECE_3) (preced ONE_PIECE_1 ONE_PIECE_2)
	(not_preced ONE_PIECE_1)
	(not_preced Quijote)
	;(not_preced La_piedra_filosofal)

	(paral ONE_PIECE_10 SUPERMAN_D)
	(paral SUPERMAN_D ONE_PIECE_10)
	(mes_act January)

)

(:goal (and
		(done ONE_PIECE_15)
		;(done El_caliz_de_fuego)
		(not (exists (?b - book) (and (done ?b)
		(exists (?b2 - book) (and (paral ?b2 ?b) (not (done ?b2) ) ) ) ) ) )
		)
)
(:metric minimize (saltos))
)
