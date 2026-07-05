-- 1. 用户表
CREATE TABLE users (
    id_card CHAR(18) PRIMARY KEY COMMENT '身份证号（主码）',
    name VARCHAR(50) NOT NULL COMMENT '姓名',
    birthday DATE COMMENT '生日',
    stay_count INT DEFAULT 0 COMMENT '入住次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. 房间表
CREATE TABLE rooms (
    room_id INT PRIMARY KEY COMMENT '房间编号',
    room_type ENUM('单人房', '双人房', 'VIP客房') NOT NULL COMMENT '房型',
    status ENUM('available', 'unavailable') DEFAULT 'available' NOT NULL COMMENT '房间状态：available-可住，unavailable-不可住',
    current_price DECIMAL(10, 2) NOT NULL COMMENT '当前房价（元/晚）',
    current_guest_id CHAR(18) NULL COMMENT '当前入住客人身份证号（外码，可为空）',
    FOREIGN KEY (current_guest_id) REFERENCES users(id_card) 
        ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. 入住记录表
CREATE TABLE checkins (
    checkin_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
    guest_id CHAR(18) NOT NULL COMMENT '客人身份证号（外码）',
    room_id INT NOT NULL COMMENT '房间号（外码）',
    start_time DATETIME NOT NULL COMMENT '入住开始时间',
    end_time DATETIME NULL COMMENT '退房时间（可空）',
    total_price DECIMAL(10, 2) NULL COMMENT '总价',
    FOREIGN KEY (guest_id) REFERENCES users(id_card),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. 预约记录表
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '预约ID',
    room_id INT NOT NULL COMMENT '房间号（外码）',
    start_time DATETIME NOT NULL COMMENT '预约开始时间',
    end_time DATETIME NOT NULL COMMENT '预约结束时间',
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;