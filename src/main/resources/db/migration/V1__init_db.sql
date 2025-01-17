CREATE TABLE worker (
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) BETWEEN 2 AND 1000),
                        BIRTHDAY DATE CHECK (YEAR(BIRTHDAY) > 1900),
    LEVEL ENUM('Trainee', 'Junior', 'Middle', 'Senior') NOT NULL,
    SALARY INT CHECK (SALARY BETWEEN 100 AND 100000)
);

CREATE TABLE client (
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) BETWEEN 2 AND 1000)
);

CREATE TABLE project (
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         CLIENT_ID INT,
                         START_DATE DATE,
                         FINISH_DATE DATE,
                         FOREIGN KEY (CLIENT_ID) REFERENCES client(ID)
);

CREATE TABLE project_worker (
                                PROJECT_ID INT,
                                WORKER_ID INT,
                                PRIMARY KEY (PROJECT_ID, WORKER_ID),
                                FOREIGN KEY (PROJECT_ID) REFERENCES project(ID),
                                FOREIGN KEY (WORKER_ID) REFERENCES worker(ID)
);