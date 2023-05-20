<template>
  <footer class="footer">
    <div class="container pb-15">
      <div class="footer__row-1">
        <div class="footer__social">
          <h4>Присоединяйтесь к соц сетям</h4>
          <ul class="footer__links">
            <li class="footer__link"><a><v-icon>mdi-vk</v-icon></a></li>
            <li class="footer__link"><a><v-icon>mdi-telegram</v-icon></a></li>
            <li class="footer__link"><a><v-icon>mdi-email</v-icon></a></li>
            <li class="footer__link"><a><v-icon>mdi-whatsapp</v-icon></a></li>
          </ul>
          <div>
            <div>Бесплатно по России:</div>
            <div> 8 999 999 999</div>
          </div>
          <div>
            <div>Бесплатно по Уфе</div>
            <div>8 777 777 777</div>
          </div>
          <div>
            <div>Адрес магазина</div>
            <div>г.Уфа, Ленинская площадь 5</div>
          </div>
        </div>
        <div class="footer__column-1-body">
          <div class="divider"></div>
          <h4 class="mb-5">Компания</h4>
          <ul class="footer__company">
            <li class="footer__company-item"><a href="#">О компании</a></li>
            <li class="footer__company-item"><a href="#">Новости</a></li>
            <li class="footer__company-item">
              <a @click="scrollTo('contacts')">Контакты</a>
            </li>
            <li class="footer__company-item"><a href="#">Вакансии</a></li>
            <li class="footer__company-item">
              <a href="#">Подарочные карты</a>
            </li>
          </ul>
        </div>
        <div class="footer__column-2-body">
          <div class="divider"></div>
          <h4 class="mb-5">Информация</h4>
          <ul class="footer__info">
            <li class="footer__company-item"><a href="#">Магазины</a></li>
            <li class="footer__company-item"><a href="#">Условия оплаты</a></li>
            <li class="footer__company-item">
              <a href="#">Условия доставки</a>
            </li>
            <li class="footer__company-item"><a href="#">Возврат</a></li>
            <li class="footer__company-item">
              <a href="#">Политика конфиденциальности</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer__row-2">
      <div class="container">
        АО «SHORI», 2022
      </div>
    </div>
  </footer>
</template>

<script>
import { useRouter } from 'vue-router';

export default {
  setup() {
    const router = useRouter();
    const scrollTo = (nameRoute) => {
      router.push({ name: nameRoute });

      scroll({
        behavior: 'smooth',
        top: 0,
      })
    }

    
    return { scrollTo, };
  },
};
</script>

<style lang="scss" scoped>
.divider {
  width: 100%;
  height: 2px;
  background-color: #777;
  margin-bottom: 10px;
}
.footer {
  position: relative;
  padding-top: 150px;
  color: white;
  background-color: black;
  &::before {
    content: 'SHORI';
    position: absolute;
    top: 50px;
    left: 361px;
    width: 150px;
    height: 60px;
    background: url('../assets/LogoCompany.png') no-repeat;
    background-size: contain;
    font-size: 30px;
    padding-left: 78px;
    padding-top: 22px;
    font-size: 30px;
  }
  &__row-1 {
    display: flex;
    align-items: flex-start;
    gap: 200px;
  }
  &__row-2 {
    background-color: #111;
    padding-top: 20px;
    padding-bottom: 30px;
    color: rgb(202, 202, 202);

  }
 
  &__links {
    display: flex;
    align-items: center;
    justify-content: space-around;
    width: 100%;
    color:inherit;
    a {
      padding: 10px;
      border: 1px solid #fff;
      color: white;
      cursor: pointer;
      transition: all 0.2s ease;
      &:hover {
        background-color: #555;
      }
    }
  }

  &__company,
  &__info,
  &__social {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 5px;
    color: rgb(211, 211, 211);
  }

  &__social {
    border: 1px solid #fff;
    padding: 10px;
    gap: 20px;
  }
  &__company-item {
    font-size: 14px;
    cursor: pointer;
    &:hover {
      color: #777;
    }
    a {
      color: inherit;
    }
  }
}
</style>
