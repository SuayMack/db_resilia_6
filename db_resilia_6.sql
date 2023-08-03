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
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(200),
  carga_horaria_total INT
);

-- Tabela Turma
CREATE TABLE IF NOT EXISTS Turma (
  id_turma INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_inicio DATE,
  data_termino DATE,
  id_curso INT,
  FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
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
