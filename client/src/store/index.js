import { createStore } from 'vuex'
import authStore from './authStore';
import cartStore from './cartStore';
import homeStore from './homeStore';
import productStore  from "./productStore";


export default createStore({
  state: {
    adminListLength: 0,
  },
  getters: {
    getAdminListLength(state) {
      return state.adminListLength
    }
  },
  mutations: {
    setAdminListLength(state, payload) {
      state.adminListLength = payload;
    }
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
