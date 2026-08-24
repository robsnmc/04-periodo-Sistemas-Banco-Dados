CREATE TABLE notas_alunos (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    aluno_nome TEXT NOT NULL,
    turma TEXT NOT NULL,
    disciplina TEXT NOT NULL,
    nota INTEGER NOT NULL,
    faltas INTEGER NOT NULL,
    data_avaliacao DATE NOT NULL
)

SELECT * FROM notas_alunos;

SELECT aluno_nome, disciplina, nota FROM notas_alunos
ORDER BY nota DESC
LIMIT 10;

SELECT aluno_nome, disciplina, nota FROM notas_alunos
WHERE nota >= 70
and disciplina = 'Matematica'