import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../styles/ListMovie.css';
import { Link } from 'react-router-dom';

function AdminList() {
    const [animeList, setAnimeList] = useState([]);
    const [currentPage, setCurrentPage]= useState(1);
    const moviesPerPage= 5;
    useEffect(() => {
        axios.get('http://localhost:3001/api/moviesad')
            .then(res => {
                setAnimeList(res.data);
            })
            .catch(err => console.error("Lỗi:", err));
    }, []);
    // Tính tổng số trang
    const totalPages= Math.ceil(animeList.length/moviesPerPage);
    // Tính danh sách phim hiện thị theo trang 
    const indexOfLastMovie= currentPage * moviesPerPage;
    const indexOfFirstMovie= indexOfLastMovie - moviesPerPage;
    const currentMovies= animeList.slice(indexOfFirstMovie, indexOfLastMovie);

    const handlePageChange= (pageNumber) =>{
        setCurrentPage(pageNumber);
    }
    return (
        <div className="list-movies">
            <div className="list-movie-tag">
                <li>Quản lý phim</li>
            </div>
            <div className="list-movie">
                {currentMovies.map((item) => (
                    <Link
                        to={`/admin/moviedetail/${item.movie_id}`}
                        key={item.movie_id}
                        movie_id={item.movie_id}
                        className='nav-link'
                    >
                    <AnimeItem
                        title={item.title}
                        image_url={item.image_url}
                        genre={item.genre}
                        year={item.year}
                        duration={item.duration}
                        episodes={item.episodes}
                        status={item.status}
                    />
                    </Link>
                ))}
            </div>
            <div className="more">
                <ul>
                    {Array.from({length: totalPages}, (_, index) =>(
                        <li key={index}>
                            <button className={`page-button ${currentPage === index +1 ? 'active' :''}`} 
                                onClick={()=> handlePageChange(index+1)}
                                >
                                {index+1}
                            </button>
                        </li>
                    ))}
                </ul>
            </div>            
        </div>
    );
}

function AnimeItem({movie_id, title, image_url, genre, year, duration, episodes, status }) {
    // Định dạng trạng thái
    const getStatusClass = () => {
        if (status === 'Approved') return 'approved';
        if (status === 'Pending') return 'pending';
        return 'review';
    };

    return (
        <div className="movie-item">
            <div className="movie-image">
                <img
                    src={image_url || '/placeholder.jpg'}
                    alt={title}
                    onError={(e) => {
                        e.target.src = '/placeholder.jpg';
                    }}
                />
            </div>
            <div className="movie-info">
                <p><strong>Tên phim:</strong> {title}</p>
                <p><strong>Thể loại:</strong> {genre}</p>
                <p><strong>Năm phát hành:</strong> {year}</p>
                <p><strong>Thời lượng:</strong> {duration} phút</p>
                {episodes && <p><strong>Số tập:</strong> {episodes} ( Đang cập nhật )</p>}
                <div className={`status ${getStatusClass()}`}>
                    <span className="dot" />
                    Trạng thái: {status}
                </div>
            </div>
        </div>
    );
}

export default AdminList;