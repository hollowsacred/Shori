<template>
  <li class="productcart-item mb-5">
    <div class="productcart-item__body">
      <img class="productcart-item__img" :src="props.data.img" alt="kartinka" />
      <div class="productcart-item__description">
        <div class="productcart-item__title">{{props.data.title}}</div>
        <div>
          <div>Категория: {{props.data.category}}</div>
          <div>Количество: {{ count }}</div>
        </div>
      </div>
    </div>
    <div>
      <div class="productcart-item__prices">
        <div class="price">{{ props.data.price }}<span>Руб.</span></div>
        <div class="old-price">{{ props.data.oldPrice }}<span>Руб</span></div>
      </div>
      <div class="d-flex align-center justify-center counts mt-4">
        <v-btn  @click="count > 1 ? count-- : count" density="compact" variant="outlined" height="30"><v-icon>mdi-minus</v-icon></v-btn>
        <div class="productcart-item__count">{{count}}</div>
        <v-btn @click="count++" density="compact" variant="outlined" height="30"><v-icon>mdi-plus</v-icon></v-btn>
      </div>
      <div class="text-center mt-10">Только доставка</div>
    </div>
  </li>
  <v-divider class="mb-5"></v-divider>
</template>

<script>
import { ref } from "vue";
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
    const count = ref(props.data.count)
    return { props, count };
  },
};
</script>

<style lang="scss" scoped>
.productcart-item {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  height: 200px;
  // border: 1px solid #000;
  font-size: 18px;
  &__body {
    display: flex;
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
    padding: 20px;
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
