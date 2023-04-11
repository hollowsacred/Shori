<template>
  <v-card class="mb-3 comments-list__item" width="100%" :title="item.user.login === 'guest' ? 'Гость' : item.user.login" :subtitle="parseDate(item.date)" prepend-icon="mdi-account" variant="outlined">
      <v-card-text>
        {{ item.description }}
      </v-card-text>
      <template v-slot:append>
          <div @click="changeLike" class="justify-self-end comments-list__item-like">
            <v-icon :color="isLiked ? 'red' : ''" :icon="isLiked ? 'mdi-heart' :'mdi-heart-outline'"></v-icon>
            <span class="subheading me-2">{{ isLiked ? item.likes + 1 : item.likes}}</span>
          </div>
        </template>
    </v-card>
</template>

<script>
import { ref } from 'vue';

export default {
  props: {
    item: {
      type: Object,
    }
  },
  setup () {
    const isLiked = ref(false);

    const parseDate = (date) => {
      const objDate = new Date(date);
      return objDate.toISOString().slice(0,10) + ":" + objDate.toTimeString().slice(0,8);
    }

    const changeLike = () => {
      isLiked.value = !isLiked.value;
    }

    return { isLiked, parseDate, changeLike }
  }
}
</script>

<style lang="scss" scoped>

</style>