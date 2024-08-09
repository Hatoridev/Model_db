-- Criação do banco de dados e tabelas para Funcionários e Projetos

-- Cria a tabela de funcionários
CREATE TABLE funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada funcionário
    nome TEXT NOT NULL, -- Nome do funcionário (domínio: texto, não nulo)
    salario DECIMAL(10, 2) CHECK (salario >= 0) NOT NULL DEFAULT 0.00, -- Salário do funcionário (domínio: decimal, não nulo, com valor padrão e restrição de CHECK para valores não negativos)
    data_admissao DATE NOT NULL DEFAULT CURRENT_DATE, -- Data de admissão (domínio: data, não nulo, com valor padrão de data atual)
    email TEXT UNIQUE, -- Email do funcionário (domínio: texto, único)
    CONSTRAINT chk_nome CHECK (length(nome) > 0) -- Restrição CHECK para garantir que o nome não esteja vazio
);

-- Cria a tabela de projetos
CREATE TABLE projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave Primária: Identificador único para cada projeto
    nome TEXT NOT NULL UNIQUE, -- Nome do projeto (domínio: texto, não nulo e único)
    descricao TEXT, -- Descrição opcional do projeto
    data_inicio DATE NOT NULL DEFAULT CURRENT_DATE, -- Data de início do projeto (domínio: data, não nulo, com valor padrão de data atual)
    data_fim DATE CHECK (data_fim >= data_inicio) -- Data de término do projeto (domínio: data, com restrição CHECK para garantir que a data de término não seja anterior à data de início)
);

-- Inserindo dados de exemplo

-- Funcionários
INSERT INTO funcionarios (nome, salario, email) VALUES ('Ana Silva', 5000.00, 'ana.silva@example.com');
INSERT INTO funcionarios (nome, salario, email) VALUES ('Pedro Santos', 4500.00, 'pedro.santos@example.com');
INSERT INTO funcionarios (nome, salario) VALUES ('Maria Oliveira', 4800.00); -- Sem e-mail fornecido

-- Projetos
INSERT INTO projetos (nome, descricao) VALUES ('Sistema de RH', 'Desenvolvimento de um sistema de gerenciamento de recursos humanos');
INSERT INTO projetos (nome, descricao, data_fim) VALUES ('Plataforma de E-learning', 'Criação de uma plataforma de ensino online', '2024-12-31');

-- Comentários explicativos

-- **Restrições CHECK:** A restrição `CHECK (salario >= 0)` na tabela `funcionarios` garante que o salário não seja negativo. A restrição `CHECK (data_fim >= data_inicio)` na tabela `projetos` assegura que a data de término não seja anterior à data de início. A restrição `CHECK (length(nome) > 0)` garante que o nome do funcionário não esteja vazio.

-- **Nulidade:** A coluna `nome` na tabela `funcionarios` e a coluna `nome` na tabela `projetos` são definidas como `NOT NULL`, significando que esses campos são obrigatórios e não podem ser nulos. Já a coluna `descricao` na tabela `projetos` e a coluna `email` na tabela `funcionarios` são opcionais, permitindo valores nulos.

-- **Unicidade e UNIQUE:** A coluna `email` na tabela `funcionarios` e a coluna `nome` na tabela `projetos` têm a restrição `UNIQUE`, garantindo que não haja valores duplicados nessas colunas.

-- **DEFAULT:** As colunas `salario` e `data_admissao` na tabela `funcionarios` têm valores padrão definidos, `0.00` e `CURRENT_DATE`, respectivamente. A coluna `data_inicio` na tabela `projetos` também tem um valor padrão de `CURRENT_DATE`.


