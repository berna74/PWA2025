<template>
  <div class="posts-contenedor">
    <div 
      v-for="post in postsList" 
      :key="post.id" 
      class="post-item"
      @click="handlePostClick(post.id)"
    >

     
      <h2>Post Nº{{ post.id }}: {{ post.title }}</h2>
      <p>Ver comentarios</p>


      <div v-if="selectedPostId === post.id">
        <h3>Comentarios</h3>

        <ul v-if="commentsList.length">
          <li v-for="comment in commentsList" :key="comment.id">
            <p><strong>{{ comment.email }}</strong>: {{ comment.body }}</p>
          </li>
        </ul>

        <p v-else>Cargando comentarios...</p>
      </div>
     

    </div>
  </div>
</template>



<script setup>
import { ref } from 'vue';
import { obtenerPost, obtenerComments } from '@/api/posts';


const postsList = ref([]); 


const commentsList = ref([]); 

const selectedPostId = ref(null);


async function fetchInitialPosts() {
   
    for (let i = 1; i <= 10; i++) {
        try {
           
            const postData = await obtenerPost(i); 
            
            
            postsList.value.push(postData);
            
        } catch (error) {
            console.error("Error al obtener post:", i, error);
        }
    }
}


async function handlePostClick(postId) {
    selectedPostId.value = postId;  

    try {
        const fetchedComments = await obtenerComments(postId);
        commentsList.value = fetchedComments;
    } catch (error) {
        console.error("Error al obtener comentarios del post:", postId, error);
    }
}


fetchInitialPosts();

</script>

<style scoped>

.posts-contenedor {
  text-align: left;
  padding: 16px;
  background: #fcfcfc;
  border-radius: 2px;
  border: 0.2px solid #e9e9e9;
}

.post-item {
    border: 1px solid #ccc;
    padding: 10px;
    margin-bottom: 10px;
    cursor: pointer;
    transition: background-color 0.2s;
}
.post-item:hover {
    background-color: #f0f0f0;
}
</style>