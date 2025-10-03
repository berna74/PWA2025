<script setup lang="ts">
import Datos from './components/Datos.vue'
import Contador from './components/Contador.vue'
import Tareas from './components/Tareas.vue'
</script>

<template>
<div class="enunciado">  Paso#2 </div>
    <Datos />

  <div class="enunciado">  Paso#3 </div>  
    <Contador />

    <div class="enunciado">  Paso#4 </div>
   <Tareas />

</template>

<style scoped>

.enunciado {
  font-weight: bold;
  margin: 16px 0 8px 0;
  text-align: left;
}
</style>
