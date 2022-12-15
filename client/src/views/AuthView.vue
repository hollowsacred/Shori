<template>
  <div class="auth">
    <v-card variant="outlined" class="auth-card" width="600" min-height="300">
      <h2 class="mb-5 text-center">Авторизация</h2>
      <v-text-field
        v-model="loginData.login"
        variant="outlined"
        label="Логин"
      ></v-text-field>
      <v-text-field
        v-model="loginData.password"
        variant="outlined"
        label="Пароль"
      ></v-text-field>
      <div class="auth__btns">
        <v-btn @click="tryToLogin" color="info" variant="outlined">Войти</v-btn>
        <RouterLink :to="{ name: 'reg' }">
          <v-btn color="green" variant="outlined">Зарегистрироваться</v-btn>
        </RouterLink>
      </div>
    </v-card>
  </div>
</template>

<script>
import { reactive } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { LoginTo } from "../http/fetchAuth.js";
export default {
  setup() {
    const router = useRouter();
    const store = useStore();
    const loginData = reactive({
      login: "",
      password: "",
    });

    const checkRole = (user) => {
      if (user.role.name === "admin") {
        store.commit("authStore/setIsAdmin", true);
        return user;
      }

      store.commit("authStore/setIsAdmin", false);
      return user;
    };

    const tryToLogin = async () => {
      const user = await LoginTo(loginData);
      console.log(loginData);
      console.log(user);
      if (!user) {
        console.log("ne nashel");
        return;
      }
      store.commit('authStore/setCurrentUser',user);
      store.commit("authStore/setAuth", true);
      checkRole(user);
      router.push("/");
    };

    return { loginData, tryToLogin };
  },
};
</script>

<style lang="scss" scoped>
.auth {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-top: 150px;
  padding-bottom: 150px;
  &__btns {
    display: flex;
    justify-content: space-between;
  }
}
.auth-card {
  padding: 20px;
}
</style>
