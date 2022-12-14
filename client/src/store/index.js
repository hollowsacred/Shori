import { createStore } from 'vuex'
import authStore from './authStore';
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
  }
})
