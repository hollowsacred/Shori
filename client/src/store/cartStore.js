

export const state = () => ({
  cartList: null,
  calculatedCartList:[],
})

export const getters = {
  getCartList: state => {
    return state.cartList
  },

  getCalculatedCartList: state => {
    return state.calculatedCartList;
  },

  getCalculatedPrices: state => {
    let totalCost = 0;
    let discount = 0;
      state.calculatedCartList.forEach((item) => totalCost += item.price);
      state.calculatedCartList.forEach((item) => discount += item.oldPrice - item.price);
    return {totalCost, discount};
  },



  getFilteredCartList: state => id => {
    if (!state.cartList) return;
    return state.cartList.filter((item) => item.basketId === id);
  }
}

export const mutations = {
  setCartList: (state, payload) => {
    state.cartList = payload
  },

  setCalculatedCartList: (state, payload) => {
    state.calculatedCartList.push(payload);
  },
}

export const actions = {
 async setCartList({ commit }, payload) {
    commit('setCartList', await payload)
  }
}

export default {namespaced:true, state, getters, mutations, actions}