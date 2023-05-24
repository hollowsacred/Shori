<template>
  <div class="home">
    <div class="container pb-15">
      <v-carousel
        cycle
        height="500"
        hide-delimiter-background
        show-arrows-on-hover
      >
        <v-carousel-item v-for="(slide, i) in slides" :key="i">
          <img :src="slide" alt="img" class="carousel-img" />
        </v-carousel-item>
      </v-carousel>
    </div>
    <div class="home__wrapper">
      <div class="container">
        <div class="home__bestoffer">
          <h3 class="home__title">Лучшие предложения</h3>
          <ProductList
            class="home__bestoffer-list"
            :data="bestOfferList"
            type="best-offer"
          />
          <ModalBtn class="home__modal-btn" v-if="isAdmin" type="best-offer"/>
        </div>
      </div>
    </div>
    <!-- <div class="container pt-5">
      <div class="home__formen pb-8">
        <h3 class="home__title">Для Мужчин</h3>
        <ProductList class="home__formen-list" :data="menList" type="men" />
        <ModalBtn v-if="isAdmin" class="home__modal-btn" type="men"/>
      </div>
      <div class="home__formen pb-16">
        <h3 class="home__title">Для Женщин</h3>
        <ProductList
          class="home__forwomen-list"
          :data="womenList"
          type="women"
        />
        <ModalBtn v-if="isAdmin" class="home__modal-btn" type="women"/>
      </div>
    </div> -->
    <div class="home-images">
      <div @click="navigateTo({routeName:'categoryItem', gender:'formen', category:'outerwear'})">
        <img :src="require('../assets/2.jpg')" />
        <div class="home-images-man">Для него</div>
      </div>
      <div @click="navigateTo({routeName: 'categoryItem', gender: 'forwomen', category:'outerwear' })">
        <img :src="require('../assets/1.jpg')" />
        <div class="home-images-woman">Для нее</div>
      </div>
    </div>
  </div>
</template>

<script>
import ProductList from "../components/ProductList.vue";
import { computed} from "vue";
import { useStore } from "vuex";
import ModalBtn from "@/components/ModalBtn.vue";
import { getAllProducts } from "@/http/fetchProduct";
import { useRouter } from "vue-router";
export default {
  setup() {
    const store = useStore();
    const router = useRouter();
    const slides = [
      require("../assets/carousel-pictures/carousel-1.jpg"),
      require("/src/assets/carousel-pictures/carousel-2.jpg"),
      require("../assets/carousel-pictures/carousel-3.jpg"),
      require("../assets/carousel-pictures/carousel-4.jpg"),
      require("../assets/carousel-pictures/carousel-5.jpg"),
    ];
    const bestOfferList = computed(
      () => store.getters["homeStore/getHomeBestOfferList"]
    );
    const menList = computed(() => store.getters["homeStore/getHomeMenList"]);
    const womenList = computed(
      () => store.getters["homeStore/getHomeWomenList"]
    );
    const isAdmin = computed(() => store.getters['authStore/getIsAdmin']);
    store.dispatch('productStore/setClothesList', getAllProducts());

    const navigateTo = ({routeName, gender, category}) => {
      router.push({name: routeName, params: {gender: gender, category: category}});
      scroll({
        behavior: 'smooth',
        top: 0,
      })

    }
    return { slides, bestOfferList, womenList, menList, isAdmin, navigateTo };
  },
  components: {
    ProductList,
    ModalBtn
},
};
</script>

<style lang="scss" scoped>
.home {
  padding-top: 80px;
  &__title {
    font-size: 30px;
    margin-bottom: 40px;
  }
  &__wrapper {
    background-color: rgba(119, 119, 119, 0.055);
    padding-bottom: 60px;
  }
  &__bestoffer {
    padding-top: 40px;
    position: relative;
  }
  &__formen,
  &__forwomen {
    position: relative;
  }
  &__product-add-btn {
    position: absolute;
    top: 50%;
    right: -250px;
  }
  &__modal-btn {
    position: absolute;
    top: 50%;
    right: -250px;
  }
}
.home-images {
  display: flex;
  & > div {
    position: relative;
    width: 50%;
    cursor: pointer;
    transition: all 0.3s ease;
    &:hover {
      transform: scale(1.01);
    }
    & img {
    width: 100%;
    }
    & > div {
      color: bisque;
      font-size: 80px;
      font-weight: 600;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
    & .home-images-man {
      color: wheat;
    }
    & .home-images-woman {
      color: black;
    }
  }
}

.carousel-img {
  object-fit: fill;
  width: 100%;
}
</style>
