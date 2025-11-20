import axios from "axios";

const API = axios.create({
    baseURL: "https://jsonplaceholder.typicode.com",
});

export async function obtenerPost(id) {
    const { data } = await API.get(`/posts/${id}`);
    return data;
}

export async function obtenerComments(id) {
    const { data } = await API.get(`/posts/${id}/comments`);
    return data;
}