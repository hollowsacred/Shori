<template>
  <div class="container pt-15">
    <h2 class="formen__title">Детская одежда, обувь и аксессуары</h2>
  </div>
  <v-divider class="pb-10"></v-divider>
  <div class="container position-relative">
    <div class="formen-body">
      <BaseSidebar type="kids" />
      <div class="flex-grow-1">
        <div class="d-flex  justify-space-between">
          <ProductSort/>
          <v-text-field v-model="search" class="formen__search"  density="compact" variant="outlined" label="Поиск"></v-text-field>
        </div>
        <RouterView></RouterView>
      </div>
    </div>
    <ModalBtn v-if="isAdmin" class="formen__modal-btn"/>
  </div>
</template>

<script>
import ProductSort from "@/components/ProductSort.vue";
import BaseSidebar from "../components/BaseSidebar.vue";
import ModalBtn from "@/components/ModalBtn.vue";
import { computed, ref, watch } from "vue";
import { useStore } from "vuex";
export default {
  setup() {
    const store = useStore();
    store.commit('productStore/setSearch', '');
    const search = ref('');
    watch(search, (newSearch) => {
      store.commit('productStore/setSearch', newSearch);
    })
    const isAdmin = computed(() => store.getters['authStore/getIsAdmin']);
    return { isAdmin, search};
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
.formen__search {
  max-width: 290px;
  max-height: 40px;
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
