export const state = () => ({
  cartList: null,
  calculatedCartList: [],
});

export const getters = {
  getCartList: (state) => {
    return state.cartList;
  },

  getCalculatedCartList: (state) => {
    return state.calculatedCartList;
  },

  getCalculatedPrices: (state) => {
    let totalCost = 0;
    let discount = 0;
    state.calculatedCartList.forEach((item) => (totalCost += item.price));
    state.calculatedCartList.forEach(
      (item) => (discount += item.oldPrice - item.price)
    );
    return { totalCost, discount };
  },

  getFilteredCartList: (state) => (id) => {
    if (!state.cartList) return;
    return state.cartList.filter((item) => item.basketId === id);
  },
};

export const mutations = {
  setCartList: (state, payload) => {
    state.cartList = payload;
  },



  addItemCartList: (state, payload) => {
    const cartItem = state.cartList?.find((item) => item.id === payload.id);
    const index = state.cartList?.findIndex((item) => item.id === payload.id);
    console.log(cartItem);
    console.log(index);
    
    if (!state.cartList) {
      state.cartList = [];
      return state.cartList.push(payload);
    }

    if (index !== -1) {
      cartItem.count++;
      return (state.cartList[index] = cartItem);
    }

    return state.cartList.push(payload);
  },

  deleteItemFromCart: (state, {productId, userId} ) => {
    state.cartList = state.cartList.filter((elem) => elem.basketId == userId && elem.product.id !== productId);
  },

  clearCalculatedCartList: (state) => {
    state.calculatedCartList = [];
  },
  setCalculatedCartList: (state, payload) => {
    state.calculatedCartList.push(payload);
  },
};

export const actions = {
  async setCartList({ commit }, payload) {
    commit("setCartList", await payload);
  },
};

export default { namespaced: true, state, getters, mutations, actions };
