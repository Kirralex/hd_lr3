-- Создание таблицы Участники
CREATE TABLE Participants (
    Participant_ID INT AUTO_INCREMENT,
    Name VARCHAR(255),
    Surname VARCHAR(255),
    Date_of_Birth DATE,
    Gender ENUM('male', 'female', 'other'),
    PRIMARY KEY (Participant_ID)
);

-- Создание таблицы Соревнования
CREATE TABLE Competitions (
    Competition_ID INT AUTO_INCREMENT,
    Competition_Name VARCHAR(255),
    Competition_Date DATE,
    Location VARCHAR(255),
    PRIMARY KEY (Competition_ID)
);

-- Создание таблицы Результаты
CREATE TABLE Results (
    Participant_ID INT,
    Competition_ID INT,
    Position INT,
    Score DECIMAL(10,2),
    PRIMARY KEY (Participant_ID, Competition_ID),
    FOREIGN KEY (Participant_ID) REFERENCES Participants(Participant_ID),
    FOREIGN KEY (Competition_ID) REFERENCES Competitions(Competition_ID)
);

-- Создание таблицы Категории
CREATE TABLE Categories (
    Category_ID INT AUTO_INCREMENT,
    Category_Name VARCHAR(255),
    Description TEXT,
    PRIMARY KEY (Category_ID)
);

-- Создание таблицы Соревнования_Категории
CREATE TABLE Competition_Categories (
    Competition_ID INT,
    Category_ID INT,
    Age_Group VARCHAR(255),
    PRIMARY KEY (Competition_ID, Category_ID),
    FOREIGN KEY (Competition_ID) REFERENCES Competitions(Competition_ID),
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);