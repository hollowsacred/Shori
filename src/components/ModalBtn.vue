<template>
  <div class="modal-btn" >
    <v-btn @click="isShowModal = !isShowModal" color="green">
      Добавить товар
    </v-btn>
    <v-overlay v-model="isShowModal" class="d-flex align-center justify-center">
      <ProductAddModal @close="isShowModal = false" :type="props.type" />
    </v-overlay>
  </div>

</template>

<script>
import { ref } from "vue";
import ProductAddModal from "./ProductAddModal.vue";
export default {
  props:{
    type: String,
  },
  setup(props) {
    const isShowModal = ref(false);
    return { isShowModal, props };
  },
  components: { ProductAddModal},
};
</script>

<style lang="scss" scoped>
.modal-btn {
  position: absolute;
  top: 50%;
  right: -250px;
}
</style>
