<script setup lang="ts">
import Datos from './components/Datos.vue'
import Contador from './components/Contador.vue'
</script>

<template>
<div class="enunciado">  Paso#2 </div>
  

  <Datos />
  <div class="enunciado">  Paso#3 </div>
  
  <Contador />
</template>

<style scoped>

.enunciado {
  font-weight: bold;
  margin: 16px 0 8px 0;
}
</style>
