<template>
  <ul class="product-list">
    <ProductCartListItem class="mb-6" v-for="item in props.data" :key="item.id" :data="item" :type="props.type"/>
  </ul>
</template>

<script>
import ProductCartListItem from './ProductCartListItem.vue';

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
    components: { ProductCartListItem }
}
</script>

<style lang="scss" scoped>
  .product-list {
    padding-top: 20px;
    flex:1 0;
  }
</style>