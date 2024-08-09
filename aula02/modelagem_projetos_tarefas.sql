-- Criação do banco de dados e tabelas para Projetos e Tarefas

-- Cria a tabela de projetos
CREATE TABLE projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada projeto
    nome TEXT NOT NULL UNIQUE, -- Nome do projeto (domínio: texto, não nulo e único)
    descricao TEXT, -- Descrição opcional do projeto
    data_inicio DATE, -- Data de início do projeto (domínio: data)
    data_fim DATE -- Data de término do projeto (domínio: data)
);

-- Cria a tabela de tarefas
CREATE TABLE tarefas (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada tarefa
    nome TEXT NOT NULL, -- Nome da tarefa (domínio: texto, não nulo)
    descricao TEXT, -- Descrição opcional da tarefa
    projeto_id INTEGER, -- Referência ao projeto ao qual a tarefa pertence
    tarefa_pai_id INTEGER, -- Referência à tarefa pai para autorrelacionamento
    CONSTRAINT fk_projeto
        FOREIGN KEY (projeto_id) -- Chave Estrangeira: Referência ao projeto
        REFERENCES projetos (id)
        ON DELETE SET NULL, -- Se o projeto for excluído, a referência à tarefa será definida como NULL
    CONSTRAINT fk_tarefa_pai
        FOREIGN KEY (tarefa_pai_id) -- Chave Estrangeira: Referência à tarefa pai
        REFERENCES tarefas (id)
        ON DELETE SET NULL -- Se a tarefa pai for excluída, a referência à tarefa pai será definida como NULL
);

-- Cria a tabela de associações entre tarefas para o autorrelacionamento muitos para muitos
CREATE TABLE tarefa_associacoes (
    tarefa_id1 INTEGER, -- Referência à primeira tarefa na associação
    tarefa_id2 INTEGER, -- Referência à segunda tarefa na associação
    PRIMARY KEY (tarefa_id1, tarefa_id2), -- Chave Primária composta para garantir a unicidade da associação
    CONSTRAINT fk_tarefa1
        FOREIGN KEY (tarefa_id1) -- Chave Estrangeira: Referência à primeira tarefa
        REFERENCES tarefas (id)
        ON DELETE CASCADE, -- Se a tarefa for excluída, a associação será removida
    CONSTRAINT fk_tarefa2
        FOREIGN KEY (tarefa_id2) -- Chave Estrangeira: Referência à segunda tarefa
        REFERENCES tarefas (id)
        ON DELETE CASCADE -- Se a tarefa for excluída, a associação será removida
);

-- Inserindo dados de exemplo

-- Projetos
INSERT INTO projetos (nome, descricao, data_inicio, data_fim) VALUES ('Desenvolvimento Web', 'Desenvolvimento de uma aplicação web', '2024-01-01', '2024-06-30');
INSERT INTO projetos (nome, descricao, data_inicio, data_fim) VALUES ('Infraestrutura de TI', 'Atualização da infraestrutura de TI', '2024-02-01', '2024-05-31');

-- Tarefas
INSERT INTO tarefas (nome, descricao, projeto_id, tarefa_pai_id) VALUES ('Design da Interface', 'Criar o design da interface do usuário', 1, NULL);
INSERT INTO tarefas (nome, descricao, projeto_id, tarefa_pai_id) VALUES ('Desenvolvimento Backend', 'Implementar o backend da aplicação', 1, NULL);
INSERT INTO tarefas (nome, descricao, projeto_id, tarefa_pai_id) VALUES ('Configuração de Servidor', 'Configurar servidores para a aplicação', 2, NULL);
INSERT INTO tarefas (nome, descricao, projeto_id, tarefa_pai_id) VALUES ('Escolher Tecnologias', 'Escolher as tecnologias a serem usadas', 2, NULL);

-- Associações entre tarefas (autorrelacionamento muitos para muitos)
INSERT INTO tarefa_associacoes (tarefa_id1, tarefa_id2) VALUES (1, 2); -- A tarefa 1 está associada à tarefa 2
INSERT INTO tarefa_associacoes (tarefa_id1, tarefa_id2) VALUES (3, 4); -- A tarefa 3 está associada à tarefa 4

-- Comentários explicativos

-- **Atributo chave:** Cada tabela possui uma coluna `id` que é uma chave primária, garantindo a unicidade dos registros. A tabela `tarefas` inclui a coluna `tarefa_pai_id` como chave estrangeira para referenciar uma tarefa pai, estabelecendo uma relação de um para muitos entre tarefas.

-- **Autorrelacionamento um para muitos:** Na tabela `tarefas`, o campo `tarefa_pai_id` permite que uma tarefa tenha várias sub-tarefas, enquanto cada sub-tarefa pertence a apenas uma tarefa pai. Esse é um exemplo de autorrelacionamento um para muitos, onde uma tarefa pode ser subdividida em várias sub-tarefas.

-- **Autorrelacionamento muitos para muitos:** A tabela `tarefa_associacoes` permite criar associações entre tarefas, onde várias tarefas podem estar associadas a várias outras tarefas. A chave primária composta por `(tarefa_id1, tarefa_id2)` garante a unicidade das associações, e as chaves estrangeiras garantem a integridade referencial. A exclusão de uma tarefa remove automaticamente todas as associações relacionadas.


