<template>
  <div>
    <v-card class="modal" width="400" min-height="500">
      <v-form @submit.prevent>
        <h3 class="mb-5 text-center">Добавить товар</h3>

        <v-file-input
          v-model="dataItem.File"
          label="Добавить картинку"
          variant="underlined"
          :rules="[required]"
        ></v-file-input>
        <div class="modal__prices d-flex">
          <v-text-field
            v-model="dataItem.price"
            label="Цена"
            variant="underlined"
            class="mr-5"
            :rules="[required]"
            type="number"
          ></v-text-field>
          <v-text-field v-if="hasDiscount"
          v-model="dataItem.oldPrice"
          label="Старая цена"
          variant="underlined"
          :rules="[required]"
          type="number"
          ></v-text-field>
          <v-btn  @click="hasDiscount = true" color="green" v-else>
            Добавить скидку
          </v-btn>
        </div>

        <v-text-field
          v-model="dataItem.title"
          :rules="[required]"
          label="Название"
          variant="underlined"
        ></v-text-field>
        <v-textarea v-model="dataItem.description" label="Описание" variant="outlined">

        </v-textarea>

        <v-select v-model="dataItem.category"
          label="Категория"
          :items="itemsCategory"
          item-title="title"
          item-value="value"
          variant="underlined"
        ></v-select>

        <v-select v-model="dataItem.belongs"
          label="Принадлежность"
          :items="belongsCategory"
          item-title="title"
          item-value="value"
          variant="underlined"
        ></v-select>

        <div class="d-flex justify-space-between align-center">
          <v-btn @click="addItem()" type="submit" color="green">Добавить</v-btn>
        </div>
        <div @click="$emit('close')" class="modal__close">X</div>
      </v-form>
    </v-card>
  </div>
</template>

<script>
import { addProduct } from "@/http/fetchProduct";
import { reactive, ref } from "vue";
import { useStore } from "vuex";

export default {
  props: {
    isShowModal: {
      type: Boolean,
    },
    type: {
      type: String,
    },
  },
  setup(props, { emit }) {
    const store = useStore();
    const hasDiscount = ref(false);
    const dataItem = reactive({
      title: "",
      price: "",
      oldPrice: 0,
      File: [],
      count: 0,
      category:'',
      belongs:'',
      description:'',
    });
    const belongsCategory = ref([
      {title:'Мужчина', value:'formen'},
      {title:'Жещина', value:'forwomen'},
      {title:'Ребенок', value:'forkids'},
    ])
    const itemsCategory =  ref([
      {title:'Верхняя одежда', value:'1'},
      {title:'Брюки', value:'2'},
      {title:'Джемперы', value:'3'},
      {title:'Джинсы', value:'4'},
      {title:'Домашняя одежда', value:'5'},
      {title:'Пиджаки и костюмы', value:'6'},
      {title:'Плавки и шорты для плавания', value:'7'},
      {title:'Толстовки и свитшоты', value:'8'},
      {title:'Зимняя', value:'9'},
      {title:'Демисезонная', value:'10'},
      {title:'Ботинки', value:'11'},
      {title:'Кеды и кроссовки', value:'17'},
      {title:'Сапоги', value:'18'},
      {title:'Сумки', value:'19'},
      {title:'Рюкзаки', value:'20'},
      {title:'Зонты', value:'21'},
      {title:'Очки', value:'22'},
      {title:'Галстуки', value:'12'},
    ]);
    const formData = new FormData();
    const required = (v) => !!v || "Введите данные";
    const addItem = async () => {
      if (!dataItem.title || !dataItem.price || !dataItem.belongs || dataItem.File.length == 0) {
        return;
      }

      if (props.type) {
        store.commit("homeStore/addItem", { dataItem, type: props.type });
      } else {
        formData.append('title',dataItem.title);
        formData.append('price',dataItem.price);
        formData.append('oldPrice',dataItem.oldPrice);
        formData.append('count',dataItem.count);
        formData.append('category',dataItem.category);
        formData.append('File', dataItem.File[0]);
        formData.append('belongs', dataItem.belongs);
        formData.append('description', dataItem.description);
        store.dispatch("productStore/addItem", addProduct(formData));
      }

      emit("close");
    };
    return { props, required, dataItem, addItem, itemsCategory, belongsCategory, hasDiscount };
  },
};
</script>

<style lang="scss" scoped>
.modal {
  padding: 20px;
  position: relative;
  &__close {
    position: absolute;
    top: 10px;
    right: 15px;
    color: red;
    font-size: 30px;
    cursor: pointer;
  }
}
</style>
