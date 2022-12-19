<template>
  <li class="product-list__item">
    <div @mouseenter="isActive = true" @mouseleave="isActive = false">
      <div class="product-list__item-info">
        <v-img
          cover
          :src="props.type ? dataItem.img : srcImg"
          class="product-list__item-img"
        />

        <div class="product-list__item-body">
          <div class="product-list__item-prices">
            <div class="product-list__item-price">{{ dataItem.price }} Руб</div>
            <div class="product-list__item-price product-list__item-price--old">
              {{ dataItem.oldPrice }} Руб
            </div>
          </div>
          <div class="product-list__item-title">{{ dataItem.title }}</div>
        </div>
      </div>
      <div>
        <div class="product-list__item-buy" v-if="isActive">
          <div class="product-list__item-buy-row-1">
            <div class="product-list__item-counts">
              <div
                @click="count === 0 ? count : count--"
                class="product-list__item-counts-minus minus"
              >
                <v-icon>mdi-minus</v-icon>
              </div>
              <div class="product-list__item-counts-count">{{ count }}</div>
              <div @click="count++" class="product-list__item-counts-plus plus">
                <v-icon>mdi-plus</v-icon>
              </div>
            </div>
            <v-btn :loading="isLoading" :disabled="isLoading" @click="addToCart" color="green" variant="flat" height="50">В корзину</v-btn>
          </div>
          <div v-if="isAdmin" class="product-list__item-buy-row-2">
            <v-btn @click="isChange = true" block variant="flat"
              >Изменить</v-btn
            >
            <v-btn @click="deleteItem" block color="error" variant="flat"
              >Удалить</v-btn
            >
          </div>
        </div>
      </div>
    </div>
    <div v-if="isChange" class="product-list__item-change">
      <v-text-field
        v-model="changedItem.price"
        variant="underlined"
        label="Цена"
      ></v-text-field>
      <v-text-field
        v-model="changedItem.oldPrice"
        variant="underlined"
        label="Старая цена"
      ></v-text-field>
      <v-text-field
        v-model="changedItem.title"
        variant="underlined"
        label="Описание"
      ></v-text-field>
      <v-btn
        @click="changeItem"
        class="mb-5"
        block
        variant="outlined"
        color="green"
        >Изменить</v-btn
      >
      <v-btn @click="isChange = false" block variant="outlined" color="error"
        >Закрыть</v-btn
      >
    </div>
  </li>
</template>

<script>
import { addItemToCart} from "@/http/fetchCart";
import { changeItemProduct } from "../http/fetchProduct.js";
import { ref, toRefs, reactive, computed } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { deleteProductItem } from "../http/fetchProduct.js";
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
    const router = useRouter();
    const isActive = ref(false);
    const isChange = ref(false);
    const isLoading = ref(false);
    const count = ref(0);
    const { data: dataItem, type } = toRefs(props);
    const srcImg = `http://localhost:5000/static/${dataItem.value.img}`;
    const isAuth = computed(() => store.getters['authStore/getAuth']);
    const changedItem = reactive({
      ...dataItem.value,
    });

    const changeActive = () => {
      isActive.value = true;
    };

    const changeItem = async () => {
      isChange.value = false;
      if (type.value) {
        store.commit("homeStore/changeItem", {
          item: dataItem.value,
          changedItem: changedItem,
          type: type.value,
        });
      } else {
        await changeItemProduct(changedItem)
        store.commit("productStore/changeItem", {
          item: dataItem.value,
          changedItem: changedItem,
        });
      }
    };

    const deleteItem = () => {
      if (type.value) {
        store.commit("homeStore/deleteItem", {
          item: dataItem.value,
          type: type.value,
        });
      } else {
        store.dispatch(
          "productStore/deleteItem",
          deleteProductItem(dataItem.value.id)
        );
      }
    };

    const addToCart = async () => {
      if (type.value) {
        return;
      }
      if (!isAuth.value) {
        router.push({name:'auth'});
        return;
      }
      isLoading.value = true;
      const user = store.getters['authStore/getCurrentUser'];
      const itemInfo = await addItemToCart(user,dataItem.value);
      store.commit('cartStore/addItemCartList', itemInfo);
      isLoading.value = false;
      console.log(isLoading.value);
    }
    const isAdmin = computed(() => store.getters["authStore/getIsAdmin"]);

    return {
      dataItem,
      isActive,
      isChange,
      changeActive,
      count,
      deleteItem,
      changeItem,
      changedItem,
      isAdmin,
      props,
      srcImg,
      addToCart,
      isLoading
    };
  },
};
</script>

<style lang="scss" scoped>
.product-list__item {
  position: relative;
  gap: 10px;
  width: 220px;
  min-height: 379px;
  transition: all 0.2s ease;
  &-change {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    padding: 20px;
    z-index: 999;
    background-color: rgba(233, 233, 233, 0.904);
  }
  &-buy {
    display: flex;
    flex-direction: column;
    width: 100%;
    min-height: 50px;
    position: absolute;
    z-index: 999;
    border: 1px solid rgba(0, 0, 0, 0.233);
    &-row-1 {
      display: flex;
      flex: 1 0 50px;
    }
    &-row-2 {
    }
  }
  &-counts {
    flex: 1 0;
    display: flex;
    align-items: center;
    justify-content: space-around;
    background-color: rgb(228, 228, 228);
    div {
      font-size: 15px;
    }
  }

  .minus,
  .plus {
    color: rgba(0, 0, 0, 0.363);
    :hover {
      cursor: pointer;
      color: black;
    }
  }
  &-button {
    background-color: rgba(2, 185, 2, 0.842);
    padding: 0 10px;
    transition: all 0.3s ease;
    &:hover {
      background-color: darken(rgba(2, 185, 2, 0.842),8);
    }
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
    gap: 15px;
    margin-bottom: 10px;
  }
  &-body {
    padding: 10px;
  }
  &-img {
    margin-bottom: 20px;
    height: 290px;
  }
}
</style>
