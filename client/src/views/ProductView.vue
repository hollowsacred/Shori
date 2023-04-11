<template>
  <div class="container pt-15">
    <v-divider class="pb-10"></v-divider>
    <div v-if="!productLoading" class="product-item">
      <div v-if="product">
        <div class="product-item__wrap">
          <div>
            <img :src="srcImg" alt="picture" class="product-item__img"/>
          </div>
          <div class="product-item__body">
            <h2 class="product-item__title mb-7">{{ product.title }}</h2>
            <div class="product-item-prices">
              <div class="product-item__price">{{ product.price }} Руб.</div>
              <div class="product-item__old-price">{{ product.oldPrice }} Руб.</div>
            </div>
            <v-select class="mb-3" v-model="currentColor"
              label="Цвет"
              :items="['Черный', 'Красный', 'Белый', 'Фиолетовый']"
              variant="solo"
            >
            </v-select>
            <div class="product-item-sizes mb-7">
              <v-btn-toggle
              v-model="currentSize"
              mandatory
              
            >
              <v-btn v-for="(item, i) in sizesProduct" :key="i" variant="outlined" class="product-item-sizes__size mr-4">
                {{ item }}
              </v-btn>
            </v-btn-toggle>
            </div>
            <v-btn @click="addToCart" :disabled="loading" :loading="loading" width="100%" color="green">Добавить в корзину</v-btn>
            <v-divider class="mb-2 mt-7"></v-divider>
            <div class="product-item__description-title">Описание</div>
            <v-divider class="mb-5 mt-2"></v-divider>
            <div class="product-item__description">
              Черная тостовка, хлопок, высшее качество!
            </div>
          </div>
        </div>
        <div class="product-item-comments">
          <h3 class="pt-7 pb-7">Комментарии</h3>
          <div class="product-item-comments__write">
            <v-text-field v-model="commentText" label="Комментарий" variant="outlined" density="compact"></v-text-field>
            <v-btn @click="addCommentHandler" height="40" variant="outlined">Отправить</v-btn>
          </div>
          <CommentsList :data="commentsList"/>
        </div>
      </div>
      <div v-else class="pt-15 pb-15 text-center">Товара в данный момент в наличии нет.......</div>
    </div>
    <div v-else class="pt-15 pb-15 text-center loader">Загрузка....</div>
  </div>
</template>

<script>
import CommentsList from '@/components/CommentsList.vue';
import { addItemToCart } from '@/http/fetchCart';
import { addComment, getAllCommentsById } from '@/http/fetchComments';
import { getProductById } from '@/http/fetchProduct';
import { computed } from '@vue/reactivity';
import { ref } from 'vue';
import { onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { useStore } from 'vuex';

export default {
  setup () {
    const store = useStore();
    const route = useRoute();
    const router = useRouter();
    const isAuth = computed(() => store.getters['authStore/getAuth']);
    const product = ref(null);
    const currentUser = computed(
      () => store.getters["authStore/getCurrentUser"]
    );
    const currentColor = ref('Черный');
    const currentSize = ref(1);
    const srcImg = ref('');
    const loading = ref(false);
    const productLoading = ref(false);
    const commentText = ref('');
    const sizesProduct = ['S', 'M', 'L', 'XL', 'XXL'];
    const commentsList = ref([
      {
        icon:'icon',
        user:'tot',
        description:'а так то крутая толстовка',
      },
      {
        icon:'icon',
        user:'admin',
        description:'вот бы мне такую',
      },
  ]);

    onMounted(async () => {
      productLoading.value = true;
      product.value = await getProductById(route.params.id);
      srcImg.value = `http://localhost:5000/static/${product.value?.img}`;
      commentsList.value = await getAllCommentsById(route.params.id);
      console.log(commentsList.value);
      productLoading.value = false;
    })

    const addToCart = async () => {
      if (!isAuth.value) {
        router.push({name:'auth'});
        return;
      }

      loading.value = true;
      const itemInfo = await addItemToCart(currentUser.value, product.value);
      store.commit('cartStore/addItemCartList', itemInfo);
      loading.value = false;
    }

    const addCommentHandler = async () => {
      let userLogin = 'guest';
      if (currentUser.value.name !== 'guest') {
        userLogin = currentUser.value.login
      }
      commentsList.value.push({
        user: {login: userLogin},
        description: commentText.value,
        likes: 0,
        date: Date.now(),
      })
      await addComment({
        userId: currentUser.value.id,
        productId: product.value.id,
        description: commentText.value,
      });

      commentText.value = '';
    }
    return { 
      product,
      srcImg,
      currentColor,
      currentSize,
      loading,
      productLoading,
      sizesProduct,
      commentsList,
      commentText,
      addToCart,
      addCommentHandler,
     }
  },
  components: { CommentsList }
}
</script>

<style lang="scss" scoped>

</style>