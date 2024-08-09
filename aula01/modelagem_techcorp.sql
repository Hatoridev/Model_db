-- Criação do banco de dados e tabelas para a TechCorp

-- Cria a tabela de departamentos
CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada departamento
    nome TEXT NOT NULL UNIQUE, -- Nome do departamento (domínio: texto, não nulo e único)
    descricao TEXT, -- Descrição opcional do departamento
    departamento_pai_id INTEGER, -- Referência ao departamento pai (para hierarquia)
    CONSTRAINT fk_departamento_pai
        FOREIGN KEY (departamento_pai_id) -- Chave Estrangeira: Referência ao departamento pai
        REFERENCES departamentos (id)
        ON DELETE SET NULL -- Se o departamento pai for excluído, o valor será definido como NULL
);

-- Cria a tabela de funcionários
CREATE TABLE funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada funcionário
    nome TEXT NOT NULL, -- Nome do funcionário (domínio: texto, não nulo)
    cargo TEXT NOT NULL, -- Cargo do funcionário (domínio: texto, não nulo)
    salario DECIMAL(10, 2) NOT NULL, -- Salário do funcionário (domínio: decimal, não nulo)
    departamento_id INTEGER, -- Referência ao departamento do funcionário
    CONSTRAINT fk_departamento_funcionario
        FOREIGN KEY (departamento_id) -- Chave Estrangeira: Referência ao departamento do funcionário
        REFERENCES departamentos (id)
        ON DELETE SET NULL -- Se o departamento for excluído, o valor será definido como NULL
);

-- Cria a tabela de projetos
CREATE TABLE projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada projeto
    nome TEXT NOT NULL, -- Nome do projeto (domínio: texto, não nulo)
    descricao TEXT, -- Descrição opcional do projeto
    data_inicio DATE, -- Data de início do projeto (domínio: data)
    data_fim DATE, -- Data de término do projeto (domínio: data)
    departamento_id INTEGER, -- Referência ao departamento responsável pelo projeto
    CONSTRAINT fk_departamento_projeto
        FOREIGN KEY (departamento_id) -- Chave Estrangeira: Referência ao departamento responsável pelo projeto
        REFERENCES departamentos (id)
        ON DELETE SET NULL -- Se o departamento for excluído, o valor será definido como NULL
);

-- Cria a tabela de atribuições de funcionários a projetos
CREATE TABLE atribuicoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada atribuição
    funcionario_id INTEGER, -- Referência ao funcionário
    projeto_id INTEGER, -- Referência ao projeto
    data_inicio DATE, -- Data de início da atribuição (domínio: data)
    data_fim DATE, -- Data de término da atribuição (domínio: data)
    CONSTRAINT fk_funcionario
        FOREIGN KEY (funcionario_id) -- Chave Estrangeira: Referência ao funcionário
        REFERENCES funcionarios (id)
        ON DELETE CASCADE, -- Se o funcionário for excluído, a atribuição será excluída
    CONSTRAINT fk_projeto
        FOREIGN KEY (projeto_id) -- Chave Estrangeira: Referência ao projeto
        REFERENCES projetos (id)
        ON DELETE CASCADE -- Se o projeto for excluído, a atribuição será excluída
);

-- Inserindo dados nos departamentos
INSERT INTO departamentos (nome, descricao) VALUES ('Desenvolvimento', 'Departamento responsável pelo desenvolvimento de software');
INSERT INTO departamentos (nome, descricao, departamento_pai_id) VALUES ('Backend', 'Subdivisão do Desenvolvimento focada em backend', 1);
INSERT INTO departamentos (nome, descricao, departamento_pai_id) VALUES ('Frontend', 'Subdivisão do Desenvolvimento focada em frontend', 1);
INSERT INTO departamentos (nome, descricao) VALUES ('Infraestrutura', 'Departamento responsável pela infraestrutura e suporte');
INSERT INTO departamentos (nome, descricao) VALUES ('Suporte Técnico', 'Departamento responsável pelo suporte técnico aos usuários');

-- Inserindo dados nos funcionários
INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES ('Ana Silva', 'Desenvolvedora Backend', 7000.00, 2);
INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES ('Pedro Santos', 'Desenvolvedor Frontend', 6500.00, 3);
INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES ('Maria Oliveira', 'Analista de Infraestrutura', 7500.00, 4);
INSERT INTO funcionarios (nome, cargo, salario, departamento_id) VALUES ('Lucas Almeida', 'Especialista em Suporte Técnico', 6000.00, 5);

-- Inserindo dados nos projetos
INSERT INTO projetos (nome, descricao, data_inicio, data_fim, departamento_id) VALUES ('Projeto Alpha', 'Desenvolvimento de nova aplicação web', '2024-01-15', '2024-06-30', 1);
INSERT INTO projetos (nome, descricao, data_inicio, data_fim, departamento_id) VALUES ('Infraestrutura Cloud', 'Atualização da infraestrutura para nuvem', '2024-02-01', '2024-05-15', 4);
INSERT INTO projetos (nome, descricao, data_inicio, data_fim, departamento_id) VALUES ('Suporte ao Cliente', 'Melhoria do sistema de suporte ao cliente', '2024-03-01', '2024-08-30', 5);

-- Inserindo dados nas atribuições
INSERT INTO atribuicoes (funcionario_id, projeto_id, data_inicio, data_fim) VALUES (1, 1, '2024-01-15', '2024-06-30');
INSERT INTO atribuicoes (funcionario_id, projeto_id, data_inicio, data_fim) VALUES (2, 1, '2024-01-15', '2024-06-30');
INSERT INTO atribuicoes (funcionario_id, projeto_id, data_inicio, data_fim) VALUES (3, 2, '2024-02-01', '2024-05-15');
INSERT INTO atribuicoes (funcionario_id, projeto_id, data_inicio, data_fim) VALUES (4, 3, '2024-03-01', '2024-08-30');

-- Comentários explicativos

-- **Domínio:** Refere-se ao tipo de dado que cada coluna pode conter. Por exemplo, `TEXT` para textos, `DECIMAL` para valores monetários, e `DATE` para datas. O domínio define as regras e o tipo de dado aceitável para cada coluna.

-- **Chave Primária:** É uma coluna (ou um conjunto de colunas) que identifica de forma única cada linha em uma tabela. Por exemplo, `id` em todas as tabelas é uma chave primária que garante a unicidade de cada registro.

-- **Chave Estrangeira:** É uma coluna que estabelece um vínculo entre duas tabelas, referenciando a chave primária de outra tabela. Por exemplo, `departamento_id` em `funcionarios` é uma chave estrangeira que referencia `id` na tabela `departamentos`, garantindo integridade referencial.

-- **ON DELETE SET NULL:** Quando um registro referenciado é excluído, o valor da chave estrangeira é definido como `NULL`. Isso é útil em relações opcionais, onde a existência de um registro não é obrigatória para o relacionamento.

-- **ON DELETE CASCADE:** Quando um registro referenciado é excluído, todos os registros relacionados na tabela dependente também são excluídos. Isso é útil em relações obrigatórias, onde a exclusão de um registro principal deve remover automaticamente os registros associados.


