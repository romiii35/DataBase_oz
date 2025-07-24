
-- 반려동물_주인 테이블 만들기
CREATE TABLE PetOwners(
	owner_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(15) NOT NULL,
    contact VARCHAR(15)
);


-- 반려동물 테이블 만들기
CREATE TABLE Pets(
	pet_id INT PRIMARY KEY AUTO_INCREMENT,
    pet_name VARCHAR(15) NOT NULL,
    pet_species VARCHAR(5),
    pet_breed VARCHAR(10),
    owner_id INT NOT NULL,
    FOREIGN KEY(owner_id) REFERENCES PetOwners(owner_id)
);


-- 객실 테이블 만들기
CREATE TABLE Rooms(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_Number INT NOT NULL,
    room_Type VARCHAR(5),
    price_PerNight DECIMAL(15,2)
);


-- 예약 테이블 만들기
CREATE TABLE Reservations(
	reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    pet_id INT NOT NULL,
    room_id INT NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pets(pet_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


-- 서비스 테이블 만들기
CREATE TABLE Services(
	service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_Name VARCHAR(30),
    service_Price DECIMAL(15,2),
    reservation_id INT NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
    );
