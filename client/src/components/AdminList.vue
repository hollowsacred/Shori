<template>
  <div class="admin-list">
    <AdminListItem @deleteAdmin="deleteAdmin" v-for="(item, i) in data" :key="i" :item="item"/>
  </div>
</template>

<script>
import AdminListItem from './AdminListItem.vue';

export default {
    props: {
      data: {
        type: Array,
      }
    },
    setup(props, {emit}) {
      const deleteAdmin = (id) => {
        emit('deleteAdmin', id);
      }
      return { deleteAdmin };
    },
    components: { AdminListItem }
}
</script>

<style lang="scss" scoped>
  .admin-list {
    border: 1px solid gray;
    border-radius: 10px;
    padding: 20px;
    min-height: 400px;
  }
</style>