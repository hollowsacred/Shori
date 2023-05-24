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
import { getAllItemsCartById } from './http/fetchCart';
import { computed } from '@vue/reactivity';
import { useRouter } from 'vue-router';
import { watch } from 'vue';

export default {
  name: "App",

 setup() {
  const store = useStore();
  const router = useRouter(); //eslint-disable-line
  const isSuperAdmin = computed(() => store.getters["authStore/getIsSuperAdmin"]); //eslint-disable-line
  const currentUser = computed(() => store.getters['authStore/getCurrentUser']); 

  watch(currentUser, (user) => {
    if (user.id === 4) {
      return store.dispatch('cartStore/setCartList', null)
    }

    store.dispatch('cartStore/setCartList', getAllItemsCartById(currentUser.value.id));
  })

  router.beforeEach((to) => {
    if (to.meta.role === 'Admin' && !isSuperAdmin.value) {
      router.push('/');
    }
  })

  const closedRoutes = ['check', 'cart', 'profile'];

  router.beforeEach((to) => {
    console.log(to.name);
    if (closedRoutes.includes(to.name) && currentUser.value.id === 4) {
      router.push('/');
    }
  })

  return {
  }
 },
components: {
  BaseHeader,
  BaseFooter,
}

};
</script>
