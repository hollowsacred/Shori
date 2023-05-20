<template>
  <div class="profile">
    <div class="container pt-15">
      <h2 class="profile__title"> Профиль </h2>
    </div>
    <v-divider class="pb-10"></v-divider>
    <div class="container">
      <div class="profile-personal profile-wrapper mb-10">
        <div class="d-flex align-center mb-10">
          <v-avatar color="surface-variant" size="70">П</v-avatar>
          <div class="profile-personal__title ml-4">Петя</div>
        </div>
        <div class="profile-personal__column">
          <div class="profile-personal-group">
            <div class="profile-personal-group__label">Email</div>
            <div class="profile-personal-group__title">shori@gmail.com</div>
          </div>
          <div class="profile-personal-group">
            <div class="profile-personal-group__label">Телефон</div>
            <div class="profile-personal-group__title">7 917 555 35 35</div>
          </div>
          <div class="profile-personal-group">
            <div class="profile-personal-group__label rel">Пол</div>
            <v-radio-group v-model="gender" inline>
              <v-radio label="Муж." value="man"/>
              <v-radio label="Жен." value="woman"/>
            </v-radio-group>
            <!-- <div class="profile-personal-group__title">fdfdsfsd</div> -->
          </div>
        </div>
      </div>
      <div class="profile-wrapper profile-discount mb-10">
        <div class="profile-discount__title mb-5">Скидочная карта</div>
        <div class="profile-discount__column">
          <div class="profile-discount-card">
            <v-img class="profile-discount-card__img" src="../assets/discount2.jpg"></v-img>
          </div>
          <div class="profile-discount-procent">
            <div class="profile-discount-procent-number">0%</div>
            <div class="profile-discount-procent-label">Скидка покупателя</div>
          </div>
          <div>
            <div class="text-h6">
              У вас нет скидочной карты!
            </div>
            <div>Подтвердите номер телефона.</div>
          </div>
        </div>
      </div>
      <div class="profile-wrapper profile-orders">
        <div class="profile-orders__title mb-10">Заказы</div>
        <OrderList :orderList="orderList"/>
      </div>
    </div>
  </div>
</template>

<script>
import OrderList from '@/components/OrderList.vue';
import { ref } from 'vue';

export default {
  setup () {
    const gender = ref('man');
    const orderList = ref([
      {
        price: '10 900',
        datePurchase: '8 марта 2023',
      },
      {
        price: '5 900',
        datePurchase: '12 декабря 2023',
      },
      {
        price: '3 000',
        datePurchase: '1 сентября 2023',
      },
    ])
    return { gender, orderList }
  },
  components: { OrderList }
}
</script>

<style lang="scss" scoped>
  .profile {
    .profile-wrapper {
      padding: 25px;
      padding-bottom: 5px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,.1);
    }
    &__title {
      font-size: 30px;
      margin-bottom: 45px;
    }
    &-personal {
      &__column {
        display: flex;
        gap: 250px;
      }
      &__title {
        font-size: 25px;
        font-weight: 600;
      }
      &-group {
        &__label {
          color:gray;
          margin-bottom: 5px;
        }
        &__title {

        }
      }
    }
  }
  .profile-discount {
    padding-bottom: 25px !important;
    &__title {
      font-size: 25px;
      font-weight: 600;
    }
    &__column {
      display: flex;
      align-items: center;
      gap: 100px;
    }
    &-card {
      width: 300px;
      &__img {
        border-radius: 20px;
      }
    }
    &-procent {
      width: 100%;
      max-width: 300px;
      padding: 25px;
      background-color: #f6f6f9;
      border-radius: 20px;
      &-number {
        font-size: 25px;
        font-weight: 600;
        margin-bottom: 10px;
      }
      &-label  {
        color: gray;
      }
    }

  }
  .profile-orders {
    &__title {
      font-size: 25px;
      font-weight: 600;
    }
  }

  .rel {
    position: relative;
    left: 10px;
  }
</style>