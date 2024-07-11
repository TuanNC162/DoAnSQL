use techmaster;

-- 1. Bảng phim và dữ liệu
CREATE TABLE Films (
    film_id INT PRIMARY KEY,
    film_name VARCHAR(200) ,
    duration VARCHAR (20), 
    opening_date DATE,
    director_id INT,
    create_at DATETIME,
    FOREIGN KEY (director_id) REFERENCES Director(director_id)
);

INSERT INTO Films (film_id, film_name, duration, opening_date, director_id, create_at)
VALUES (1, 'Ant-Man and the Wasp: Quantumania', '2h 28m', '2022-07-01', 1, NOW()),
		(2, 'Magic Mike’s Last Dance', '2h 32m', '2018-07-18', 2, NOW()),
        (3, '80 For Brady', '2h 49m', '2014-11-07', 3, NOW()),
        (4, 'Shazam! Fury of the Gods', '2h 30m', '2023-03-31', 4, NOW()),
        (5, 'John Wick: Chapter 4', '2h', '2021-03-20', 5, NOW()),
        (6, 'The Super Mario Bros. Movie', '2h 06m', '2021-03-30', 3, NOW()),
        (7, 'Evil Dead Rise', '1h 30m', '2020-03-31', 2, NOW()),
        (8, 'Are You There God? It’s Me, Margaret', '2h 10m', '2022-03-31', 2, NOW()),
        (9, 'Guardians of the Galaxy Vol. 3', '1h 30m', '2021-03-31', 1, NOW()),
        (10, 'Live action Nàng Tiên Cá', '2h', '2021-03-31', 2, NOW());


-- 2. Bảng phòng chiếu và dữ liệu
CREATE TABLE CinemaRoom (
    room_id INT PRIMARY KEY,
    room_number INT,
    capacity INT,
    create_at DATETIME
);

INSERT INTO CinemaRoom (room_id, room_number, capacity, create_at)
VALUES (1, 1, 100, NOW()),
		(2, 2, 150, NOW()),
        (3, 3, 100, NOW()),
        (4, 4, 80, NOW()),
        (5, 5, 20, NOW());


-- 3. Bảng lịch chiếu và dữ liệu
CREATE TABLE Showtimes (
    showstime_id INT PRIMARY KEY,
    film_id INT,
    room_id INT,
    start_time DATETIME,
    end_time DATETIME,
    FOREIGN KEY (film_id) REFERENCES Films(film_id),
    FOREIGN KEY (room_id) REFERENCES CinemaRoom(room_id)
);

INSERT INTO Showtimes (showstime_id, film_id, room_id, start_time, end_time)
VALUES (1, 1, 1, '2024-07-09 18:00:00', '2024-07-09 20:28:00'),
		(2, 2, 2, '2024-07-10 16:30:00', '2024-07-10 19:15:00'),
        (3, 3, 3, '2024-07-11 20:00:00', '2024-07-11 22:49:00'),
        (4, 4, 4, '2024-07-12 19:15:00', '2024-07-12 21:31:00'),
        (5, 5, 5, '2024-07-12 19:15:00', '2024-07-12 21:31:00'),
        (6, 6, 1, '2024-07-12 09:15:00', '2024-07-12 11:45:00'),
        (7, 7, 2, '2024-07-12 09:15:00', '2024-07-12 11:55:00'),
        (8, 8, 3, '2024-07-12 09:15:00', '2024-07-12 12:30:00'),
        (9, 9, 4, '2024-07-12 09:15:00', '2024-07-12 12:30:00'),
        (10, 10, 5, '2024-07-12 09:15:00', '2024-07-12 11:20:00'),
        (11, 2, 1, '2024-07-12 13:15:00', '2024-07-12 15:30:00'),
        (12, 3, 2, '2024-07-12 13:15:00', '2024-07-12 16:15:00'),
        (13, 5, 3, '2024-07-12 13:15:00', '2024-07-12 16:30:00'),
        (14, 7, 4, '2024-07-12 13:15:00', '2024-07-12 16:00:00'),
        (15, 2, 5, '2024-07-12 12:15:00', '2024-07-12 14:00:00');



