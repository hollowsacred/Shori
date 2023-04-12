<template>
  <li class="productcart-item mb-5">
    <div class="productcart-item__body">
      <img class="productcart-item__img" :src="srcImg" alt="kartinka" />
      <div class="productcart-item__description">
        <div class="productcart-item__title">{{ product.title }}</div>
        <div>
          <div>Категория: {{ product.category.name }}</div>
          <div>Количество: {{ countRef }}</div>
        </div>
      </div>
    </div>
    <div class="productcart-item-block">
      <div class="productcart-item__prices">
        <div class="price">{{ calculatedPrice(product.price) }}<span>Руб.</span></div>
        <div class="old-price">{{ calculatedPrice(product.oldPrice)}}<span>Руб</span></div>
      </div>
      <div class="d-flex align-center justify-center counts mt-4">
        <v-btn  @click="changeCalculatedPrice()" density="compact" variant="outlined" height="30"><v-icon>mdi-minus</v-icon></v-btn>
        <div class="productcart-item__count">{{countRef}}</div>
        <v-btn @click="changeCalculatedPrice('plus')" density="compact" variant="outlined" height="30"><v-icon>mdi-plus</v-icon></v-btn>
      </div>
      <div class="text-center mt-10">Только доставка</div>
    </div>
    <v-icon @click="deleteItemCart" class="productcart-item__trash" >mdi-trash-can-outline</v-icon>
  </li>
  <v-divider class="mb-5"></v-divider>
</template>

<script>

import { ref, toRefs, reactive, computed } from "vue";
import { useStore } from "vuex";
import { deleteItemFromCart } from "../http/fetchCart.js";
export default {
  props: {
    data: {
      type: Object,
    },
    type: {
      type: String,
    },
  },
  setup(props) {
    const store = useStore();
    const {product, count} = toRefs(props.data);
    const countRef = ref(count.value);
    const srcImg = `http://localhost:5000/static/${product.value.img}`;
    const currentUser = computed(() => store.getters['authStore/getCurrentUser']); 
    
  const deleteItemCart = async () => {
    await deleteItemFromCart(currentUser.value.id, product.value.id)
    store.commit('cartStore/deleteItemFromCart',{userId: currentUser.value.id, productId: product.value.id});
  }

    const calculatedPrice = (price) => {
      if (countRef.value === 0) {
      return  price + 0;
      }

      return price * countRef.value
    }
    const prices = reactive({
      price:calculatedPrice(props.data.product.price),
      oldPrice:calculatedPrice(props.data.product.oldPrice),
    })

    const changeCalculatedPrice = (type) => {
      if (type === 'plus') {
        countRef.value++;
        prices.oldPrice = calculatedPrice(props.data.product.price);
        prices.price = calculatedPrice(props.data.product.oldPrice);
        store.commit('cartStore/setCalculatedCartList', {...prices, id: product.value.id});
        return
      }

      countRef.value > 1 ? countRef.value-- : countRef.value;
      prices.oldPrice = calculatedPrice(props.data.product.price);
      prices.price = calculatedPrice(props.data.product.oldPrice);
      store.commit('cartStore/setCalculatedCartList', {...prices, id: product.value.id});
      
    }

    store.commit('cartStore/setCalculatedCartList', {...prices, id: product.value.id});

    // watch(countRef, () => {
    //   store.commit('cartStore/setCalculatedCartList',prices);
    // })

    return { props, count, srcImg, product, countRef, calculatedPrice, deleteItemCart, changeCalculatedPrice };
  },
};
</script>

<style lang="scss" scoped>
.productcart-item-block {
  padding: 20px;
}
.productcart-item {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  height: 200px;
  position: relative;
  // border: 1px solid #000;
  font-size: 18px;
  &__trash {
    position: absolute;
    top: -10px;
    right: 30px;
    cursor: pointer;
    &:hover {
      background-color: rgba(153, 153, 153, 0.185);
    }
  }
  &__body {
    display: flex;
    min-height: 197px;
  }
  &__description {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 20px;
  }
  &__prices {
    display: flex;
    align-items: center;
    gap: 10px;
  }
  &__img {
    max-width: 150px;
    max-height: 197px;
    width: 100%;
    height: auto;
  }
  &__title {
    font-weight: bold;
    white-space: nowrap;
  }
  &__cube {
    width: 50px;
    height: 50px;
    border: 1px solid #000;
    text-align: center;
  }
  &__count {
    font-weight: bold;
  }
  .counts {
    gap: 10px;
  }
  .old-price {
    text-decoration: line-through;
    font-size: 14px;
    color: gray;
  }
  .price {
    font-weight: bold;
  }
  .old-price,
  .price {
    span {
      margin-left: 3px;
      font-weight: normal;
    }
  }
}

</style>
