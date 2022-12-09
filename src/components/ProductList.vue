<template>
  <ul class="product-list">
    <ProductListItem v-for="item in props.data" :key="item.id" :data="item"/>
  </ul>
</template>

<script>
import ProductListItem from './ProductListItem.vue';

export default {
  props:{
    data:{
      type: Array,
    }
  },
    setup(props) {
        return {props};
    },
    components: { ProductListItem }
}
</script>

<style lang="scss" scoped>
  .product-list {
    display: flex;
    align-items: center;
    gap: 30px;
  }
</style>