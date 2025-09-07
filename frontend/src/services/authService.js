import axios from "axios";

const api = axios.create({
    baseURL: "http://localhost:5000",
});
export default api;

import api from "./api";
export const loginUser = async(email,password)=>{
    const res = await api.post("/login",{email,password});
    return res.data;
}

export const registerUser = async(name,email,password)=>{
    const res=await api.post("/register",{name,email,password});
    return res.data;
}