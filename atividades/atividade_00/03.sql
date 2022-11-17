-- π -> projecao
-- σ -> selecao (where)
-- ▷◁ -> join
-- |><| -> join
-- ∧ -> and

--Consulta 1
-- π carnome(σ carcategoria=′SUV ′ (Carro) ▷◁ (π carid(Carro) − πcarid(Aluguel Carro)))

SELECT
c.carnome

FROM
atividade01_correcao.carro c

WHERE
c.carcategoria = 'SUV'
AND c.carid NOT IN (SELECT carid FROM atividade01_correcao.aluguel_carro);

--Consulta 2
-- π carplaca,carano((Carro |><| Aluguel Carro) |><| (σuf=′RJ′ (Cliente) |><| Aluguel))

SELECT
c.carplaca,
c.carano

FROM
atividade01_correcao.carro c

INNER JOIN atividade01_correcao.aluguel_carro ac
ON c.carid = ac.carid

INNER JOIN atividade01_correcao.aluguel a
ON ac.aid = a.aid

INNER JOIN atividade01_correcao.cliente cli
ON a.cid = cli.cid

WHERE
cli.uf = 'RJ'

--Consulta 3
-- π cnome(σ uf=′SP ′ (Cliente))

SELECT
cnome

FROM
atividade01_correcao.cliente

WHERE
uf = 'SP'

--Consulta 4
--πcarplaca,cnome(σcarcategoria=′Sedan′∧carano=2020(Carro) ▷◁ Aluguel Carro) ▷◁ (σcnome!=′Daniel′ (Cliente) ▷◁ Aluguel)

SELECT
c.carplaca,
cli.cnome

FROM
atividade01_correcao.carro c

INNER JOIN atividade01_correcao.aluguel_carro ac
ON c.carid = ac.carid

INNER JOIN atividade01_correcao.aluguel a
ON ac.aid = a.aid

INNER JOIN atividade01_correcao.cliente cli
ON a.cid = cli.cid

WHERE
c.carcategoria = 'Sedan'
AND c.carano = 2022
AND cli.nome <> 'Daniel'

--Consulta 5
--π cnome,cid(σuf=′MG′ (Cliente))

SELECT
cli.cnome,
cli.cid

FROM
atividade01_correcao.cliente cli

WHERE
cli.uf = 'MG'
