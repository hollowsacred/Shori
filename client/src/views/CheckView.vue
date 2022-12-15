<template>
  <div class="check d-flex align-center justify-center pt-15">
    <v-card class="check-card" width="600" elevation="8">
     <v-card-title class="text-center">
      Чек
     </v-card-title> 
     <v-divider></v-divider>
     <div class="d-flex justify-space-between mb-5 mt-5">
      <div>Название Товара</div>
      <div>ЦЕНА</div>
     </div>
     <ul class="check-list">
      <li v-for="item in checkList" :key="item.id">
        <div class="d-flex justify-space-between">
          <div>
            {{item.product.title}}
          </div>
          <div>
            {{item.count}} X {{item.product.price}} = {{item.product.price * item.count}} Руб.
          </div>
        </div>
      </li>
     </ul>
     <v-divider class="mb-5 mt-5"></v-divider>
     <div class="d-flex justify-space-between mb-5">
      <div class="bold">ИТОГО</div>
      <div class="bold">{{totalCost}} Руб.</div>
     </div>
     <v-divider class="mb-5"></v-divider>
     <v-img :aspect-ratio="3" src="http://localhost:5000/static/q-code.png"></v-img>
    </v-card>
  </div>
</template>

<script>
import { useStore } from 'vuex';
import { computed } from "vue";
export default {
  setup () {
    const store = useStore();
    const checkList = computed(() => store.getters['cartStore/getCartList']);
    let totalCost = 0;
    checkList.value.forEach((item) => totalCost += item.product.price * item.count)
    console.log(checkList.value);
    return {checkList, totalCost}
  }
}
</script>

<style lang="scss" scoped>
  .check-card {
    padding: 20px;
  }
  .bold {
    font-weight: bold;
  }
  // .check-list {
  //   padding: 20px;
  // }
</style>