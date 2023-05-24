<template>
  <div class="profile">
    <div class="container pt-15">
      <h2 class="profile__title"> Профиль </h2>
    </div>
    <v-divider class="pb-10"></v-divider>
    <div class="container">
      <div class="profile-personal profile-wrapper mb-10">
        <div class="d-flex align-center mb-10">
          <v-avatar color="surface-variant" size="70">{{user.name.slice(0,1)}} </v-avatar>
          <div v-if="editProperty !== 'name'" class="profile-personal__title ma-4">{{ user.name }}</div>
          <v-text-field
            v-else 
            :value="user.name"
            v-model="user.name"
            class="profile-personal__title ma-4 field"
            variant="underlined"
            :rules="[value => !!value || 'Field is required']"
            density="compact"
          > 
          </v-text-field>
          <v-icon @click="editHandler('name')">mdi-pencil</v-icon>
        </div>
        <div class="profile-personal__column">
          <div class="profile-personal-group">
            <div class="profile-personal-group__label">Email</div>
            <div class="profile-personal-group__wrapper">
              <div v-if="editProperty !== 'email'" class="profile-personal-group__title">{{ user.email ?? 'Отсутствует' }}</div>
              <v-text-field 
                v-else 
                v-model="user.email" 
                class="profile-personal-group__title"
                :value="user.email"
                variant="underlined"
                density="compact"
                :rules="[value => !!value || 'Field is required']"
              >
              </v-text-field>
              <v-icon @click="editHandler('email')">mdi-pencil</v-icon>
            </div>
          </div>
          <div class="profile-personal-group">
            <div class="profile-personal-group__label" @click="fetchChangeUserProperty({field: 'phone', data: '99999999', userId: user.id})">Телефон</div>
            <div class="profile-personal-group__wrapper">
              <div v-if="editProperty !== 'phone'" class="profile-personal-group__title">{{ user.phone ?? 'Отсутствует' }}</div>
              <v-text-field 
                v-else 
                v-model="user.phone" 
                class="profile-personal-group__title"
                :value="user.phone"
                variant="underlined"
                density="compact"
                :rules="[value => !!value || 'Field is required']"
              >
              </v-text-field>
              <v-icon @click="editHandler('phone')">mdi-pencil</v-icon>
            </div>
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
        <div class="profile-orders__title mb-10">История Заказов</div>
        <OrderList v-if="orderList" :orderList="orderList"/>
        <h3 class="text-center mb-15 text-h4" v-else> Заказов нет</h3>
      </div>
    </div>
  </div>
</template>

<script>
import OrderList from '@/components/OrderList.vue';
import { fetchGetAllOrdersById } from '@/http/fetchCart';
import { fetchChangeUserProperty } from '@/http/fetchUsers';
import { onMounted } from 'vue';
import { computed, ref } from 'vue';
import { useStore } from 'vuex';

export default {
  setup () {
    const store = useStore();
    const gender = ref('man');
    const editProperty = ref(null);

    const currentUser = computed(
      () => store.getters["authStore/getCurrentUser"]
    );

    const user = ref(currentUser.value);

    const editHandler = async (field) => {
      
      if (editProperty.value) {
        if (!user.value[field]) return
        
        await fetchChangeUserProperty({field: field, data: user.value[field], userId: user.value.id});
        return editProperty.value = null;
      }

      editProperty.value = field;
    }

    // const changeUserProperty = (field) => {

    // }

    const orderList = ref(null);

    onMounted(async () => {
      const fetchOrders = await fetchGetAllOrdersById(currentUser.value.id);
      if (fetchOrders.length) {
        orderList.value = fetchOrders;
      }
    })
    return { gender, orderList, currentUser, fetchChangeUserProperty, editProperty, editHandler, user }
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
        gap:50px;
      }
      &__title {
        font-size: 25px;
        font-weight: 600;
      }
      &-group {
        width: 250px;
        &__label {
          color:gray;
          margin-bottom: 5px;
        }
        &__wrapper {
          display: flex;
          align-items: center;
          gap: 10px;
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