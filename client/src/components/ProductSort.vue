<template>
  <div class="product-sort pb-10">
    <v-menu transition="scale-transition">
      <template v-slot:activator="{ props }">
        <v-card v-bind="props" class="product-sort__body">
          Сортировать по: {{ productSorts[sort] }}
        </v-card>
      </template>

      <v-list v-model:selected="sort">
        <v-list-item
          v-for="(item, i) in productSorts"
          :key="i"
          :title="item"
          :value="i"
        >
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
import { ref, watch } from "vue";
import { useStore } from "vuex";
export default {
  setup() {
    const store = useStore();
    const sort = ref([0]);
    const productSorts = ref([
      "Без сортировки",
      "По убыванию",
      "По возрастанию",
    ]);

    watch(sort, (newSort) => {
      store.commit('productStore/setSort',productSorts.value[newSort[0]]);
    })
    return { productSorts, sort};
  },
};
</script>

<style lang="scss" scoped>
.product-sort {
  max-width: 300px;
  &__body {
    padding: 5px 10px;
  }
}
</style>
