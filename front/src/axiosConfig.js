// src/axiosConfig.js
import axios from 'axios';
import Cookies from 'js-cookie';

const instance = axios.create({
  baseURL: '/v1', // Using relative URL, Nginx will handle the proxy
  headers: {
    'Content-Type': 'application/json',
  },
  withCredentials: true,
});

// Добавляем перехватчик для установки токена
instance.interceptors.request.use(
  (config) => {
    const token = Cookies.get('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default instance;
