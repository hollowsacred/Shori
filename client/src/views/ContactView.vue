<template>
  <div class="container pt-15">
    <h2 class="contacts__title"> Контакты </h2>
  </div>
  <v-divider class="pb-10"></v-divider>
  <div class="container">
    <div class="contacts-body pb-10">
      <div class="contacts-body-info">
        <h3 class="contacts-body-info__title">OOO &laquo;Shori&raquo;</h3>
        <div class="contacts-body-info__group">
          <div class="contacts-body-info__title">Юридический адрес:</div>
          <div class="contacts-body-info__label">450076, г.Уфа, Пушкина , дом 56</div>
        </div>
        <div class="contacts-body-info__group">
          <div class="contacts-body-info__title">Телефоны:</div>
          <div class="contacts-body-info__label">
            <a href="tel:8 800 666 35353">8 800 666 35353</a>
          </div>
        </div>
        <div class="contacts-body-info__group">
          <div class="contacts-body-info__title">E-mail:</div>
          <div class="contacts-body-info__label">
            <a href="mailto:shop@shori.ru">shop@shori.ru</a>
          </div>
        </div>
        <div class="contacts-body-info__group">
          <div class="contacts-body-info__title">Время работы:</div>
          <div class="contacts-body-info__label">Ежедневно с 10:00 - 22:00</div>
        </div>
      </div>
      <div class="contacts-body-map">
        <YandexMap :settings="yandexSettings"  :coordinates="currentCoordinates">
          <YandexCollection :options="{ preset: 'islands#redFashionIcon' }">
            <YandexMarker 
              v-for="(mark, i) in contactsList" 
              :key="`1-marker-${i}`" 
              :markerId="`1-marker-${i}`" 
              :coordinates="[+mark.longitude, +mark.latitude]"
              :options="{ balloonMinHeight: 70, ballonMaxHeight: 300, balloonMinWidth: 200,}"
            >
            <template #component>
              <CustomBallon :name="fullAddress(mark)" />
            </template>
          </YandexMarker>
          </YandexCollection>
        </YandexMap>
      </div>
    </div>
    <ContactsList :contactsList="contactsList" @change-coords="changeCurrentCoordinates"/>
  </div>
</template>

<script>
import ContactsList from '@/components/ContactsList.vue';
import CustomBallon from '@/components/CustomBallon.vue';
import { fetchGetAllContacts } from '@/http/fetchContacts';
import { onMounted } from 'vue';
import { ref } from 'vue';
import { YandexCollection, YandexMap, YandexMarker, } from 'vue-yandex-maps'; //eslint-disable-line

const yandexSettings = {
      apiKey: '432cca9c-ebda-4914-a7b6-4646d1fda74f', // Индивидуальный ключ API
      lang: 'ru_RU', // Используемый язык
    }

export default {
  setup() {
    const contactsList = ref([
      {
        index: 450076,
        city: 'г.Уфа',
        street: 'Пушкина',
        streetNumber: 56,
        longitude: 54.723538,
        latitude: 55.931948,
      },
    ]);
    const currentCoordinates = ref([54.723538, 55.931948]);
    onMounted(async () => {
      const fetchContacts = await fetchGetAllContacts();
      contactsList.value.push(...fetchContacts);
    })
    const changeCurrentCoordinates = (coords) => {
      currentCoordinates.value = coords;
    }
    const fullAddress = (contact) => {
      return `${contact.index}, ${contact.city}, ${contact.street}, дом ${contact.streetNumber}`
    }
    
    return { contactsList, yandexSettings, currentCoordinates, changeCurrentCoordinates, fullAddress }
  },
  components: { ContactsList, YandexMap, YandexCollection, YandexMarker, CustomBallon } 
}
</script>

<style lang="scss" scoped>
.contacts__title {
  font-size: 30px;
  margin-bottom: 45px;
}
.contacts-body {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  &-info {
    display: flex;
    flex-direction: column;
    gap: 15px;
    &__title {
      font-size: 24px;
      font-weight: 600;
    }
  }
}
.yandex-container {
  height: 600px;
  width: 700px;
}
a {
  color: rgba(5, 5, 199, 0.719)
}
</style>