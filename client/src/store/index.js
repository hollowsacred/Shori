import { createStore } from 'vuex'
import authStore from './authStore';
import cartStore from './cartStore';
import homeStore from './homeStore';
import productStore  from "./productStore";


export default createStore({
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    productStore,
    homeStore,
    authStore,
    cartStore
  }
})
