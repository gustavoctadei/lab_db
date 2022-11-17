CREATE TABLE atividade01_correcao.cliente (
	cid SERIAL PRIMARY KEY,
    cnome VARCHAR,
    uf VARCHAR(2)
);

CREATE TABLE atividade01_correcao.carro (
	carid SERIAL PRIMARY KEY,
    carnome VARCHAR,
    carcategoria VARCHAR,
    carplaca TEXT,
    carano INT
);

CREATE TABLE atividade01_correcao.aluguel (
	aid SERIAL PRIMARY KEY,
    cid INT NOT NULL,
    adatainicio DATE,
    adatatermino DATE,
    apreco FLOAT
);

CREATE TABLE atividade01_correcao.aluguel_carro (
	aid INTEGER NOT NULL,
    carid INTEGER NOT NULL,
    
    PRIMARY KEY(aid, carid),
    
    FOREIGN KEY (aid)
    	REFERENCES atividade01_correcao.aluguel(aid),
    FOREIGN KEY (carid)
    	REFERENCES atividade01_correcao.carro(carid)
);
