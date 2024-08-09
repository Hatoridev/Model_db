import sqlite3
import hashlib

# Definir o usuário e senha fixos
admin_username = "SeuUsuario"
admin_password_hash = hashlib.sha256("SuaSenha".encode()).hexdigest()

def create_tables(connection):
    cursor = connection.cursor()
    
    # Criação da tabela Courses
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Courses (
        CourseID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Chave primária: Identificador único do curso
        CourseName TEXT NOT NULL UNIQUE              -- Nome do curso (domínio: texto, não nulo e único)
    );
    ''')

    # Criação da tabela Students
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Students (
        StudentID INTEGER PRIMARY KEY AUTOINCREMENT, -- Chave primária: Identificador único do aluno
        StudentName TEXT NOT NULL UNIQUE             -- Nome do aluno (domínio: texto, não nulo e único)
    );
    ''')

    # Criação da tabela Enrollments (relacionamento muitos-para-muitos)
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Enrollments (
        EnrollmentID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Chave primária: Identificador único da matrícula
        StudentID INTEGER,                               -- Referência ao aluno
        CourseID INTEGER,                                -- Referência ao curso
        FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Chave estrangeira para a tabela de alunos
        FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),   -- Chave estrangeira para a tabela de cursos
        UNIQUE (StudentID, CourseID)                     -- Garantia de que um aluno não pode se matricular no mesmo curso mais de uma vez
    );
    ''')
    
    connection.commit()

def insert_sample_data(connection):
    cursor = connection.cursor()
    
    courses = ["Introduction to Programming", "Data Structures", "Database Management"]
    students = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Grace", "Hannah", "Ian", "Jack", "Kara", "Leo", "Mona", "Nina", "Oscar"]

    # Inserir cursos
    for course in courses:
        cursor.execute('INSERT OR IGNORE INTO Courses (CourseName) VALUES (?);', (course,))
    
    # Inserir alunos
    for student in students:
        cursor.execute('INSERT OR IGNORE INTO Students (StudentName) VALUES (?);', (student,))
    
    connection.commit()

def authenticate_user():
    username = input("Enter username: ")
    password = input("Enter password: ")
    hashed_password = hashlib.sha256(password.encode()).hexdigest()
    
    return username == admin_username and hashed_password == admin_password_hash

def insert_additional_data(connection):
    cursor = connection.cursor()
    
    while True:
        print("\n1. Add New Student")
        print("2. Add New Course")
        print("3. Exit")
        choice = input("Enter your choice: ")
        
        if choice == '1':
            student_name = input("Enter student name: ")
            cursor.execute('INSERT INTO Students (StudentName) VALUES (?);', (student_name,))
            connection.commit()
            print("Student added successfully.")
        
        elif choice == '2':
            course_name = input("Enter course name: ")
            cursor.execute('INSERT INTO Courses (CourseName) VALUES (?);', (course_name,))
            connection.commit()
            print("Course added successfully.")
        
        elif choice == '3':
            break
        
        else:
            print("Invalid choice. Please try again.")

def main():
    connection = sqlite3.connect('techacademy.db')
    
    create_tables(connection)
    insert_sample_data(connection)
    print("Data inserted successfully.")
    
    if authenticate_user():
        print("Authentication successful.")
        insert_additional_data(connection)
    else:
        print("Authentication failed.")
    
    connection.close()

if __name__ == "__main__":
    main()

# Comentários Explicativos:

# - **Definições de Usuário e Senha:** Define o usuário e a senha fixos para autenticação.

# - **`create_tables(connection)`:** Cria as tabelas `Courses`, `Students` e `Enrollments` no banco de dados se ainda não existirem.

# - **`insert_sample_data(connection)`:** Insere dados de exemplo nas tabelas `Courses` e `Students`.

# - **`authenticate_user()`:** Solicita nome de usuário e senha e verifica se são válidos comparando com as credenciais definidas.

# - **`insert_additional_data(connection)`:** Permite a inserção de novos alunos e cursos no banco de dados após autenticação bem-sucedida.

# - **`main()`:** Função principal que gerencia o fluxo do programa: conecta ao banco de dados, cria tabelas, insere dados, e lida com a autenticação e inserção de dados adicionais.

