<template>
  <v-app>
    <BaseHeader/>
    <v-main class="pb-15">
      <router-view />
    </v-main>
    <BaseFooter/>
  </v-app>
</template>

<script>
import BaseHeader from './components/BaseHeader.vue';
import BaseFooter from './components/BaseFooter.vue';
import { useStore } from 'vuex';
import { getAllItemsCart } from './http/fetchCart';

export default {
  name: "App",

 setup() {
  const store = useStore()
  store.dispatch('cartStore/setCartList', getAllItemsCart());
  return {

  }
 },
components: {
  BaseHeader,
  BaseFooter,
}

};
</script>
