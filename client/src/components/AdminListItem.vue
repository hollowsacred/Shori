<template>
  <div class="admin-list-item mb-5">
    <div class="admin-list-item__info">
      <div class="admin-list-item__info-email">Емайл: {{ item.email }}</div>
      <div class="admin-list-item__info-name">Логин: {{ item.login }}</div>
      <div class="admin-list-item__info-name">Пароль: {{ item.password }}</div>

    </div>
    <div class="admin-list-item-btns">
      <v-btn @click="deleteAdmin" color="error" variant="outlined">Удалить</v-btn>
    </div>
  </div>
</template>

<script>
import { fetchDeleteAdmin } from '@/http/fetchUsers';

export default {
  props: {
    item: {
      type: Object,
    }
  },
  setup (props, { emit }) {
    
    const deleteAdmin = async () => {
      emit('deleteAdmin', props.item.id);
      await fetchDeleteAdmin(props.item.id);
    }
    return { deleteAdmin }
  }
}
</script>

<style lang="scss" scoped>
  .admin-list-item {
    padding: 20px;
    border: 1px solid gray;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    &__info {
      display: flex;
      align-items: center;
      gap: 15px;
      div {
        padding: 10px 25px;
        border-radius: 25px;
        border: 1px solid gray;
        cursor: pointer;
        &:hover {
          background-color: lighten(#777, 50);
        }
      }
    }
  }
</style>