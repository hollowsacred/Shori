<template>
  <div class="container pt-15">
    <h2 class="formen__title">
      Мужская одежда, обувь и аксессуары
    </h2>
  </div>
  <v-divider class="pb-10"></v-divider>
  <div class="container">
    <BaseSidebar/>
  </div>
</template>

<script>
import BaseSidebar from "../components/BaseSidebar.vue";
export default {
  setup () {
    

    return {}
  },
  components: {
    BaseSidebar,
  }
}
</script>

<style lang="scss" scoped>
  .formen__title {
    font-size: 30px;
    margin-bottom: 45px;
  }
</style>