<template>
  <div class="cart">
    <div class="container pt-15">
      <h2 class="cart__title">Оформление заказа</h2>
      <v-divider></v-divider>
      <div class="cart__body">
        <ProductCartList v-if="cartList?.length > 0" :data="cartList" />
        <div class="cart__empty text-center" v-else>Корзина пустая</div>
        <TotalSum class="cart-total-sum"></TotalSum>
      </div>
      <h2 class="cart__title">Способ доставки</h2>
      <v-card variant="outlined" class="cart-delivery mb-5">
        <div class="mb-3">Курьером</div>
        <v-text-field
          placeholder="город, улица, дом, квартира"
          density="compact"
          variant="outlined"
        ></v-text-field>
        <div class="mb-3">Доставка: <span class="bold">от 4 дней</span></div>
        <div class="d-flex align-center justify-space-between">
          <div>Стоимость: <span class="bold">бесплатно</span></div>
          <div>
            Стоимость доставки: бесплатно при заказе
            <span class="bold"> от 2000 руб</span>
          </div>
        </div>
      </v-card>
      <h2 class="cart__title">
          Ваши данные
      </h2>
      <div class="d-flex align-center justify-space-between inputs-body">
        <v-text-field label="Имя" variant="outlined" density="compact"></v-text-field>
        <v-text-field label="Фамилия" variant="outlined" density="compact"></v-text-field>
      </div>
      <div class="d-flex align-center justify-space-between inputs-body">
        <v-text-field label="Телефон" variant="outlined" density="compact"></v-text-field>
        <v-text-field label="E-mail" variant="outlined" density="compact"></v-text-field>
      </div>
      <v-textarea label="Коментарий" variant="outlined" density="compact"></v-textarea>
    </div>
  </div>
</template>

<script>
import ProductCartList from "@/components/ProductCartList.vue";
import { useStore } from "vuex";
import TotalSum from "../components/TotalSum.vue";
import { computed } from "vue";
export default {
  setup() {
    const store = useStore();
      const currentUser = computed(() => store.getters['authStore/getCurrentUser']); 
      const cartList = computed(() => { return store.getters['cartStore/getFilteredCartList'](currentUser.value.id)})
    return { cartList };
  },
  components: { ProductCartList, TotalSum },
};
</script>

<style lang="scss" scoped>
.cart {
  &__title {
    font-size: 30px;
    padding-bottom: 30px;
  }
  &__body {
    position: relative;
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
  }
  &__empty {

  }
}
.cart-total-sum {
  
}
.bold {
  font-weight: bold;
}
.cart-delivery {
  padding: 20px;
}
.inputs-body {
  gap:20px;
}
</style>
