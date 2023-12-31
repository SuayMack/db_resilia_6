CREATE DATABASE IF NOT EXISTS resilia_6;
USE resilia_6;
-- Tabela PessoaFacilitadora
CREATE TABLE IF NOT EXISTS PessoaFacilitadora (
  id_facilitador INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE,
  email VARCHAR(100) NOT NULL,
  formacao VARCHAR(100),
  experiencia VARCHAR(200)
);
-- Tabela Curso
CREATE TABLE IF NOT EXISTS Curso (
  id_curso INT AUTO_INCREMENT PRIMARY KEY,
  id_facilitador INT,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200),
  carga_horaria_total INT,
  FOREIGN KEY (id_facilitador) REFERENCES PessoaFacilitadora(id_facilitador)
);

-- Tabela Turma
CREATE TABLE IF NOT EXISTS Turma (
  id_turma INT AUTO_INCREMENT PRIMARY KEY,
  id_curso INT,
  nome VARCHAR(100) NOT NULL,
  data_inicio DATE,
  data_termino DATE,  
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela Estudante
CREATE TABLE IF NOT EXISTS Estudante (
  id_estudante INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE,
  email VARCHAR(100) NOT NULL,
  status VARCHAR(20),
  id_turma INT,
  FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

-- Tabela Modulo
CREATE TABLE IF NOT EXISTS Modulo (
  id_modulo INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200),
  carga_horaria INT,
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela AulasDadas
CREATE TABLE IF NOT EXISTS AulasDadas (
  id_aula INT AUTO_INCREMENT PRIMARY KEY,
  id_modulo INT,
  id_facilitador INT,
  data_aula DATE,
  FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo),
  FOREIGN KEY (id_facilitador) REFERENCES PessoaFacilitadora(id_facilitador)
);

-- Tabela ParticipacaoEstudante
CREATE TABLE IF NOT EXISTS ParticipacaoEstudante (
  id_participacao INT AUTO_INCREMENT PRIMARY KEY,
  id_estudante INT,
  id_aula INT,
  FOREIGN KEY (id_estudante) REFERENCES Estudante(id_estudante),
  FOREIGN KEY (id_aula) REFERENCES AulasDadas(id_aula)
);

-- Tabela FinanceiroEstudante
CREATE TABLE IF NOT EXISTS FinanceiroEstudante (
  id_financeiro INT AUTO_INCREMENT PRIMARY KEY,
  id_estudante INT,
  id_curso INT,
  valor_total DECIMAL(10, 2),
  valor_desconto DECIMAL(10, 2),
  valor_pago DECIMAL(10, 2),
  status_pagamento VARCHAR(50),
  FOREIGN KEY (id_estudante) REFERENCES Estudante(id_estudante),
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela FinanceiroFacilitador
CREATE TABLE IF NOT EXISTS FinanceiroFacilitador (
  id_financeiro INT AUTO_INCREMENT PRIMARY KEY,
  id_facilitador INT,
  id_aula INT,
  valor_aula DECIMAL(10, 2),
  data_pagamento DATE,
  FOREIGN KEY (id_facilitador) REFERENCES PessoaFacilitadora(id_facilitador),
  FOREIGN KEY (id_aula) REFERENCES AulasDadas(id_aula)
);

-- Inserção de Pessoas Facilitadoras
INSERT INTO PessoaFacilitadora (nome, data_nascimento, email, formacao, experiencia) VALUES
    ('João Gomes', '1988-10-15', 'joao.silva@example.com', 'Engenheiro de Software', '10 anos de experiência'),
    ('Maria Souza', '1999-09-22', 'maria.souza@example.com', 'Desenvolvedora Web', '8 anos de experiência'),
    ('Pedro Santos', '1990-09-10', 'pedro.santos@example.com', 'Cientista de Dados', '15 anos de experiência'),
    ('Ana Oliveira', '1987-12-05', 'ana.oliveira@example.com', 'Designer de UI/UX', '6 anos de experiência'),
    ('Lucas Pereira', '1982-03-18', 'lucas.pereira@example.com', 'Analista de Sistemas', '12 anos de experiência');

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
    ('Lucio Martins', '1997-09-12', 'lucio.martins@mestredospythons.com', 'Ativo', 1),
    ('Sofia Almeida','1997-06-19', 'sofalmeida@gmail.com', 'Ativo', 1),
    ('Lucas Pereira','1998-10-09', 'lucasp@gmail.com','Ativo', 2),
    ('Mateus Oliveira','1996-10-03','matheusol@gmail.com', 'Ativo', 1),
    ('Gabriela Silva','1995-05-05', 'gs@gmail.com','Inativo',1),
    ('Manuela Rodrigues','2000-03-03','manuzinha123@gmail.com', 'Inativo', 1),
    ('Enzo Ferreira', '2001-10-10', 'enzolegal@gmail.com', 'Ativo',1),
    ('Luana Martins','1999-07-07', 'luanamartins1@gmail.com', 'Ativo', 2),
    ('Daniel Barbosa', '1987-05-05', 'danielzinho14@gmail.com', 'Ativo', 2),
    ('Julia Carvalho', '1981-01-01', 'juliacarvalho@gmail.com', 'Ativo', 1),
    ('Pedro Sousa', '1985-05-03', 'pedro1985@gmail.com', 'Ativo', 1),
    ('Laura Gomes', '1998-02-04', 'laurinha10@gmail.com', 'Ativo',2),
    ('Gabriel Fernandes','2000-10-14', 'gabrielvidaloca@gmail.com', 'Ativo',1),
    ('Alice Ribeiro','1987-12-20', 'alice20@gmail.com','Inativo', 2),
    ('Rafael Lima', '1997-06-15','rafalima@gmail.com', 'Ativo',1),
    ('Beatriz Andrade', '1971-04-04', 'beaandrade@gmail.com', 'Ativo', 1),
    ('João Castro', '1974-05-25', 'joaocastro1@gmail.com', 'Ativo', 1),
    ('Eduarda Miranda', '1985-11-26', 'eduardam@gmail.com', 'Ativo', 1),
    ('André Neves', '1984-03-29', 'andrezinho1@gmail.com', 'Ativo', 2),
    ('Fernando Soares', '1985-07-10', 'Fernandinho@gmail.com', 'Inativo', 1),
    ('Debora Fernandes', '1999-10-14', 'deborafernandes@gmail.com', 'Ativo', 1),
    ('Ana Paula Pontes', '1978-10-17', 'aninhapp@gmail.com', 'Ativo', 1),
    ('Cassio Tomé', '1985-06-19', 'cassioraimundo@gmail.com', 'Ativo', 1),
    ('Cassando Fernando Castro', '2000-06-14', 'cassandrinhofc@gmail.com', 'Ativo', 2),
    ('Camile Vicentino', '2001-04-22', 'camilevicentino@gmail.com', 'Ativo', 1),
    ('Alessandro Fontes', '1978-10-31', 'alefontes@gmail.com', 'Ativo', 2),
    ('Karla Cristina Noronha', '1981-08-31', 'karlacnoronha@gmail.com', 'Inativo', 1),
    ('Mauro Resende', '1994-10-26', 'maurinhoresende@gmail.com', 'Ativo', 1),
    ('Taina Costa', '1994-01-01', 'tainacosta@gmail.com', 'Ativo', 2),
    ('Ingrid  Horanna', '1995-04-04', 'ingridh@gmail.com', 'Inativo', 2),
    ('Lara Silva', '2002-05-05', 'larinhasilva@gmail.com', 'Ativo', 1),
    ('Pedro Scoob', '1985-06-06', 'pedroscoob@gmail.com', 'Ativo', 1),
    ('Anita Garibaldi', '1987-07-07', 'anita@gmail.coom', 'Ativo', 1),
    ('Francisco Santos', '1982-08-08', 'franciscosantos@gmail.com', 'Ativo', 2),
    ('Yuri Albani', '1983-09-09', 'yurialbani@gmail.com', 'Ativo', 2),
    ('Cleberson Camargo', '1994-10-12', 'clebersoncamargo@gmail.com', 'Ativo', 1),
    ('Antonio Xavier', '1979-02-28', 'antoniox@gmail.com', 'Inativo', 1);

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
    (15, 5, 1600.00, 200.00, 1400.00, 'Pago'),
    (16, 1, 1500.00, 100.00, 1400.00, 'Pago'),
    (17, 2, 1800.00, 150.00, 1650.00, 'Pago'),
    (18, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (19, 4, 2000.00, 200.00, 1800.00, 'Pago'),
    (20, 5, 1600.00, 50.00, 1550.00, 'Pago'),
    (21, 1, 1500.00, 0.00, 1500.00, 'Pago'),
    (22, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (23, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (24, 4, 2000.00, 150.00, 1850.00, 'Pago'),
    (25, 5, 1600.00, 0.00, 1600.00, 'Pago'),
    (26, 1, 1500.00, 50.00, 1450.00, 'Pago'),
    (27, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (28, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (29, 4, 2000.00, 0.00, 2000.00, 'Pago'),
    (30, 5, 1600.00, 200.00, 1400.00, 'Pago'),
    (31, 1, 1500.00, 100.00, 1400.00, 'Pago'),
    (32, 2, 1800.00, 150.00, 1650.00, 'Pago'),
    (33, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (34, 4, 2000.00, 200.00, 1800.00, 'Pago'),
    (35, 5, 1600.00, 50.00, 1550.00, 'Pago'),
    (36, 1, 1500.00, 0.00, 1500.00, 'Pago'),
    (37, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (38, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (39, 4, 2000.00, 150.00, 1850.00, 'Pago'),
    (40, 5, 1600.00, 0.00, 1600.00, 'Pago'),
    (41, 1, 1500.00, 50.00, 1450.00, 'Pago'),
    (42, 2, 1800.00, 100.00, 1700.00, 'Pago'),
    (43, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (44, 4, 2000.00, 0.00, 2000.00, 'Pago'),
    (45, 5, 1600.00, 200.00, 1400.00, 'Pago'),
    (46, 1, 1500.00, 100.00, 1400.00, 'Pago'),
    (47, 2, 1800.00, 150.00, 1650.00, 'Pago'),
    (48, 3, 1300.00, 0.00, 1300.00, 'Pago'),
    (49, 4, 2000.00, 200.00, 1800.00, 'Pago'),
    (50, 5, 1600.00, 50.00, 1550.00, 'Pago'),
    (51, 1, 1500.00, 50.00, 1450.00, 'Pago');

-- Inserção de ParticipacaoEstudante
INSERT INTO ParticipacaoEstudante (id_estudante, id_aula) VALUES
    (1, 1),
    (2, 2),
    (1, 3),
    (31, 4),
    (2, 5),
    (1, 6),
    (2, 7),
    (32, 8),
    (1, 9),
    (4, 10),
    (1, 5),
    (2, 6),
    (34, 7),
    (4, 8),
    (5, 9),
    (11, 1),
    (22, 2),
    (41, 3),
    (33, 4),
    (12, 5),
    (31, 6),
    (32, 7),
    (23, 8),
    (21, 9),
    (26, 10),
    (28, 5),
    (48, 6),
    (27, 7),
    (36, 8),
    (45, 9),
    (49, 1),
    (20, 2),
    (30, 3),
    (46, 4),
    (42, 5),
    (29, 6),
    (39, 7),
    (49, 8),
    (48, 9),
    (48, 10),
    (37, 5),
    (38, 6),
    (31, 7),
    (45, 8),
    (41, 9);

-- Inserção de FinanceiroFacilitador
INSERT INTO FinanceiroFacilitador (id_facilitador, id_aula, valor_aula, data_pagamento) VALUES
    (1, 1, 100.00, '2023-08-06'),
    (2, 2, 150.00, '2023-08-18'),
    (1, 3, 120.00, '2023-08-03'),
    (3, 4, 180.00, '2023-09-06'),
    (1, 5, 90.00, '2023-08-19');
