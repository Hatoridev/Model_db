-- Criação do banco de dados e tabelas para TechAcademy

-- Cria a tabela de cursos
CREATE TABLE IF NOT EXISTS Courses (
    CourseID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Chave primária: Identificador único do curso
    CourseName TEXT NOT NULL UNIQUE              -- Nome do curso (domínio: texto, não nulo e único)
);

-- Cria a tabela de alunos
CREATE TABLE IF NOT EXISTS Students (
    StudentID INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave primária: Identificador único do aluno
    StudentName TEXT NOT NULL UNIQUE             -- Nome do aluno (domínio: texto, não nulo e único)
);

-- Cria a tabela de matrículas (relacionamento muitos-para-muitos entre alunos e cursos)
CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Chave primária: Identificador único da matrícula
    StudentID INTEGER,                               -- Referência ao aluno
    CourseID INTEGER,                                -- Referência ao curso
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Chave estrangeira para a tabela de alunos
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),   -- Chave estrangeira para a tabela de cursos
    UNIQUE (StudentID, CourseID)                     -- Garantia de que um aluno não pode se matricular no mesmo curso mais de uma vez
);

-- Comentários explicativos

-- **UNIQUE:** Garante que não haja duplicação dos valores nas colunas.

-- **FOREIGN KEY:** Mantém a integridade referencial entre tabelas.

-- **NOT NULL:** Garante que as colunas não aceitem valores nulos.

