<template>
  <div>
    <ProductList v-if="sortedClothes" :data="sortedClothes"/>
    
  </div>
</template>

<script>
import { useStore } from 'vuex';
import { computed } from 'vue';
import ProductList from '../components/ProductList.vue'
import { useRoute } from 'vue-router';
import { getAllProducts } from "../http/fetchProduct.js";
export default {
  setup() {
    const route = useRoute();
    console.log(route.params);
    const store = useStore();
    store.dispatch('productStore/setClothesList', getAllProducts());
    const sortedClothes = computed(() => store.getters['productStore/sortedClothes'](route.params.category, route.params.gender));
    return { sortedClothes };
  },
  components: {
    ProductList,
   
},
}
</script>

<style lang="scss" scoped>

</style>