<<<<<<< HEAD
=======
-- Inserção de Pessoas Facilitadoras
>>>>>>> ad55c62e8d60777ba48af1032f92bcd16d955f21
INSERT INTO PessoaFacilitadora (nome, data_nascimento, email, formacao, experiencia) VALUES
    ('João Gomes', '1988-10-15', 'joao.silva@example.com', 'Engenheiro de Software', '10 anos de experiência'),
    ('Maria Souza', '1999-09-22', 'maria.souza@example.com', 'Desenvolvedora Web', '8 anos de experiência'),
    ('Pedro Santos', '1990-09-10', 'pedro.santos@example.com', 'Cientista de Dados', '15 anos de experiência'),
    ('Ana Oliveira', '1987-12-05', 'ana.oliveira@example.com', 'Designer de UI/UX', '6 anos de experiência'),
    ('Lucas Pereira', '1982-03-18', 'lucas.pereira@example.com', 'Analista de Sistemas', '12 anos de experiência');

<<<<<<< HEAD

INSERT INTO Curso (nome, descricao, carga_horaria_total) VALUES
    ('Desenvolvimento Web', 'Curso de desenvolvimento web utilizando HTML, CSS e JavaScript.', 120),
    ('Ciência de Dados', 'Curso de ciência de dados com Python e análise de dados.', 180),
    ('UX/UI Design', 'Curso de design de experiência do usuário (UX) e interface do usuário (UI).', 100),
    ('Inteligência Artificial', 'Curso de inteligência artificial e machine learning.', 200),
    ('Gestão de Projetos', 'Curso de gerenciamento de projetos utilizando metodologias ágeis.', 160);


INSERT INTO Turma (nome, data_inicio, data_termino, id_curso) VALUES
    ('Turma A', '2023-08-01', '2023-10-30', 1),
    ('Turma B', '2023-08-15', '2023-11-20', 2),
    ('Turma C', '2023-09-01', '2023-12-05', 3),
    ('Turma D', '2023-09-15', '2023-12-20', 2),
    ('Turma E', '2023-10-01', '2023-12-15', 4);


INSERT INTO Modulo (id_facilitador, nome, descricao, carga_horaria, id_curso) VALUES
    (1, 'Introdução ao Front-end', 'Conceitos básicos de desenvolvimento front-end.', 40, 1),
    (2, 'Manipulação de Dados com Pandas', 'Utilização da biblioteca Pandas para manipulação de dados.', 60, 2),
    (3, 'UX Design Principles', 'Princípios de design de experiência do usuário.', 30, 3),
    (4, 'Aprendizado Supervisionado', 'Algoritmos de aprendizado supervisionado em machine learning.', 80, 4),
    (5, 'Scrum e Kanban', 'Metodologias ágeis para gestão de projetos.', 50, 5);

-- Tabela Estudante
INSERT INTO Estudante (id_modulo, nome, data_nascimento, email, status, id_turma) VALUES
    (1, 'Lucas Rolando', '1998-05-15', 'lucas.silva@gmail.com', 'Ativo', 1),
    (2, 'Mariana Gomes', '1998-08-22', 'mariana.santos@gmail.com', 'Ativo', 2),
    (3, 'Juliane Pereira', '1990-09-10', 'juliane.pereira@gmail.com', 'Inativo', 1),
    (4, 'Ciro Oliveira', '1995-12-05', 'ciro.oliveira@gmail.com', 'Ativo', 3),
    (5, 'Disney Almeida', '2000-03-18', 'disney.almeida@gmail.com', 'Ativo', 2),
    (1, 'Manoel Gomes', '1998-02-20', 'manoel.gomes@gmail.com', 'Ativo', 3),
    (2, 'Daniel Orivaldo', '1995-07-25', 'daniel.orivaldo@gmail.com', 'Ativo', 1),
    (3, 'Juarez Santos', '1997-04-10', 'Juarez.santos@gmail.com', 'Inativo', 2),
    (4, 'Jorge Oliveira', '1998-09-12', 'jorge.oliveira@gmail.com', 'Ativo', 1),
    (5, 'Lola Sousa', '1999-07-30', 'lola.sousa@gmail.com', 'Ativo', 3),
    (1, 'Sophia Almeida', '2001-03-18', 'sophia.almeida@gmail.com', 'Ativo', 2),
    (2, 'Vitor Costa', '1999-02-20', 'vitor.costa@gmail.com', 'Ativo', 3),
    (3, 'Isabella Lima', '1994-07-25', 'isabella.lima@gmail.com', 'Ativo', 1),
    (4, 'Leonardo Santos', '1996-04-10', 'leonardo.santos@gmail.com', 'Inativo', 2),
    (5, 'Lucio Martins', '1997-09-12', 'lucio.martins@mestredospythons.com', 'Ativo', 1);
    
    -- Tabela FinanceiroEstudante
