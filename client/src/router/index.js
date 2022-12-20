import { createRouter, createWebHistory, } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CategoryMenView from "../views/CategoryMenView.vue";
import  CategoryMenProductListView  from "../views/CategoryMenProductListView";
import CategoryWomenView from "../views/CategoryWomenView.vue";
import CategoryWomenProductListView from "../views/CategoryWomenProductListView.vue";
import CategoryKidsView from "../views/CategoryKidsView.vue";
import CategoryKidsProductListView from "../views/CategoryKidsProductListView.vue";
import  CheckView  from "../views/CheckView.vue";
import CategoryView from '../views/CategoryView';
import CartView from '../views/CartView.vue';
import AuthView from '../views/AuthView.vue';
import RegistrationView from '../views/RegistrationView.vue';


const routes = [
  {
    path: '/',
    name: 'home',
    component:HomeView,
  },
  {
    path:'/category',
    name:'category',
    component:CategoryView,
    children: [
      {
        path:'formen',
        name:'formen',
        component:CategoryMenView,
        children: [
          {
            path:':category',
            name:'mencategoryitem',
            component:CategoryMenProductListView,
          },
        ]
      },
      {
        path:'forwomen',
        name:'forwomen',
        component:CategoryWomenView,
        children: [
          {
            path:':category',
            name:'womencategoryitem',
            component:CategoryWomenProductListView,
          },
        ]
      },
      {
        path:'forkids',
        name:'forkids',
        component:CategoryKidsView,
        children: [
          {
            path:':category',
            name:'kidscategoryitem',
            component:CategoryKidsProductListView,
          },
        ]
      },
    ]
  },
  {
    path:'/cart',
    name:'cart',
    component:CartView,
    beforeEnter: (to, from) => {
      console.log(from);
    }
  }, 
  {
    path:'/auth',
    name:'auth',
    component:AuthView,
  },
  {
    path:'/reg',
    name:'reg',
    component:RegistrationView,
  },
  {
    path:'/check',
    name:'check',
    component:CheckView,
  }, 
  

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
