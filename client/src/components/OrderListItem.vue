<template>
  <div class="order-item mb-5">
    <div class="order-item-body">
      <div class="order-item-body__date text-h6">Заказ от {{ order.datePurchase }}</div>
      <div class="order-item-body__price">{{ order.price }} руб.</div>
      <div class="order-item-body__status ">Выполнен</div>
    </div>
    <div class="order-item__arrow"></div>
  </div>
  <v-divider class="mb-5"></v-divider>
</template>

<script>
export default {
  props: {
    order: {
      type: Object,
    }
  },
  setup () {
    

    return {}
  }
}
</script>

<style lang="scss" scoped>
  .order-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 150px;
    &-body {
      display: flex;
      align-items: center;
      gap: 100px;
      & > div {
        width: 150px;
      }
      &__date {
        width: 350px !important;
      }
    }
    &__arrow {
      width: 20px;
      height: 20px;
      border-radius: 30px;
      background-color: #8080809c;

    }
  }
</style>