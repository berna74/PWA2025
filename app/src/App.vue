<script setup lang="ts">
import Datos from './components/Datos.vue'
import Contador from './components/Contador.vue'
import Tareas from './components/Tareas.vue'
// Make sure ListaEventos.vue exists in src/components
import Eventos from './components/ListaEventos.vue'


</script>

<template>
<div class="enunciado">  Paso#2 TP1</div>
    <Datos />

  <div class="enunciado">  Paso#3 TP1</div>  
    <Contador />

    <div class="enunciado">  Paso#4 TP1</div>
   <Tareas />

   <div class="enunciado">  Paso#1 TP2 </div> 
    <Eventos />
  
  
</template>

<style scoped>

.enunciado {
  font-weight: bold;
  margin: 16px 0 8px 0;
  text-align: left;
}
</style>
