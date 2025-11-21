<script setup lang="ts">
import Datos from './components/Datos.vue'
import Contador from './components/Contador.vue'
import Tareas from './components/Tareas.vue'
import Eventos from './components/ListaEventos.vue'
import Posteos from './components/Posteos.vue';



</script>

<template>
<div class="enunciado">  Paso Nº2 TP1</div>
    <Datos />

  <div class="enunciado">  Paso Nº3 TP1</div>  
    <Contador />

    <div class="enunciado">  Paso Nº4 TP1</div>
   <Tareas />

   <div class="enunciado">  Paso Nº1 TP2 </div> 
    <Eventos />

    <div class="enunciado">  Paso Nº3 TP2 </div> 
    <Posteos />
  
  
</template>

<style scoped>

button {
  margin-left: 8px;
  padding: 6px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin: 8px 0;
}
.completada {
  text-decoration: line-through;
  color: #888;
}

.enunciado {
  font-weight: bold;
  margin: 16px 0 8px 0;
  text-align: left;
}
</style>