-- 4. Bảng diễn viên và dữ liệu
CREATE TABLE Actors (
	actor_id INT PRIMARY KEY,
    actor_name VARCHAR(25),
    actor_age INT,
    country VARCHAR (50)
);

INSERT INTO Actors (actor_id, actor_name, actor_age, country)
VALUES (1, 'Paul Rudd', 30, 'New York'),
		(2, 'Evangeline Lilly', 32, 'New York'),
        (3, 'Channing Tatum', 30, 'USA'),
        (4, 'Leonardo DiCaprio', 38, 'New York'),
        (5, 'Tom Brady', 38, 'USA'),
        (6, 'Jack Dylan Grazer', 38, 'England'),
        (7, 'Keanu Reeves', 20, 'England'),
        (8, 'Anya Taylor Joy', 50, 'Germany'),
        (9, 'Lily Sullivan', 45, 'France'),
        (10, 'Alyssa Sutherland', 18, 'France');

-- 5. Bảng trung gian giữa Films và Actors		
CREATE TABLE Films_Actor (
	film_actor_id INT PRIMARY KEY,
	actor_id INT,
    film_id INT,
	FOREIGN KEY (actor_id) REFERENCES Films(film_id),
    FOREIGN KEY (film_id) REFERENCES Actors(actor_id)
);

INSERT INTO Films_Actor (film_actor_id, actor_id, film_id)
VALUES (1, 1, 1),
		(2, 2, 2),
        (3, 3, 3),
        (4, 4, 4),
        (5, 5, 5),
        (6, 6, 6),
        (7, 7, 7),
        (8, 8, 8),
        (9, 9, 9),
        (10, 10, 10),
        (11, 1, 10),
        (12, 1, 10),
        (13, 3, 1),
        (14, 4, 2),
        (15, 2, 3),
        (16, 10, 1),
        (17, 10, 1),
        (18, 1, 5),
        (19, 1, 5),
        (20, 5, 6);



-- 6. Bảng đạo diễn và dữ liệu
CREATE TABLE Director (
	director_id INT PRIMARY KEY,
    director_name VARCHAR (50),
    director_age INT
);

INSERT INTO Director (director_id, director_name, director_age)
VALUES (1, 'Christopher Nolan', 45),
		(2, 'Rob Marshall',50),
        (3, 'Charlie Day',60),
        (4, 'Asher Angel',45),
        (5, 'Jonathan Majors',57);


-- 7. Bảng thể loại phim và dữ liệu
CREATE TABLE Category (
	category_id INT PRIMARY KEY,
    category_name VARCHAR(25)
);

INSERT INTO Category (category_id, category_name)
VALUES (1, 'Hài hước'),
		(2, 'Hành động'),
        (3, 'Phiêu lưu'),
        (4, 'Kinh dị'),
        (5, 'Trinh thám'),
        (6, 'Lãng mạn');

-- 8. Bảng trung gian film và thể loại
CREATE TABLE Films_Category (
	film_category_id INT PRIMARY KEY,
	category_id INT,
	film_id INT,
	FOREIGN KEY (film_id) REFERENCES Films(film_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

INSERT INTO Films_Category (film_category_id, category_id, film_id)
VALUES (1,1,1),
		(2,2,1),
        (3,5,1),
        (4,3,2),
        (5,4,2),
        (6,4,3),
        (7,6,4),
        (8,5,5),
        (9,3,6),
        (10,2,6),
        (11,6,7),
        (12,2,8),
        (13,1,9),
        (14,5,10),
        (15,3,10);


-- 9. Bảng khách hàng và dữ liệu
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(10),
    creat_at DATETIME
);

INSERT INTO Customer (customer_id, name, email, phone_number, creat_at)
VALUE (1, 'Nguyễn Văn A', 'a123@gmail.com', '0934782645', NOW()),
		(2, 'Trần Văn C', 'c123@gmail.com', '0958887325', NOW()),
        (3, 'Nguyễn Thị B', 'b123@gmail.com', '0940444776', NOW()),
        (4, 'Phạm Thị D', 'd123@gmail.com', '0949947899', NOW()),
        (5, 'Nguyễn Quốc A', 'qa123@gmail.com', '0948888666', NOW()),
        (6, 'Uông Văn E', 'e123@gmail.com', '0945678912', NOW()),
        (7, 'Hoàng Thành F', 'f123@gmail.com', '0909998886', NOW()),
        (8, 'Nguyễn Trần Thái B', 'tb123@gmail.com', '0901234567', NOW()),
        (9, 'Ngô Linh G', 'g123@gmail.com', '0942226868', NOW()),
        (10, 'Uông Quốc H', 'h123@gmail.com', '0949876543', NOW());




-- 10. Bảng nhân viên và dữ liệu
CREATE TABLE Staff (
	staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    salary INT,
    position VARCHAR (50)
);

INSERT INTO Staff (staff_id, staff_name, salary, position)
VALUE (1, 'Nguyễn Tuấn A', 10000000, 'Nhân Viên'),
		(2, 'Phạm Thị B', 8000000, 'Nhân Viên'),
        (3, 'Hoàng Quốc C', 12000000, 'Nhân Viên');


-- 11. Bảng vé và dữ liệu
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    showstime_id INT,
    seats VARCHAR(10),
    prices INT,
    purchase_date DATETIME,
    quantity INT,
    customer_id INT,
    staff_id INT,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (showstime_id) REFERENCES Showtimes(showstime_id)
);

