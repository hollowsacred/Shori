<template v-if="checkList">
  <v-card class="total-sum" width="350" height="480">
    <v-card-title>Всего</v-card-title>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Товар на сумму</div>
      <div>{{ oldPrices }} Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Скидка</div>
      <div>- {{ oldPrices - totalCost }} Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Итог</div>
      <div>{{ totalCost }} Руб</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Оплата</div>
      <div>Картой</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <v-btn :disabled="checkList?.length < 1 || !checkList" @click="clearCartHandler" :to="{name:'check'}" color="green" block>Оформить Заказ</v-btn>
  </v-card>
</template>

<script>
import { useStore } from 'vuex';
import { computed,} from "vue";
import { clearCart, fetchAddOrder } from "../http/fetchCart.js";
export default {
  setup() {
    const store = useStore();
    
    const currentUser = computed(() => store.getters['authStore/getCurrentUser']); 
    const checkList = computed(() => { return store.getters['cartStore/getFilteredCartList'](currentUser.value.id)})
    
    const clearCartHandler = async () => {
      await fetchAddOrder({
        userId: currentUser.value.id,
        cost: totalCost.value,
      })
      await clearCart(currentUser.value.id)
      store.commit('cartStore/setCartList', []);
      store.commit('cartStore/clearCalculatedCartList');
    }
    const totalCost = computed(() => {
      let cost = 0;

      checkList.value?.forEach((item) => cost += item.product.price * item.count);

      return cost;
    })

    const oldPrices = computed(() => {
      let oldCosts = 0;

      checkList.value?.forEach((item) => {
        if (item.product.oldPrice) {
          oldCosts += item.product.oldPrice * item.count;
        }
        else {
          oldCosts +=item.product.price * item.count;
        }
      }) 

      return oldCosts;
    })

    return {totalCost, checkList, clearCartHandler, oldPrices};
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
