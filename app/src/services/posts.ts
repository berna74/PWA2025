import axios from 'axios';

const api = axios.create({
  baseURL: 'https://jsonplaceholder.typicode.com',
});

export const obtenerPost = async (postId: number) => {
  const { data } = await api.get(`/posts/${postId}`);
  return data;
};

export const obtenerComments = async (postId: number) => {
  const { data } = await api.get(`/posts/${postId}/comments`);
  return data;
};
