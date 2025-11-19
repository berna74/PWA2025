<template>
  <div class="eventos-contenedor">
    <h2 v-once>Lista de Eventos</h2>
    <h3 v-once>Eventos:</h3>
    <ul>
      <li v-for="evento in ultimosEventos" :key="evento.id">
        <strong>{{ evento.nombre }}</strong> -
        <span>{{ evento.timestamp }}</span>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onBeforeMount, onMounted, onBeforeUpdate, 
         onBeforeUnmount, onUnmounted} from 'vue'



// Lista de eventos (histórico completo)
const listaEventos = ref<{ id: number; nombre: string; timestamp: string }[]>([])

let contador = 1

function registrarEvento(nombre: string) {
  listaEventos.value.push({
    id: contador++,
    nombre,
    timestamp: new Date().toISOString() // incluye milisegundos
  })
}




/* ---------------- PROPIEDAD COMPUTADA ---------------- */

// Filtra la lista para obtener solo los últimos 6 elementos.
const ultimosEventos = computed(() => {
  return listaEventos.value.slice(-6).reverse()
})

/* ---------------- CICLO DE VIDA ---------------- */
onBeforeMount(() => registrarEvento('beforeMount'))
onMounted(() => registrarEvento('mounted'))
onBeforeUpdate(() => registrarEvento('beforeUpdate'))
onBeforeUnmount(() => registrarEvento('beforeUnmount'))
onUnmounted(() => registrarEvento('unmounted'))
</script>

<style scoped>
.eventos-contenedor {
  text-align: left;
  padding: 16px;
  background: #f9fbe7;
  border-radius: 8px;
  width: 420px;
}
ul {
  list-style: none;
  padding: 0;
}
li {
  margin: 8px 30px;
}
</style>