-- 1. Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT COUNT(id_estudante)
FROM estudante;

-- 2. Selecionar quais pessoas facilitadoras atuam em mais de uma turma;
SELECT pf.id_facilitador, pf.nome, COUNT(DISTINCT t.id_turma) AS num_turmas
FROM PessoaFacilitadora pf
JOIN Curso c ON pf.id_facilitador = c.id_facilitador
JOIN Turma t ON c.id_curso = t.id_curso
GROUP BY pf.id_facilitador, pf.nome
HAVING num_turmas > 1;

-- 3. Criar uma view que selecione a porcentagem de estudantes com status de evasão agrupados por turma;
CREATE VIEW PorcentagemEvasaoPorTurma AS
SELECT
    t.id_turma,
    t.nome AS nome_turma,
    COUNT(CASE WHEN e.status = 'Inativo' THEN 1 ELSE NULL END) AS total_evasao,
    COUNT(e.id_estudante) AS total_estudantes,
    (COUNT(CASE WHEN e.status = 'Inativo' THEN 1 ELSE NULL END) / COUNT(e.id_estudante)) * 100 AS porcentagem_evasao
FROM Turma t
LEFT JOIN Estudante e ON t.id_turma = e.id_turma
GROUP BY t.id_turma, t.nome;

-- 4. Criar um trigger para ser disparado quando o atributo status de um estudante for atualizado e inserir um novo dado em uma tabela de log.
