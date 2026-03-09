USE projeto_tcc;
SELECT DATABASE ();

CREATE TABLE cliente (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
telefone VARCHAR(20),
email VARCHAR(100)
);

SELECT * FROM cliente;

CREATE TABLE pet (
id INT 	AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
especie VARCHAR(50),
raca VARCHAR(50),
data_nascimento DATE,
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

SELECT *FROM pet;

INSERT INTO cliente (nome, telefone, email)
VALUES('Lisa Simpson', '11900000000', 'lisa@email.com'),
		('Homer Simpson', '11988888888', 'homer@email.com'),
        ('Ana Maria', '11977777777', 'anamaria@email.com'),
        ('Aline Marques', '11966666666', 'aline@email.com'),
        ('Geraldo', '119555555555', 'geraldo@email.com');
		

INSERT INTO pet (nome, especie, raca, data_nascimento, cliente_id)
VALUES ('Bola de Neve', 'gato', 'sem raça determinada', '2011-10-11', 1),
		('Porco Aranha', 'porco', 'sem raça determinada', '2000-12-31', 2),
        ('Louro José', 'papagaio', 'sem raça determinada', '2001-01-01', 3),
        ('Max', 'cachorro', 'sem raça determinada', '2019-01-10', 4),
        ('Pipper', 'cachorro', 'sem raça determinada', '2016-05-31',4),
        ('Toruk', 'cachorro', 'Pit Bull', '2024-11-07', 4),
        ('Bella', 'gato', 'Bombay', '2022-01-01', 5),
        ('Mel', 'gato', 'sem raça determinada', '2023-01-05', 5),
        ('Bob', 'gato', 'Persa', '2019-05-31', 5);
		
SELECT 
Cliente.id AS id_cliente,
Cliente.nome AS nome_cliente,
Cliente.telefone,
Cliente.email,
Pet.id AS id_pet,
Pet.nome AS nome_pet,
Pet.especie,
Pet.raca,
Pet.data_nascimento
FROM cliente Cliente
INNER JOIN pet Pet		
	ON Cliente.id = Pet.cliente_id;

CREATE TABLE servico (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
descricao VARCHAR(255),
valor DECIMAL(10,2)
);

SELECT * FROM servico;

INSERT INTO servico (nome, descricao, valor)
VALUES
('Corte de Unhas', 'Corte simples', 30.00),
('Banho e Tosa','Pacote completo', 100.00),
('Tosa', 'Tosa completa', 70.00),
('Banho', 'Banho completo', 50.00);

CREATE TABLE agendamento (
id INT AUTO_INCREMENT PRIMARY KEY,
cliente_id INT NOT NULL,
pet_id INT NOT NULL,
servico_id INT NOT NULL,
data_agendamento DATE NOT NULL,
hora_agendamento TIME NOT NULL,
observacao VARCHAR(300),

INSERT INTO agendamento
(cliente_id, pet_id, servico_id, data_agendamento, hora_agendamento, 
observacao)
VALUES
(1, 1, 1, '2026-03-10', '16:00:00', 'Banho'),
(2, 2, 2, '2026-03-16', '09:15:00', 'Banho'),
(3, 3, 3, '2026-03-12', '15:30:00', 'Corte de Unhas'),
(4, 4, 4, '2026-03-09', '10:20:00', 'Banho e Tosa');

SELECT * FROM agendamento;

	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (pet_id) REFERENCES pet(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id)
    );
    
    SELECT
    cliente.nome AS cliente,
    pet.nome AS pet,
    servico.nome AS servico,
    data_agendamento,
    hora_agendamento FROM agendamento JOIN cliente 
    ON agendamento.cliente_id = cliente.id
    JOIN pet ON agendamento.pet_id = pet.id
    JOIN servico ON agendamento.servico_id = servico.id;
    
    SELECT 
		cliente.nome AS nome_cliente,
        pet.nome AS nome_pet,
        pet.especie,
        pet.raca
    FROM pet
    JOIN cliente ON pet.cliente_id = cliente.id;
    
DELETE FROM agendamento;
DELETE FROM pet;
DELETE FROM cliente;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE agendamento;
TRUNCATE TABLE pet;
TRUNCATE TABLE cliente;

SET FOREIGN_KEY_CHECKS = 1;
SELECT* FROM cliente;
SELECT * FROM pet;

SELECT
cliente.nome AS cliente, 
pet.nome AS pet, 
pet.especie,
pet.raca
FROM cliente
LEFT JOIN pet
ON cliente.id = pet.cliente_id;





