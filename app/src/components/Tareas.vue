<template>
  <div class="tareas-contenedor">
    <h2>Lista de Tareas</h2>
    <input v-model="nuevaTarea" placeholder="Nueva tarea..." />
    <button @click="agregarTarea">Añadir Tarea</button>
    <ul>
      <li v-for="tarea in tareas" :key="tarea.id">
        <input type="checkbox" v-model="tarea.completada" />
        <span :class="{ completada: tarea.completada }">{{ tarea.texto }}</span>
      </li>
    </ul>
    <p>Total de Tareas: {{ totalTareas }}</p>
    <p>Tareas Pendientes: {{ tareasPendientes }}</p>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'

const nuevaTarea = ref('')
const tareas = ref([
  { id: 1, texto: 'Hacer las compras', completada: false },
  { id: 2, texto: 'Ir al banco', completada: false }
])

function agregarTarea() {
  const texto = nuevaTarea.value.trim()
  if (texto) {
    tareas.value.push({
      id: Date.now(),
      texto,
      completada: false
    })
    nuevaTarea.value = ''
  }
}

const tareasPendientes = computed(() =>
  tareas.value.filter(t => !t.completada).length
)

const totalTareas = computed(() =>
  tareas.value.length
)
</script>

<style scoped>
.tareas-contenedor {
  text-align: left;
  padding: 16px;
  background: #f9fbe7;
  border-radius: 8px;
  width: 320px;
}
input[type="text"] {
  margin-bottom: 8px;
  padding: 6px;
  width: 180px;
}
button {
  margin-left: 8px;
  padding: 6px 12px;
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
</style>