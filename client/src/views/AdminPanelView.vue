<template>
  <div class="admin-panel">

    <div class="container pt-15">
      <div class="admin-panel__info d-flex justify-space-between align-center">
        <h2 class="admin-panel__title">Админ Панель</h2>
        <ModalBtn>
          <template v-slot:header>
            Добавить админа
          </template>
          <AdminAddModal @addAdmin="addAdmin"/>
        </ModalBtn>
      </div>
      <v-divider class="pb-8"></v-divider>
      <AdminList @deleteAdmin="deleteAdmin" v-if="!loading" :data="adminList"/>
    </div>
  </div>
</template>

<script>
// import { computed } from '@vue/reactivity';
// import { useStore } from 'vuex';
// import { computed } from '@vue/reactivity';
import AdminList from '@/components/AdminList.vue';
import ModalBtn from '@/components/ModalBtn.vue';
import AdminAddModal from '@/components/AdminAddModal.vue';
import { fetchGetAllAdmins } from '@/http/fetchUsers';
import { ref } from 'vue';
import { onMounted } from 'vue';
// import { useRouter } from 'vue-router';
import { useStore } from 'vuex';

export default {
  components: { AdminList, ModalBtn, AdminAddModal },
  setup () {
    const adminList = ref(null);
    const loading = ref(false);
    const addAdmin = (item) => {
      adminList.value.push(item);
    }
    const deleteAdmin = (id) => {
      adminList.value = adminList.value.filter((item) => item.id !== id);
    }
    const store = useStore();
    // const router = useRouter();
    // const isSuperAdmin = computed(() => store.getters["authStore/getIsAdmin"]);
    
    onMounted(async () => {
      loading.value = true;
      adminList.value = await fetchGetAllAdmins();
      store.commit('setAdminListLength', adminList.value.length);
      loading.value = false;
    })
    
    return { adminList, addAdmin, deleteAdmin }
  }
}
</script>

<style lang="scss" scoped>
 .admin-panel {
  &__info {
    padding-bottom: 30px;
  }
  &__title {
    font-size: 30px;
  }
 }
</style>