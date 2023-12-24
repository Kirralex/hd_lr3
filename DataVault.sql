-- Создание Хабов

-- Хаб Участников
CREATE TABLE Hub_Participants (
    Hub_Participant_ID INT AUTO_INCREMENT PRIMARY KEY,
    Participant_ID INT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255)
);

-- Хаб Соревнований
CREATE TABLE Hub_Competitions (
    Hub_Competition_ID INT AUTO_INCREMENT PRIMARY KEY,
    Competition_ID INT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255)
);

-- Хаб Категорий
CREATE TABLE Hub_Categories (
    Hub_Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_ID INT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255)
);

-- Создание Линков

-- Линк Результатов
CREATE TABLE Link_Results (
    Link_Result_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hub_Participant_ID INT,
    Hub_Competition_ID INT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Hub_Participant_ID) REFERENCES Hub_Participants(Hub_Participant_ID),
    FOREIGN KEY (Hub_Competition_ID) REFERENCES Hub_Competitions(Hub_Competition_ID)
);

-- Линк Соревнований и Категорий
CREATE TABLE Link_Competition_Categories (
    Link_Competition_Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hub_Competition_ID INT,
    Hub_Category_ID INT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Hub_Competition_ID) REFERENCES Hub_Competitions(Hub_Competition_ID),
    FOREIGN KEY (Hub_Category_ID) REFERENCES Hub_Categories(Hub_Category_ID)
);

-- Создание Сателлитов

-- Сателлит Участников
CREATE TABLE Sat_Participants (
    Hub_Participant_ID INT,
    Name VARCHAR(255),
    Surname VARCHAR(255),
    Date_of_Birth DATE,
    Gender ENUM('male', 'female', 'other'),
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Hub_Participant_ID) REFERENCES Hub_Participants(Hub_Participant_ID)
);

-- Сателлит Соревнований
CREATE TABLE Sat_Competitions (
    Hub_Competition_ID INT,
    Competition_Name VARCHAR(255),
    Competition_Date DATE,
    Location VARCHAR(255),
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Hub_Competition_ID) REFERENCES Hub_Competitions(Hub_Competition_ID)
);

-- Сателлит Результатов
CREATE TABLE Sat_Results (
    Link_Result_ID INT,
    Position INT,
    Score DECIMAL(10,2),
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Link_Result_ID) REFERENCES Link_Results(Link_Result_ID)
);

-- Сателлит Категорий
CREATE TABLE Sat_Categories (
    Hub_Category_ID INT,
    Category_Name VARCHAR(255),
    Description TEXT,
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Hub_Category_ID) REFERENCES Hub_Categories(Hub_Category_ID)
);

-- Сателлит Соревнований и Категорий
CREATE TABLE Sat_Competition_Categories (
    Link_Competition_Category_ID INT,
    Age_Group VARCHAR(255),
    Load_Date TIMESTAMP,
    Record_Source VARCHAR(255),
    FOREIGN KEY (Link_Competition_Category_ID) REFERENCES Link_Competition_Categories(Link_Competition_Category_ID)
);