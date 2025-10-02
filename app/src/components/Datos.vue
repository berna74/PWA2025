<template>
  <div class="contenedor">
  <h3>{{ nombre }}</h3>
  <h3>{{ edad }}</h3>
  <h3>{{ ciudad }}</h3>
  <h3>{{ parrafo }}</h3>
 </div>

</template>




<script setup lang="ts">
import { ref, computed} from 'vue'

const nombre = ref('Martín Bernatene')
const edad = ref(51)
const ciudad = ref('Viedma')
const parrafo = computed (() => 
  `Hola, mi nombre es ${nombre.value}, tengo ${edad.value} años, y vivo en ${ciudad.value}`
)
</script>

<style scoped>
.contenedor {
  text-align: left;
  padding: 16px;
  background: #f5f5f5;
  border-radius: 8px;
}
h3 {
  margin: 8px 0;
}
</style>
