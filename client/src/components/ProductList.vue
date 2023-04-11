<template>
  <ul class="product-list">
    <ProductListItem v-for="item in props.data" :key="item.id" :data="item" :type="props.type"/>
  </ul>
</template>

<script>
import ProductListItem from './ProductListItem.vue';

export default {
  props:{
    data:{
      type: Array,
    },
    type: {
      type: String,
    },
    category: {
      type: String,
    }
  },
    setup(props) {
        return {props};
    },
    components: { ProductListItem,}
}
</script>

<style lang="scss" scoped>
  .product-list {
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    gap: 20px;
  }
</style>