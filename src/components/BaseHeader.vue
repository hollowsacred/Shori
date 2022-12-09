<template>
  <header class="header">
    <div class="container header__row">
      <nav class="header-nav-links">
        <router-link to="/category/formen">Мужчинам</router-link>
        <v-divider vertical />
        <router-link to="/category/forwomen">Женщинам</router-link>
        <v-divider vertical />
        <router-link exact to="/category/forkids">Детям</router-link>
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
        <router-link to="/auth">
          <v-icon>mdi-account</v-icon>
          Вход \ Регистрация
        </router-link>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  setup() {
    return {};
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
        color:black;
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
}
</style>
