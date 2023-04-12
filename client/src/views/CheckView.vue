<template>
  <div class="check d-flex align-center justify-center pt-15">
    <v-card class="check-card" width="600" elevation="8">
      <v-card-title class="text-center"> Чек </v-card-title>
      <v-divider></v-divider>
      <div class="d-flex justify-space-between mb-5 mt-5">
        <div>Название Товара</div>
        <div>ЦЕНА</div>
      </div>
      <ul class="check-list">
        <li v-for="item in copyCheckList" :key="item.id">
          <div class="d-flex justify-space-between">
            <div>
              {{ item.product.title }}
            </div>
            <div>
              {{ item.count }} X {{ item.product.price }} =
              {{ item.product.price * item.count }} Руб.
            </div>
          </div>
        </li>
      </ul>
      <v-divider class="mb-5 mt-5"></v-divider>
      <div class="d-flex justify-space-between mb-5">
        <div class="bold">ИТОГО</div>
        <div class="bold">{{ totalCost }} Руб.</div>
      </div>
      <v-divider class="mb-5"></v-divider>
      <v-img 
        :aspect-ratio="3"
        :src="qrSrc"
      ></v-img>
    </v-card>
  </div>
</template>

<script>
import { useStore } from "vuex";
import { computed, } from "vue";
import { ref } from "vue";

export default {
  setup() {
    const store = useStore();
    const checkList = computed(() => store.getters["cartStore/getCartList"]);
    let totalCost = 0;
    let qrSrc = ref(null);
    
    const getQrSrc = () => {
        let text = ``;
        checkList.value.forEach((item) => {
          text += `Товар: ${item.product.title} | Количество: ${item.count} | Цена: ${item.product.price}\n`;
        })

        text += `\nИтого: ${totalCost} Руб`;
        text = encodeURI(text);
        return `https://api.qrserver.com/v1/create-qr-code/?data=${text}`;
      // console.log(text);
    }

    if (checkList.value) {
      checkList.value.forEach(
        (item) => (totalCost += item.product.price * item.count)
      );
      qrSrc.value = getQrSrc();
    }
    
    console.log(checkList.value);
    const copyCheckList = checkList.value ? [...checkList.value] : null;

    return { checkList, totalCost, copyCheckList, qrSrc,  };
  },
};
</script>

<style lang="scss" scoped>
.check-card {
  padding: 20px;
}
.bold {
  font-weight: bold;
}
// .check-list {
//   padding: 20px;
// }
</style>
