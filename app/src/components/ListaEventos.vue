<template>
  <div class="eventos-contenedor">
    <h2 v-once>Lista de Eventos</h2>

    <button @click="forzarActualizacion">
      Actualizar ({{ contadorActualizaciones }})
    </button>
    <hr v-once>
    
    <ul>
      <li v-for="evento in ultimosEventos" :key="evento.id">
        <span v-once>ID:</span>{{ evento.id }} | 
        <strong>{{ evento.nombre }}</strong> —
        <span>{{ evento.timestamp }}</span>
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onBeforeMount, onMounted, onBeforeUpdate, onUpdated, 
         onBeforeUnmount, onUnmounted} from 'vue'

// Variable reactiva para forzar re-renderizados
const contadorActualizaciones = ref(0)

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

function forzarActualizacion() {
  // Dispara el ciclo de beforeUpdate y updated
  contadorActualizaciones.value++
}

/* ---------------- PROPIEDAD COMPUTADA ---------------- */

// Filtra la lista para obtener solo los últimos 10 elementos.
const ultimosEventos = computed(() => {
  // El método .slice(-10) devuelve los últimos 10 elementos del array.
  return listaEventos.value.slice(-10)
})

/* ---------------- CICLO DE VIDA ---------------- */
onBeforeMount(() => registrarEvento('beforeMount'))
onMounted(() => registrarEvento('mounted'))
onBeforeUpdate(() => registrarEvento('beforeUpdate'))
onUpdated(() => registrarEvento('updated'))
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
  margin: 8px 0;
}
button {
  margin-left: 8px;
  padding: 6px 12px;
  }
hr {
    border: 0;
    margin: 10px 0;
}
</style>