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
        <router-link to="/cart">
          <v-icon>mdi-cart</v-icon>
        </router-link>

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
import { useStore } from 'vuex';
import { computed } from "vue";
import { useRouter } from 'vue-router';
export default {
  setup() {
    const store = useStore();
    const router = useRouter();
    const isAuth = computed(() => store.getters['authStore/getAuth']);
    const isAdmin = computed(() => store.getters['authStore/getIsAdmin']);
    
    const logoutFromAccount = () => {
      store.commit('authStore/setAuth',false);
      store.commit('authStore/setIsAdmin',false);
      router.push({path:'/'});
    }

    return {isAuth, isAdmin, logoutFromAccount};
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
