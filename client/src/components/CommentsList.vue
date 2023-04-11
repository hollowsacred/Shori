<template>
  <div class="comments-list">
    <!-- <v-card v-for="(item, i) in data" :key="i" class="mb-3 comments-list__item" width="100%" :title="item.user" prepend-icon="mdi-account" variant="outlined">
      <v-card-text>
        {{ item.description }}
      </v-card-text>
      <template v-slot:append>
          <div @click="isLiked = !isLiked" class="justify-self-end comments-list__item-like">
            <v-icon :icon="isLiked ? 'mdi-heart' :'mdi-heart-outline'"></v-icon>
            <span class="subheading me-2">0</span>
          </div>
        </template>
    </v-card> -->
    <CommentsListItem v-for="(item, i) in data" :key="i" :item="item"/>
  </div>
</template>

<script>
import CommentsListItem from './CommentsListItem.vue';

export default {
  props: {
    data: {
      type: Array,
    }
  },
  components: { CommentsListItem },
  setup () {
    
    return {  }
  }
}
</script>

<style lang="scss" scoped>

</style>