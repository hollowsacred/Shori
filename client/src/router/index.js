import { createRouter, createWebHistory, } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import CategoryProductListView from "../views/CategoryProductListView.vue";
import CheckView from "../views/CheckView.vue";
import CategoryView from '../views/CategoryView';
import ProductView from '../views/ProductView';
import CartView from '../views/CartView.vue';
import AuthView from '../views/AuthView.vue';
import NotFoundView from '../views/NotFoundView.vue';
import AdminPanelView from '../views/AdminPanelView.vue';
import RegistrationView from '../views/RegistrationView.vue';
import ContactView from '../views/ContactView.vue';
import ProfileView from '../views/ProfileView.vue';



const routes = [
  {
    path: '/',
    name: 'home',
    component:HomeView,
  },
  {
    path:'/admin',
    name: 'admin',
    component: AdminPanelView,
    meta: {role: 'Admin'}
  },
  {
    path:'/profile',
    name:'profile',
    component: ProfileView,
  },
  {
    path:'/category/:gender',
    name:'category',
    component:CategoryView,
    children: [
      {
        path:':category',
        name:'categoryItem',
        component:CategoryProductListView,
      },
    ]
  },
  {
    path:'/product/:id',
    name:'product',
    component: ProductView,
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
  {
    path:'/contacts',
    name:'contacts',
    component: ContactView,
  },
  {
    path:'/vacancy',
    name:'vacancy',
  },
  {
    path: '/news',
    name:'news',
  },
  {
    path:'/:pathMatch(.*)*',
    name:'notfound',
    component: NotFoundView,
  } 
  

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
