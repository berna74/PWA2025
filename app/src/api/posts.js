import { API } from './index'; 

export async function obtenerPost(postId) {
    const response = await API.get(`posts/${postId}`);
    return response.data; 
}

export async function obtenerComments(postId) {
    const response = await API.get(`posts/${postId}/comments`);
    return response.data; 
}