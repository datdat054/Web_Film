"use client";
import React, { useState } from "react";
import "../styles/Login.css";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

function LoginForm() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [error, setError] = useState("");
    const [loading, setLoading] = useState(false);
    const navigate = useNavigate();

    const setRole=(roleId)=>{
        switch(roleId){
            case 1:
                return "admin";
            case 2:
                return "technical";       
            case 3:
                return "content_manager";         
            case 4:
                return "user";      
            default:
                return "user";
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError("");
        try {
            const res = await axios.post("http://localhost:3001/login", {
                email,
                password,
            });
    
            if (!res.data.user) {
                throw new Error("Dữ liệu người dùng không hợp lệ từ API /login");
            }

            const user = {
                ...res.data.user,
                role: setRole(res.data.user.role_id),
            };

            // Lưu token và user vào localStorage
            localStorage.setItem("token", res.data.token);
            localStorage.setItem("user", JSON.stringify(user));
    
            toast.success("Đăng nhập thành công!", {
                position: "top-right",
                autoClose: 2000,
            });
    
            window.dispatchEvent(new Event("userChanged"));
    
            setTimeout(() => {
                switch(user.role){
                    case "admin":
                        navigate("/admin/manage-user");
                        break;
                    case "content_manager":
                        navigate("/content/movies/all");
                        break;
                    case "technical":
                        navigate("/technical/unresponse");
                        break;
                    case "user":
                    default:
                        navigate("/");
                        break;
                }
            }, 2000);
        } catch (err) {
            console.error("Lỗi khi đăng nhập:", err);
            setError(err.response?.data?.error || "Đăng nhập thất bại");
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="container">
            <ToastContainer />
            <h2>Đăng Nhập</h2>
            <form className="form" onSubmit={handleSubmit}>
                <label>Email</label>
                <input
                    type="email"
                    placeholder="Nhập email của bạn"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                />
                <label>Mật khẩu</label>
                <input
                    type="password"
                    placeholder="Nhập mật khẩu"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    required
                />
                {error && <p className="error-message">{error}</p>}
                <Link to="/forgot-password" className="forgot">
                    Quên mật khẩu?
                </Link>
                <button type="submit" className="btn" disabled={loading}>
                    {loading ? "Đang xử lý..." : "Đăng Nhập"}
                </button>
            </form>
            <p>
                Chưa có tài khoản?{" "}
                <Link to="/register" className="register-link">
                    Đăng kí
                </Link>
            </p>
        </div>
    );
}

export default LoginForm;