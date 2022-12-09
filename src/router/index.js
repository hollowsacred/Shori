import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CategoryMenView from "../views/CategoryMenView.vue";
import CategoryWomenView from "../views/CategoryWomenView.vue";
import CategoryKidsView from "../views/CategoryKidsView.vue";
import CategoryView from '../views/CategoryView';
import CartView from '../views/CartView.vue';
import AuthView from '../views/AuthView.vue';
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
      },
      {
        path:'forwomen',
        name:'forwomen',
        component:CategoryWomenView,
      },
      {
        path:'forkids',
        name:'forkids',
        component:CategoryKidsView,
      },
    ]
  },
  {
    path:'/cart',
    name:'cart',
    component:CartView,
  }, 
  {
    path:'/auth',
    name:'auth',
    component:AuthView,
  }
  
  

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
