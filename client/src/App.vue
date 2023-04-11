<template>
  <v-app>
    <BaseHeader />
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
import { computed } from '@vue/reactivity';
import { useRouter } from 'vue-router';

export default {
  name: "App",

 setup() {
  const store = useStore();
  const router = useRouter(); //eslint-disable-line
  const isSuperAdmin = computed(() => store.getters["authStore/getIsSuperAdmin"]); //eslint-disable-line
  // router.beforeEach((to) => {
  //   if (to.meta.role === 'Admin' && !isSuperAdmin.value) {
  //     router.push('/');
  //   }
    
  // })
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
