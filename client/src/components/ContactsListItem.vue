<template>
  <div class="contact-item">
    <div class="contact-item-info">
      <h2 class="contact-item__title">Адрес магазина в {{ contact.city }}</h2>
      <div class="contact-item__address">Адрес: {{ contact.index }}, {{ contact.city }}, {{ contact.street }} , дом {{ contact.streetNumber }}</div>
    </div>
    <div class="contact-item-link" @click="$emit('change-coords', [+contact.longitude, +contact.latitude])">
      <v-icon color="error">mdi-map-marker-radius</v-icon>
      <div>
        Открыть на карте
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name:'ContactsListItem',
  props: {
    contact: {
      type: Object,
    }
  },
  emits: ['change-coords'],
  setup (props) {
    

    return {props}
  }
}
</script>

<style lang="scss" scoped>
  .contact-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    border: 1px solid gray;
    transition: all 0.3s ease;
    &-link {
      display: flex;
      gap: 10px;
      cursor: pointer;
    }
    &:hover {
      box-shadow: 0px 5px 15px -5px gray;
      transform: scale(1.01);
    }
  }
</style>