<template>
  <div>
    <v-card width="300">
      <v-list v-model:opened="open">
        <v-list-group value="Одежда">
          <template v-slot:activator="{props}">
            <v-list-item title="Одежда" v-bind="props">

            </v-list-item>
          </template>
            <v-list-item :to="{name:'categoryitem', params: {category:item[0]}}" v-for="(item, index) in clothes" :key="index" :title="item[1]">
  
            </v-list-item>
        </v-list-group>
        <v-list-group value="Обувь">
          <template v-slot:activator="{props}">
            <v-list-item title="Обувь" v-bind="props">

            </v-list-item>
          </template>
            <v-list-item :to="{name:'categoryitem', params: {category:item.category}}" v-for="item in shoes" :key="item.id" :title="item.title">
  
            </v-list-item>
        </v-list-group>
        <v-list-group value="Аксессуары">
          <template v-slot:activator="{props}">
            <v-list-item title="Аксессуары" v-bind="props">

            </v-list-item>
          </template>
            <v-list-item :to="{name:'categoryitem', params: {category:item.category}}" v-for="item in accesories" :key="item.id" :title="item.title">
  
            </v-list-item>
        </v-list-group>
      </v-list>
    </v-card>
  </div>
  
</template>

<script>
import { ref } from "vue";
export default {

  setup() {
    const open = ref(['Одежда']);
    const clothes = ref([['outerwear','Верхняя одежда'],['pants','Брюки'],['jumper','Джемперы'],['jeans','Джинсы'],['home-clothes','Домашняя одежда'],['costume','Пиджаки и костюмы'],['shorts','Плавки и шорты для плавания'], ['hoodie','Толстовки и свитшоты']]);
    const shoes = ref([
      {
        id:1,
        title:'Зимняя',
        category:"shoes-winter",
      },
      {
        title:'Демисезонная',
        id:2,
        category:"shoes-demi-season",
      },
      {
        title:'Ботинки',
        id:3,
        category:"boots",
      },
      {
        title:'Кеды и кроссовки',
        id:4,
        category:"sneakers",
      },
      {
        title:'Сапоги',
        id:5,
        category:"high-boots",
      },
    ])
    const accesories = ref([
      {
        title:'Сумки',
        id:1,
        category:"bag",
      },
      {
        title:'Рюкзаки',
        id:2,
        category:'backpacks'
      },
      {
        title:'Зонты',
        id:3,
        category:'umbrella'
      },
      {
        title:'Очки',
        id:4,
        category:'googles'
      },
      {
        title:'Галстуки',
        id:5,
        category:'tie',
      },
    ])
    return {open, clothes, shoes, accesories};
  },
};
</script>

<style lang="scss" scoped></style>
