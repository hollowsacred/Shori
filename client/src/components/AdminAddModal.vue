<template>
  <div>
    <v-card class="modal" width="400" min-height="300">
      <v-form @submit.prevent>
        <v-text-field
            v-model="dataItem.email"
            label="Е-майл"
            variant="underlined"
            :rules="[required]"
        >
        </v-text-field>
        <v-text-field
            v-model="dataItem.login"
            label="Логин"
            variant="underlined"
            :rules="[required]"
        >
        </v-text-field>
        <v-text-field
            v-model="dataItem.password"
            label="Пароль"
            variant="underlined"
            :rules="[required]"
        >
        </v-text-field>
        <v-btn color="green" type="submit" @click="addAdmin" variant="outlined">Добавить</v-btn>
      </v-form>
    </v-card>
  </div>
</template>

<script>
import { fetchAddAdmin } from '@/http/fetchUsers';
import { computed } from '@vue/reactivity';
import { reactive } from 'vue';
import { useStore } from 'vuex';

export default {
  setup (props, { emit }) {
    const store = useStore();
    const dataItem = reactive({
      email:'',
      login:'',
      password:'',
    });
    const adminListLength = computed(() => store.getters['getadminListLength']);
    const required = (v) => !!v || "Введите данные";
    const addAdmin = async () => {
      if (!dataItem.email || !dataItem.login || !dataItem.password ) {
        return;
      }

      emit('addAdmin', {...dataItem, roleId: 1, id: adminListLength.value + 1});
      emit('close');
      await fetchAddAdmin(dataItem);
      
    }
    return { dataItem, required, addAdmin }
  }
}
</script>

<style lang="scss" scoped>
  .modal {
    padding: 20px;
    position: relative;
  }
</style>