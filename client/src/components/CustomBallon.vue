<template>
  <div class="custom-balloon">
    <div class="custom-balloon__title">
      {{ name }}
    </div>
    <div>Работает с 10:00 до 22:00</div>
  </div>
</template>

<script setup>
  defineProps({
    name: {
      type: String,
    }
  })
</script>

<style lang="scss" scoped>
.custom-balloon__title {
  margin-bottom: 10px;
  font-weight: 600;
}
</style>