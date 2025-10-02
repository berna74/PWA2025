<template>
  <div class="contador-contenedor">
    <h2>Contador: {{ contador }}</h2>
    <button @click="incrementar">Incrementar</button>
    <button @click="decrementar">Decrementar</button>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'

const contador = ref(0)

function incrementar() {
  contador.value++
}

function decrementar() {
  contador.value--
}
</script>

<style scoped>
.contador-contenedor {
  text-align: left;
  padding: 16px;
  background: #e3f2fd;
  border-radius: 8px;
  width: 220px;
}
button {
  margin: 8px 8px 0 0;
  padding: 6px 12px;
  font-size: 16px;
}
</style>