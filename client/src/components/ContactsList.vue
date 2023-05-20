<template>
  <div class="contacts-list">
    <ContactsListItem 
      v-for="(contact, index) in contactsList" 
      :key="index" 
      :contact="contact"
      @change-coords="(coords) => changeCoords(coords)"
    />
  </div>
</template>

<script>
import ContactsListItem from './ContactsListItem.vue';

export default {
  props: {
    contactsList: {
      type: Array,
    },
  },
  emits: ['change-coords'],
  setup(props, {emit}) {
    const changeCoords = (coords) => {
      emit('change-coords', coords);
      scroll({
        behavior:'smooth',
        top: 150,
      })

    }
    return { changeCoords };
  },
  components: { ContactsListItem }
}
</script>

<style lang="scss" scoped>
  .contacts-list {
    padding: 10px;
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
</style>