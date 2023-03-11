-- DESAFIO: Ainda com o Banco de Dados de linhas de ônibus (Crie consultas que:)
-- A: Mostre o nome, os telefone e id_linha do motorista ou motoristas da linha1
SELECT m.nome AS Nome_motorista, t.numero AS Telefone, d.id_linha AS ID_Linha
FROM motorista m
JOIN telefone t ON t.cpf_motorista = m.cpf
JOIN dirige d ON d.cpf_motorista = m.cpf
JOIN linha l ON l.id = d.id_linha
WHERE l.id = 'linha1';

-- B: Mostre os horários da linha1
SELECT h.horario AS Horario
FROM linha l
JOIN horario h ON h.id_linha = l.id
WHERE l.id = 'linha1';

-- C: Mostre o id_linha das linhas que tenham horário as 11:00hs.
SELECT l.id AS ID_Linha
FROM linha l
JOIN horario h ON h.id_linha = l.id
WHERE h.horario = '11:00:00';

-- D: Mostre os nomes, telefones, id_linha, descricao e horários orenado por id_linha
SELECT m.nome AS Nome_motorista, t.numero AS Telefone, l.id AS ID_Linha, l.descricao AS Descricao_Linha, h.horario AS Horario
FROM motorista m
JOIN telefone t ON t.cpf_motorista = m.cpf
JOIN dirige d ON d.cpf_motorista = m.cpf
JOIN linha l ON l.id = d.id_linha
JOIN horario h ON h.id_linha = l.id
ORDER BY l.id;

-- E: Mostre uma consulta que mostre os nomes dos motoristas e quantas linhas este dirige
SELECT motorista.nome, COUNT(dirige.id_linha) AS num_linhas
FROM motorista
INNER JOIN dirige ON motorista.cpf = dirige.cpf_motorista
GROUP BY motorista.nome;

-- F: Mostre o id_linha, a descrição e quantos motoristas esta possui
SELECT linha.id, linha.descricao, COUNT(DISTINCT dirige.cpf_motorista) AS num_motoristas
FROM linha
INNER JOIN dirige ON linha.id = dirige.id_linha
GROUP BY linha.id, linha.descricao;





