<template>
  <div class="auth">
    <v-card variant="outlined" class="auth-card" width="600" min-height="300">
      <h2 class="mb-5">Регистрация</h2>
      <v-text-field v-model="regData.login" variant="outlined" label="Логин"></v-text-field>
      <v-text-field v-model="regData.password" variant="outlined" label="Пароль"></v-text-field>
      <v-text-field v-model="regData.email" variant="outlined" label="Почта"></v-text-field>
      <div class="auth__btns">
        
          <v-btn @click="tryToReg" color="green" variant="outlined">Зарегистрироваться</v-btn>
    
      </div>
    </v-card>
  </div>
</template>

<script>
import { RegTo } from "@/http/fetchAuth";
import { users } from "@/mocks/mocks";
import { reactive } from "vue";
import { useRouter } from "vue-router";

export default {
  setup () {
    const router = useRouter();
    const regData = reactive({
      login:'',
      password:'',
      email:'',
      role:'user',
    })

    const tryToReg = async () => {
      if (regData.login && regData.password) {
        users.push(regData);
        await RegTo(regData);
        router.push({name:'auth'});
      }
    }
    return {regData, tryToReg}
  }
}
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
