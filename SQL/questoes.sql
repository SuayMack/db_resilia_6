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

-- 4. consulta, que deverá ser respondida por scripts SQL e que combine pelo menos 3 tabelas
/* para obter informações interessantes sobre os estudantes, as turmas em que estão matriculados
 e os cursos relacionados. Essa consulta vai  dar uma visão geral de quantos estudantes estão em 
 cada turma e qual o curso associado a cada uma delas. */
SELECT
    T.nome AS nome_turma,
    C.nome AS nome_curso,
    COUNT(E.id_estudante) AS quantidade_estudantes
FROM
    Turma T
JOIN
    Curso C ON T.id_curso = C.id_curso
LEFT JOIN
    Estudante E ON T.id_turma = E.id_turma
GROUP BY
    T.id_turma, C.id_curso
ORDER BY
    nome_turma;
    
/* Obter informações financeiras sobre os estudantes, 
incluindo o valor total pago por cada estudante em cada turma. */
SELECT
    E.nome AS nome_estudante,
    T.nome AS nome_turma,
    FE.valor_total AS valor_total_curso,
    FE.valor_pago AS valor_pago
FROM
    Estudante E
JOIN
    FinanceiroEstudante FE ON E.id_estudante = FE.id_estudante
JOIN
    Turma T ON E.id_turma = T.id_turma
ORDER BY
    nome_turma, nome_estudante;