INSERT INTO Tickets (ticket_id, showstime_id, seats, prices, purchase_date, quantity, customer_id, staff_id)
VALUE (1, 1, 'A01', 150000, NOW(), 2, 1, 1),
		(2, 2, 'A02', 150000, NOW(), 2, 2, 2),
        (3, 2, 'A01', 100000, NOW(), 1, 3, 2),
        (4, 3, 'A06', 150000, NOW(), 2, 4, 2),
        (5, 4, 'A08', 150000, NOW(), 2, 5, 3),
        (6, 5, 'A07', 220000, NOW(), 3, 6, 1),
        (7, 3, 'A01', 150000, NOW(), 2, 7, 3),
        (8, 2, 'A08', 80000, NOW(), 1, 8, 3),
        (9, 8, 'A02', 150000, NOW(), 2, 9, 3),
        (10, 9, 'A01', 200000, NOW(), 2, 10, 3);


-- 12. Bảng đồ ăn và dữ liệu
CREATE TABLE FoodItems (
	fooditem_id INT PRIMARY KEY,
    name VARCHAR (100),
    prices INT
);

INSERT INTO FoodItems (fooditem_id, name, prices)
VALUE (1, 'Cocacola', 20000),
		(2, 'Pepsi', 20000),
        (3, 'Bỏng Ngô', 15000),
        (4, 'BimBim', 10000),
        (5, 'Nước Lọc', 10000);


-- 13. Bảng trung gian đồ ăn và vé
CREATE TABLE Tickets_Food (
	ticket_food_id INT PRIMARY KEY,
	ticket_id INT,
    fooditem_id INT,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id),
    FOREIGN KEY (fooditem_id) REFERENCES FoodItems(fooditem_id)
);

INSERT INTO Tickets_Food (ticket_food_id, ticket_id, fooditem_id)
VALUE (1, 1, 1),
		(2, 1, 2),
        (3, 1, 4),
        (4, 2, 5),
        (5, 3, 2),
        (6, 3, 3),
        (7, 4, 1),
        (8, 5, 1),
        (9, 5, 5),
        (10, 9, 2);


-- 14. Bảng đánh giá phim của khách hàng 
CREATE TABLE CustomerReviews (
    customer_review_id INT PRIMARY KEY,
    film_id INT,
    customer_id INT,
    point INT, 
    comment TEXT,
    assessment_date DATETIME,
    FOREIGN KEY (film_id) REFERENCES Films(film_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO CustomerReviews (customer_review_id, film_id, customer_id, point, comment, assessment_date)
VALUES
    (1, 1, 1, 5, 'Great movie!', NOW()),
    (2, 2, 2, 4, 'Awesome performance by Heath Ledger!', NOW()),
    (3, 1, 3, 5, 'Good!', NOW()),
    (4, 3, 3, 5, 'Verry Good!', NOW()),
    (5, 5, 1, 5, 'Awesome performance by Heath Ledger!', NOW());













