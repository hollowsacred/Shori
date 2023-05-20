<template>
  <div class="order-list">
    <OrderListItem v-for="(order, i) in orderList" :key="i" :order="order"/>
  </div>
</template>

<script>
import OrderListItem from './OrderListItem.vue';

export default {
    props: {
        orderList: {
            type: Array,
        }
    },
    setup() {
        return {};
    },
    components: { OrderListItem }
}
</script>

<style lang="scss" scoped>
  .order-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
</style>