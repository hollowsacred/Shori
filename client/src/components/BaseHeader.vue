<template>
  <header class="header">
    <div class="container header__row">
      <nav class="header-nav-links">
        <router-link :to="{ name: 'formen' }">Мужчинам</router-link>
        <v-divider vertical />
        <router-link :to="{ name: 'forwomen' }">Женщинам</router-link>
        <v-divider vertical />
        <router-link :to="{ name: 'forkids' }">Детям</router-link>
      </nav>
      <router-link to="/" class="header__logo">
        <img
          height="60"
          :src="require('../assets/LogoCompany.png')"
          alt="Logo"
        />
      </router-link>
      <div class="header__links">
       
          <div @click="navigateToCart" class="header__cart">
            <v-icon color="#999">mdi-cart</v-icon>
            <div v-if="cartCount?.count > 0" class="header__cart-count">{{  cartCount?.count }}</div>
          </div>
       

        <router-link v-if="!isAuth" to="/auth">
          <v-icon>mdi-account</v-icon>
          Вход \ Регистрация
        </router-link>
        <v-chip class="chip" link variant="outlined" v-else
          >Вы вошли как: {{ isAdmin ? "Админ" : "Пользователь" }}</v-chip
        >
        <div @click="logoutFromAccount">
          <v-chip class="chip" link color="error" v-if="isAuth">Выйти</v-chip>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
import { useStore } from "vuex";
import { computed } from "vue";
import { useRouter } from "vue-router";
export default {
  setup() {
    const store = useStore();
    const router = useRouter();
    const isAuth = computed(() => store.getters["authStore/getAuth"]);
    const isAdmin = computed(() => store.getters["authStore/getIsAdmin"]);
    const currentUser = computed(
      () => store.getters["authStore/getCurrentUser"]
    );
    const cartList = computed(() =>
      store.getters["cartStore/getFilteredCartList"](currentUser.value.id)
    );
    const cartCount = computed(() =>
      cartList.value
        ? cartList.value.reduce(
            (prevItem, currentItem) => ({
              count: prevItem.count + currentItem.count,
            }),
            { count: 0 }
          )
        : null
    );

    const navigateToCart = () => {
        if (!isAuth.value) {
         return router.push({name:"auth"})
        }
        router.push({name:'cart'});
    }

    const logoutFromAccount = () => {
      store.commit("authStore/setAuth", false);
      store.commit("authStore/setIsAdmin", false);
      store.commit('authStore/setCurrentUser', {name:'guest', id:4});
      store.commit('cartStore/setCartList', null);
      router.push({ path: "/" });
    };

    return { isAuth, isAdmin, logoutFromAccount, cartCount, navigateToCart };
  },
};
</script>

<style lang="scss" scoped>
.header {
  margin-top: 20px;
  &__row {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  &__links {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    a {
      color: #999;
      &:hover {
        color: black;
      }
    }
  }
  &__cart {
    position: relative;
    i {
      cursor: pointer;
      &:hover {
        color: black !important;
      }
    }
    &:hover div {
      background-color: black;
    }
    &-count {
      position: absolute;
      top: -11px;
      right: -17px;

      border-radius: 20px;
      text-align: center;
      background-color: #999;
      // border: 1px solid #999;
      font-size: 12px;
      color: pink;
      padding: 0 6px;
    }
  }
  .header-nav-links {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    a {
      padding: 10px 20px;
      transition: all 0.2s ease;
      &:hover {
        background-color: rgba(128, 128, 128, 0.151);
      }
    }
  }
  .chip {
    user-select: none;
  }
}
</style>
