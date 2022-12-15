<template v-if="checkList">
  <v-card class="total-sum" width="350" height="480">
    <v-card-title>Всего</v-card-title>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Товар на сумму</div>
      <div>{{totalCost}} Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Скидка</div>
      <div>- {{discount}} Руб</div>
    </div>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Итог</div>
      <div>{{totalCost}} Руб</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <div class="d-flex align-center justify-space-between mb-5">
      <div>Оплата</div>
      <div>Картой</div>
    </div>
    <v-divider class="mb-5"></v-divider>
    <v-btn @click="deleteItemsCart" :to="{name:'check'}" color="green" block>Оформить Заказ</v-btn>
  </v-card>
</template>

<script>
import { useStore } from 'vuex';
import { computed,} from "vue";
import { deleteItemFromCart } from "../http/fetchCart.js";
export default {
  setup() {
    const store = useStore();
    
    const checkList = computed(() => store.getters['cartStore/getCartList']);
    const user = store.getters['authStore/getCurrentUser'];
    const deleteItemsCart = async () => {
      await deleteItemFromCart(user.id)
    }
    const totalCost = computed(() => {
        let cost = 0;
        if (checkList.value) {
          checkList.value.forEach((item) => cost += item.product.price * item.count);
      
        }
        return cost;
    })

    const discount = computed(() => {
        let discount = 0;
        if (checkList.value) {
          checkList.value.forEach((item) => discount += item.product.oldPrice * item.count - item.product.price * item.count);
         
        }
        return discount;
    })
  
    return {totalCost, discount, checkList, deleteItemsCart};
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
