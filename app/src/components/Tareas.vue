<template>
  <div class="tareas-contenedor">
    <h2>Tareas</h2>
    <input v-model="nuevaTarea" class="input-tarea" placeholder="Nueva tarea..." />
    <button @click="agregarTarea">Agregar Tarea</button>
    <ul>
      <li class="li-tarea" v-for="tarea in tareas" :key="tarea.id">
        <input type="checkbox" class="checkbox" v-model="tarea.completada" />
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
  background: #fcfcfc;
  border-radius: 2px;
  border: 0.2px solid #e9e9e9;
}
.input-tarea {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 2px;
  width: 200px;
  font-size: 16px;
  outline: none;
  }

.input-tarea:focus {
  border-color: #4a90e2;
  box-shadow: 0 0 4px rgba(74, 144, 226, 0.4);
}

.li-tarea {
  list-style: none;
  margin: 4px 0;
}
.checkbox {
  margin-right: 8px;
}
</style>