INSERT INTO FinanceiroEstudante (id_estudante, id_curso, valor_total, valor_desconto, valor_pago, status_pagamento) VALUES
  (1, 1, 1500.00, 100.00, 1400.00, 'Pago'),
  (2, 2, 1800.00, 150.00, 1650.00, 'Pago'),
  (3, 3, 1300.00, 0.00, 1300.00, 'Pago'),
  (4, 4, 2000.00, 200.00, 1800.00, 'Pago'),
  (5, 5, 1600.00, 50.00, 1550.00, 'Pago'),
  (6, 1, 1500.00, 0.00, 1500.00, 'Pago'),
  (7, 2, 1800.00, 100.00, 1700.00, 'Pago'),
  (8, 3, 1300.00, 0.00, 1300.00, 'Pago'),
  (9, 4, 2000.00, 150.00, 1850.00, 'Pago'),
  (10, 5, 1600.00, 0.00, 1600.00, 'Pago'),
  (11, 1, 1500.00, 50.00, 1450.00, 'Pago'),
  (12, 2, 1800.00, 100.00, 1700.00, 'Pago'),
  (13, 3, 1300.00, 0.00, 1300.00, 'Pago'),
  (14, 4, 2000.00, 0.00, 2000.00, 'Pago'),
  (15, 5, 1600.00, 200.00, 1400.00, 'Pago');

-- Tabela FinanceiroResilia
INSERT INTO FinanceiroResilia (id_facilitador, tipo_despesa, valor_despesa) VALUES
  (1, 'Hospedagem', 500.00),
  (1, 'Material Didático', 300.00),
  (2, 'Hospedagem', 450.00),
  (2, 'Alimentação', 200.00),
  (3, 'Transporte', 150.00),
  (3, 'Material Didático', 250.00),
  (4, 'Alimentação', 180.00),
  (4, 'Transporte', 100.00),
  (5, 'Hospedagem', 400.00),
  (5, 'Alimentação', 180.00);
=======
-- Inserção de Cursos
INSERT INTO Curso (id_facilitador, nome, descricao, carga_horaria_total) VALUES
    (1, 'Desenvolvimento Web', 'Curso de desenvolvimento web utilizando HTML, CSS e JavaScript.', 120),
    (2, 'Ciência de Dados', 'Curso de ciência de dados com Python e análise de dados.', 180),
    (3, 'UX/UI Design', 'Curso de design de experiência do usuário (UX) e interface do usuário (UI).', 100),
    (4, 'Inteligência Artificial', 'Curso de inteligência artificial e machine learning.', 200),
    (5, 'Gestão de Projetos', 'Curso de gerenciamento de projetos utilizando metodologias ágeis.', 160);

-- Inserção de Turmas
INSERT INTO Turma (id_curso, nome, data_inicio, data_termino) VALUES
    (1, 'Turma A', '2023-08-01', '2023-10-30'),
    (2, 'Turma B', '2023-08-15', '2023-11-20'),
    (3, 'Turma C', '2023-09-01', '2023-12-05'),
    (2, 'Turma D', '2023-09-15', '2023-12-20'),
    (4, 'Turma E', '2023-10-01', '2023-12-15');

-- Inserção de Módulos
INSERT INTO Modulo (nome, descricao, carga_horaria, id_curso) VALUES
    ('Introdução ao Front-end', 'Conceitos básicos de desenvolvimento front-end.', 40, 1),
    ('Manipulação de Dados com Pandas', 'Utilização da biblioteca Pandas para manipulação de dados.', 60, 2),
    ('UX Design Principles', 'Princípios de design de experiência do usuário.', 30, 3),
    ('Aprendizado Supervisionado', 'Algoritmos de aprendizado supervisionado em machine learning.', 80, 4),
    ('Scrum e Kanban', 'Metodologias ágeis para gestão de projetos.', 50, 5);

