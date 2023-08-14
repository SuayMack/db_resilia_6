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