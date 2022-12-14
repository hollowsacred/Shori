<template>
  <div class="container pt-15">
    <h2 class="formen__title">Мужская одежда, обувь и аксессуары</h2>
  </div>
  <v-divider class="pb-10"></v-divider>
  <div class="container position-relative">
    <div class="formen-body">
      <BaseSidebar />
      <div>
        <ProductSort/>
        <RouterView></RouterView>
      </div>
    </div>
    <ModalBtn class="formen__modal-btn"/>
  </div>
</template>

<script>
import ProductSort from "@/components/ProductSort.vue";
import BaseSidebar from "../components/BaseSidebar.vue";
import ModalBtn from "@/components/ModalBtn.vue";
export default {
  setup() {
    return { };
  },
  components: {
    BaseSidebar,
    ProductSort,
    ModalBtn
},
};
</script>

<style lang="scss" scoped>
.formen-body {
  display: flex;
  gap: 40px;
  &__sort {
    display: flex;
    align-items: center;
    gap: 10px;
  }
}
.formen__modal-btn {
  top:inherit;
  right: -200px;
}
.formen__title {
  font-size: 30px;
  margin-bottom: 45px;
}
</style>