-- Inserção de AulasDadas
INSERT INTO AulasDadas (id_modulo, id_facilitador, data_aula) VALUES
    (1, 1, '2023-08-05'),
    (2, 2, '2023-08-17'),
    (3, 1, '2023-08-02'),
    (4, 3, '2023-09-05'),
    (5, 1, '2023-08-18'),
    (1, 4, '2023-08-08'),
    (2, 5, '2023-08-25'),
    (3, 4, '2023-08-07'),
    (4, 1, '2023-09-10'),
    (5, 3, '2023-08-22');

-- Inserção de Estudantes
INSERT INTO Estudante (nome, data_nascimento, email, status, id_turma) VALUES
    ('Lucas Rolando', '1998-05-15', 'lucas.silva@gmail.com', 'Ativo', 1),
    ('Mariana Gomes', '1998-08-22', 'mariana.santos@gmail.com', 'Ativo', 2),
    ('Juliane Pereira', '1990-09-10', 'juliane.pereira@gmail.com', 'Inativo', 1),
    ('Ciro Oliveira', '1995-12-05', 'ciro.oliveira@gmail.com', 'Ativo', 3),
    ('Disney Almeida', '2000-03-18', 'disney.almeida@gmail.com', 'Ativo', 2),
    ('Manoel Gomes', '1998-02-20', 'manoel.gomes@gmail.com', 'Ativo', 3),
    ('Daniel Orivaldo', '1995-07-25', 'daniel.orivaldo@gmail.com', 'Ativo', 1),
    ('Juarez Santos', '1997-04-10', 'Juarez.santos@gmail.com', 'Inativo', 2),
    ('Jorge Oliveira', '1998-09-12', 'jorge.oliveira@gmail.com', 'Ativo', 1),
    ('Lola Sousa', '1999-07-30', 'lola.sousa@gmail.com', 'Ativo', 3),
    ('Sophia Almeida', '2001-03-18', 'sophia.almeida@gmail.com', 'Ativo', 2),
    ('Vitor Costa', '1999-02-20', 'vitor.costa@gmail.com', 'Ativo', 3),
    ('Isabella Lima', '1994-07-25', 'isabella.lima@gmail.com', 'Ativo', 1),
    ('Leonardo Santos', '1996-04-10', 'leonardo.santos@gmail.com', 'Inativo', 2),
    ('Lucio Martins', '1997-09-12', 'lucio.martins@mestredospythons.com', 'Ativo', 1);

-- Inserção de FinanceiroEstudante
INSERT INTO FinanceiroEstudante (id_estudante, id_curso, valor_total, valor_desconto, valor_pago, status_pagamento) VALUES
    (1, 1, 1500.00, 100.00, 1400.00, 'Pago'),
    (2, 2, 1800.00, 150.00, 1650.00, 'Pago'),
    (3, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (4, 4, 2000.00, 200.00, 1800.00, 'Pago'),
    (5, 5, 1600.00, 50.00, 1550.00, 'Pago'),
    (6, 1, 1500.00, 0.00, 1500.00, 'Pago'),
    (7, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (8, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (9, 4, 2000.00, 150.00, 1850.00, 'Pago'),
    (10, 5, 1600.00, 0.00, 1600.00, 'Pago'),
    (11, 1, 1500.00, 50.00, 1450.00, 'Pago'),
    (12, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (13, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (14, 4, 2000.00, 0.00, 2000.00, 'Pago'),
    (15, 5, 1600.00, 200.00, 1400.00, 'Pago');

-- Inserção de ParticipacaoEstudante
INSERT INTO ParticipacaoEstudante (id_estudante, id_aula) VALUES
    (1, 1),
    (2, 2),
    (1, 3),
    (3, 4),
    (2, 5),
    (1, 6),
    (2, 7),
    (3, 8),
    (1, 9),
    (4, 10),
    (1, 5),
    (2, 6),
    (3, 7),
    (4, 8),
    (5, 9);

-- Inserção de FinanceiroFacilitador
INSERT INTO FinanceiroFacilitador (id_facilitador, id_aula, valor_aula, data_pagamento) VALUES
    (1, 1, 100.00, '2023-08-06'),
    (2, 2, 150.00, '2023-08-18'),
    (1, 3, 120.00, '2023-08-03'),
    (3, 4, 180.00, '2023-09-06'),
    (1, 5, 90.00, '2023-08-19');
>>>>>>> ad55c62e8d60777ba48af1032f92bcd16d955f21
