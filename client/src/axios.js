import axios from 'axios';
// default backemd api url
axios.defaults.baseURL = 'http://localhost:3000/';

// default hrader auth  token retriever
axios.defaults.headers.common['Authorization'] = 'Bearer' + localStorage.getItem('token');