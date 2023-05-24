<template>
  <div class="auth">
    <v-card variant="outlined" class="auth-card" width="600" min-height="300">
      <h2 class="mb-5">Регистрация</h2>
      <v-text-field
        v-model="regData.login"
        variant="outlined"
        label="Логин"
        :rules="[
        v => !!v || 'Field is required'
      ]"
      ></v-text-field>
      <v-text-field
        v-model="regData.password"
        variant="outlined"
        type="password"
        label="Пароль"
        :rules="[
        v => !!v || 'Field is required'
      ]"
      ></v-text-field>
      <v-text-field
        v-model="regData.email"
        variant="outlined"
        label="Почта"
        :rules="[
        v => !!v || 'Field is required'
      ]"
      ></v-text-field>
      <v-text-field
        v-model="regData.name"
        variant="outlined"
        label="Имя"
        :rules="[
        v => !!v || 'Field is required'
      ]"
      ></v-text-field>
      <div class="auth__btns">
        <v-btn :disabled="!regData.login || !regData.password || !regData.email || !regData.name" @click="tryToReg" color="green" variant="outlined"
          >Зарегистрироваться</v-btn
        >
      </div>
    </v-card>
    <v-snackbar
      v-model="snackbar"
      vertical
    >
      <div class="text-subtitle-1 pb-2">Ошибка</div>

      <p>Пользователь с таким логином уже зарегистрирован в системе </p>

      <template v-slot:actions>
        <v-btn
          color="green"
          variant="text"
          @click="snackbar = false"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script>
import { RegTo } from "@/http/fetchAuth";
import { users } from "@/mocks/mocks";
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";

export default {
  setup() {
    const router = useRouter();
    const regData = reactive({
      login: "",
      password: "",
      email: "",
      gender: 'man',
      name: '',
      role: "user",
    });
    const snackbar = ref(false);

    const tryToReg = async () => {
      if (regData.login && regData.password) {
        users.push(regData);
        const user = await RegTo(regData);
        if (!user) {
          snackbar.value = true;
          return;
        }
        router.push({ name: "auth" });
      }
    };
    return { regData, tryToReg, snackbar };
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
    justify-content: center;
  }
}
.auth-card {
  padding: 20px;
}
</style>
