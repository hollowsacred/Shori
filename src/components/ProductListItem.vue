<template>
  <li @mouseenter="(isActive = true)" @mouseleave="(isActive = false)" class="product-list__item">
    <div class="product-list__item-info">
      <v-img :src="img" class="product-list__item-img"/>
      <div class="product-list__item-body">
        <div class="product-list__item-prices">
          <div class="product-list__item-price"> {{price}} Руб</div>
          <div class="product-list__item-price product-list__item-price--old">{{oldPrice}} Руб</div>
        </div>
        <div class="product-list__item-title">{{title}}</div>
      </div>
    </div>
    
      <div  class="product-list__item-buy" v-if="isActive">
        <div class="product-list__item-counts">
          <div @click="count === 0 ? count : count-- " class="product-list__item-counts-minus minus"><v-icon>mdi-minus</v-icon></div>
          <div class="product-list__item-counts-count">{{count}}</div>
          <div @click="count++" class="product-list__item-counts-plus plus"><v-icon>mdi-plus</v-icon></div>
        </div>
        <button class="product-list__item-button">В корзину</button>
      </div>
   
  </li>
</template>

<script>
import { ref, toRefs } from 'vue';

export default {
  props: {
    data: {
     type: Object,
    }
  },
  setup (props) {
    const isActive = ref(false);
    const count = ref(0);
    const {id,img,title, price, oldPrice} = toRefs(props.data);  
    const changeActive = () => {
      isActive.value = true;
    }
    return {id, img, title, price, oldPrice, isActive, changeActive, count}
  }
}
</script>

<style lang="scss" scoped>
.product-list__item {
  position: relative;
  gap: 10px;
  width: 220px;
  min-height: 379px;
  transition: all 0.2s ease;
  z-index: 5;
  &-buy {
    display: flex;
    width: 100%;
    height: 50px;
    position: absolute;
    z-index: 1;
    background-color: white;
    border-top-width: 0;
    border: 1px solid rgba(0, 0, 0, 0.233);
  }
  &-counts {
    flex: 1 0;
    display: flex;
    align-items: center;
    justify-content: space-around;
    background-color: rgba(119, 119, 119, 0.233); 
    div {
      font-size: 15px;
    }
  }

  .minus, .plus {
    color: rgba(0, 0, 0, 0.363);
    :hover {
      cursor: pointer;
      color:black;
    }
  }
  &-button {
    background-color: rgba(2, 185, 2, 0.842);
    padding: 0 10px;
  }
  &-info {
    border: 1px solid rgba(0, 0, 0, 0.233);
  }
  &:hover {
    box-shadow: 0px 0px 15px -5px black;
  }
  &-price--old {
    color: rgba(255, 0, 0, 0.801);
    text-decoration: line-through;
  }
  &-prices {
    display: flex;
    align-items: center;
    gap:15px;
    margin-bottom: 10px;
  }
  &-body {
    
    padding: 10px;
  }
  &-img {
    margin-bottom: 20px;
  }

}
</style>