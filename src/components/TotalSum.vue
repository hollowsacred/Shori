<template>
  <v-card class="total-sum" width="350" height="400">
    <v-card-title>Всего</v-card-title>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Товар на сумму</div>
      <div>3000 Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Скидка</div>
      <div>- 599 Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Итог</div>
      <div>2411 Руб</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Оплата</div>
      <div>Картой</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <v-btn color="green" block>Оформить Заказ</v-btn>
  </v-card>
</template>

<script>
export default {
  setup() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
.total-sum {
  padding: 20px;
  background: #f8f8f8;
  font-size: 18px;
}
</style>
