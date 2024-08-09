# Model_db

Repository with small examples of Data Modeling using SQLite, some in conjunction with Python.

## How to Run

### Termux (Android):
1. **Open the Termux app**.
2. **Update and install necessary packages** by running the following commands:
   ```bash
   apt update && apt upgrade
   pkg install sqlite
   pkg install git
   pkg install python
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

3. **Navigate to the desired lesson directory**:
   ```bash
   cd aula01  # or aula02, aula03, aula04, etc.
   ```

4. **Create the database** using the corresponding SQL file:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

5. **Run the Python scripts to manipulate the data**:
   ```bash
   python access_roles.py
   ```

6. **To view the database**:
   - You can open the resulting `.db` file using the SQL Client app available on Android.

### Windows:
1. **Install Git, Python, and SQLite**:
   - Download and install Git: [Git for Windows](https://gitforwindows.org/)
   - Download and install Python: [Python.org](https://www.python.org/downloads/)
   - Download and install SQLite: [SQLite Download Page](https://www.sqlite.org/download.html)

2. **Clone the repository** and navigate to the directory:
   ```bash
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

3. **Install necessary Python packages**:
   ```bash
   pip install sqlite3
   ```

4. **Navigate to the desired lesson directory**:
   ```bash
   cd aula01  # or aula02, aula03, aula04, etc.
   ```

5. **Create the database** using the corresponding SQL file:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

6. **Run the Python scripts to manipulate the data**:
   ```bash
   python access_roles.py
   ```

### Debian/Linux:
1. **Open the terminal** and execute the following commands to install Git, Python, and SQLite:
   ```bash
   sudo apt update && sudo apt upgrade
   sudo apt install sqlite3
   sudo apt install git
   sudo apt install python3
   git clone https://github.com/Hatoridev/Model_db.git
   cd Model_db
   ```

2. **Navigate to the desired lesson directory**:
   ```bash
   cd aula01  # or aula02, aula03, aula04, etc.
   ```

3. **Create the database** using the corresponding SQL file:
   ```bash
   sqlite3 your_database.db < create_database.sql
   ```

4. **Run the Python scripts to manipulate the data**:
   ```bash
   python3 access_roles.py
   ```

## Languages

<div align="left">
  <img src="https://cdn-icons-png.flaticon.com/512/5815/5815478.png" height="60" alt="SQL logo" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" height="60" alt="Python logo" />
</div>

## Library

<div align="left">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/sqlite/sqlite-original.svg" height="60" alt="SQLite logo" />
</div>
