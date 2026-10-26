-- Active: 1792540998325@@127.0.0.1@5432@bd_plano_saude@public
DROP TABLE IF EXISTS planilha_atendimento;
DROP VIEW  IF EXISTS vw_dependente;
DROP VIEW  IF EXISTS vw_consulta;
DROP TABLE IF EXISTS exame_solicitado;
DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS credenciamento;
DROP TABLE IF EXISTS telefone;
DROP TABLE IF EXISTS medico;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS especialidade;
DROP TABLE IF EXISTS convenio;
DROP TABLE IF EXISTS pessoa;

CREATE TABLE pessoa (
    id              INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            TEXT    NOT NULL,
    cpf             TEXT    NOT NULL UNIQUE,
    data_nascimento DATE    NOT NULL,
    logradouro      TEXT    NOT NULL,
    numero          TEXT    NOT NULL,
    bairro          TEXT    NOT NULL,
    cidade          TEXT    NOT NULL
);

CREATE TABLE telefone (
    pessoa_id INTEGER NOT NULL REFERENCES pessoa (id),
    numero    TEXT    NOT NULL,
    PRIMARY KEY (pessoa_id, numero)
);