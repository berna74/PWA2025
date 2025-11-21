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
  background: #fcfcfc;
  border-radius: 2px;
  border: 0.2px solid #e9e9e9;
  }
</style>