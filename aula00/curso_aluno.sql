-- Active: 1787096545685@@127.0.0.1@5432@bd_aula@public
CREATE TABLE curso(
    id_curso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE aluno(
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    id_curso INTEGER NOT NULL REFERENCES curso(id_curso)
);

SELECT * FROM curso;
SELECT * FROM aluno;

INSERT INTO curso (nome) VALUES
('Sistemas de Informacao'),
('Adminitracao'),
('Direito'),
('Ciencia da Computacao');

INSERT INTO aluno (nome, id_curso) VALUES
('Ana Beatriz Souza', 1),
('Carlos Henrique Lima', 1),
('Daniela Martins', 2),
('Eduardo Pereira', 3),
('Fernando Rocha', 1)

SELECT id_aluno, nome, id_curso FROM aluno ORDER BY id_aluno ASC;

SELECT table_name,
       column_name,
       data_type,
       character_maximum_length AS tamanho,
       is_nullable              AS aceita_nulo,
       is_identity              AS e_identidade
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('curso', 'aluno')
ORDER BY table_name, ordinal_position;

SELECT
    nome,
    id_curso
FROM
    aluno
WHERE
    id_curso = 1
ORDER BY
    nome DESC;

SELECT
    a.nome AS aluno,
    c.nome AS curso
FROM
    aluno a
    JOIN curso c ON c.id_curso = a.id_curso
ORDER BY c.nome;

SELECT 
    c.nome AS curso,
    COUNT(a.id_aluno) AS qnt_alunos
FROM
    curso c
    JOIN aluno a ON a.id_curso = c.id_curso
GROUP BY curso
ORDER BY qnt_alunos DESC;