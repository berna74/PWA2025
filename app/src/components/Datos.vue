<template>
  <div class="contenedor">
    <h3>{{ nombre }}</h3>
    <h3>{{ edad }}</h3>
    <h3>{{ ciudad }}</h3>
    <h3>{{ parrafo }}</h3>
    <div v-if="post">
      <h4>Post de ejemplo:</h4>
      <p>{{ post.title }}</p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import apiClient from '../services/api';

const nombre = ref('Martín Bernatene');
const edad = ref(51);
const ciudad = ref('Viedma');
const parrafo = computed(
  () => `Hola, mi nombre es ${nombre.value}, tengo ${edad.value} años, y vivo en ${ciudad.value}`
);

const post = ref<any>(null);

onMounted(async () => {
  try {
    const response = await apiClient.get('/posts/1');
    post.value = response.data;
  } catch (error) {
    console.error('Error al obtener los datos:', error);
  }
});
</script>

<style scoped>
.contenedor {
  text-align: left;
  padding: 16px;
  background: #f9fbe7;
  border-radius: 8px;
}
h3 {
  margin: 8px 0;
}
</style>
