const mysql = require('mysql2');

// Kết nối MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'web1'
});

db.connect((err) => {
    if (err) {
        console.log("Lỗi kết nối:", err);
    } else {
        console.log("Đã kết nối MySQL!");
    }
});

module.exports = db;