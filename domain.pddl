(define (domain Books1)
  (:requirements :strips :typing :fluents)
  (:types book month)
  (:functions
  	(limit ?b - book)
  	(paginas_mensuales ?m - month)
    (max_pages)
    (saltos))

  (:predicates
    (preced ?b1 - book ?b2 - book)
    (assigned ?b - book ?m - month)
    (paral ?b1 - book ?b2 - book)
    (before ?m1 - month ?m2 - month)
    (done ?b - book)
    (not_preced ?b - book)
    (mes_act ?m - month)
    (equal ?m1 - month ?m2 - month)
    )



    (:action leer
      :parameters (?b1 - book  ?m1 - month)
      :precondition (and (not (done ?b1) ) (exists (?m2 - month ?m3 - month) (and (before ?m2 ?m1) (before ?m1 ?m3) (or (mes_act ?m1) (mes_act ?m2) (mes_act ?m3) ) ) )
      (> (limit ?b1) 0)
                    (not (exists (?b3 - book ?m3 - month)
                    (and
                        (paral ?b3 ?b1)
                        (assigned ?b3 ?m3)
                        (not (before ?m3 ?m1) )
                        (not (before ?m1 ?m3) )
                        (not (equal ?m3 ?m1) )
                        ) ) )
                        (or (not_preced ?b1)
                            (exists (?b2 - book ?m2 - month)
                            (and (preced ?b2 ?b1) (assigned ?b2 ?m2) (before ?m2 ?m1) ) )
                        )
                    )

      :effect (and
      (when (and (>= (paginas_mensuales ?m1) (limit ?b1) ) ) (and (decrease (paginas_mensuales ?m1) (limit ?b1) ) (decrease (limit ?b1) (limit ?b1) ) ( done ?b1 ) ( assigned ?b1 ?m1 ) ) )
      (when (and (> (paginas_mensuales ?m1) 0) (<  (paginas_mensuales ?m1) (limit ?b1) ) ) (and (decrease (limit ?b1) (paginas_mensuales ?m1)) (decrease (paginas_mensuales ?m1) (paginas_mensuales ?m1) ) ) )
      (forall (?m2 - month ?m3 - month) (when (and (mes_act ?m1) (before ?m2 ?m1) (before ?m1 ?m3)
                                              (not (exists (?b - book) (and (paral ?b1 ?b) (not (done ?b) ) ) ) ) )
                                              (and (not (mes_act ?m1) ) (mes_act ?m3) (decrease (paginas_mensuales ?m2) (paginas_mensuales ?m2))
                                               (increase (paginas_mensuales ?m2) (max_pages)) ) ) )

      )
    )
)
