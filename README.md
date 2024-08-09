# Model_db

Repository with small examples of Data Modeling using SQLite, some in conjunction with Python.

## Como Executar

### Termux (Android):
1. **Abra o aplicativo Termux**.
2. **Atualize e instale os pacotes necessários** executando os seguintes comandos:
   ```bash
   apt update && apt upgrade
   pkg install sqlite
   pkg install git
   pkg install python
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

3. **Navegue até o diretório da aula desejada**:
   ```bash
   cd aula01  # ou aula02, aula03, aula04, etc.
   ```

4. **Crie o banco de dados** usando o arquivo SQL correspondente:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

5. **Execute os scripts Python para manipular os dados**:
   ```bash
   python access_roles.py
   ```

6. **Para visualizar o banco de dados**:
   - Você pode abrir o arquivo `.db` resultante usando o aplicativo SQL Client disponível no Android.

### Windows:
1. **Instale Git, Python e SQLite**:
   - Baixe e instale o Git: [Git for Windows](https://gitforwindows.org/)
   - Baixe e instale o Python: [Python.org](https://www.python.org/downloads/)
   - Baixe e instale o SQLite: [SQLite Download Page](https://www.sqlite.org/download.html)

2. **Clone o repositório** e navegue até o diretório:
   ```bash
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

3. **Instale os pacotes Python necessários**:
   ```bash
   pip install sqlite3
   ```

4. **Navegue até o diretório da aula desejada**:
   ```bash
   cd aula01  # ou aula02, aula03, aula04, etc.
   ```

5. **Crie o banco de dados** usando o arquivo SQL correspondente:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

6. **Execute os scripts Python para manipular os dados**:
   ```bash
   python access_roles.py
   ```

### Debian/Linux:
1. **Abra o terminal** e execute os seguintes comandos para instalar Git, Python e SQLite:
   ```bash
   sudo apt update && sudo apt upgrade
   sudo apt install sqlite3
   sudo apt install git
   sudo apt install python3
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

2. **Navegue até o diretório da aula desejada**:
   ```bash
   cd aula01  # ou aula02, aula03, aula04, etc.
   ```

3. **Crie o banco de dados** usando o arquivo SQL correspondente:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

4. **Execute os scripts Python para manipular os dados**:
   ```bash
   python3 access_roles.py
   ```

## Linguagens

<div align="left">
  <img src="https://cdn-icons-png.flaticon.com/512/5815/5815478.png" height="60" alt="SQL logo" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" height="60" alt="Python logo" />
</div>

## Biblioteca

<div align="left">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg" height="60" alt="SQLite logo" />
</div>
