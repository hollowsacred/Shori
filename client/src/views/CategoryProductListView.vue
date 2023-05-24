<template>
  <div v-if="sortedClothes">
    <ProductList :data="filteredClothes"/>
    <v-pagination v-model="page" :length="paginationLength"></v-pagination>
    
  </div>
</template>

<script>
import { useStore } from 'vuex';
import { computed } from 'vue';
import ProductList from '../components/ProductList.vue'
import { useRoute } from 'vue-router';
import { getAllProducts } from "../http/fetchProduct.js";
import { ref } from 'vue';

export default {
  setup() {
    const route = useRoute();
    const page = ref(1);
    const countItems = 6;
    console.log(route.params);
    const store = useStore();
    store.dispatch('productStore/setClothesList', getAllProducts());
    const sortedClothes = computed(() => store.getters['productStore/sortedClothes'](route.params.category, route.params.gender));
    const filteredClothes = computed(() => {
      if (page.value > 1) {
        return sortedClothes.value.slice(countItems * (page.value - 1), countItems * page.value)
      }

      return sortedClothes.value.slice(0, countItems)
    });

    const paginationLength = computed(() => {
      if (sortedClothes.value.length > 6) {
       return Math.ceil(sortedClothes.value.length / countItems);
      }

      return 1;
    });

    return { sortedClothes, filteredClothes, paginationLength, page,  };
  },
  components: {
    ProductList,
   
},
}
</script>

<style lang="scss" scoped>

</style>