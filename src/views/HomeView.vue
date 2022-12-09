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
          <ProductList class="home__bestoffer-list" :data="bestOffers" />
        </div>
      </div>
    </div>
    <div class="container pt-5">
      <div class="home__formen pb-8">
        <h3 class="home__title">Для Мужчин</h3>
        <ProductList class="home__formen-list" :data="menList" />
      </div>
      <div class="home__formen pb-16" >
        <h3 class="home__title">Для Женщин</h3>
        <ProductList class="home__forwomen-list" :data="womenList"/>
      </div>
    </div>
  </div>
</template>

<script>
import { bestOffers, menList, womenList } from "@/mocks/mocks";
import ProductList from "../components/ProductList.vue";
export default {
  setup() {
    const slides = [
      require("../assets/carousel-pictures/carousel-1.jpg"),
      require("/src/assets/carousel-pictures/carousel-2.jpg"),
      require("../assets/carousel-pictures/carousel-3.jpg"),
      require("../assets/carousel-pictures/carousel-4.jpg"),
      require("../assets/carousel-pictures/carousel-5.jpg"),
    ];
    
    

    return { slides, bestOffers, menList, womenList };
  },
  components: {
    ProductList,
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
  }
}
.carousel-img {
  object-fit: fill;
  width: 100%;
}
</style>
