export const state = () => ({
  isAuth: false,
  isAdmin: false,
  loginData: {},
  regData: {},
});

export const getters = {
  getAuth: (state) => {
    return state.isAuth;
  },
  getIsAdmin: state => {
    return state.isAdmin;
  }
};

export const mutations = {
  setAuth: (state, payload) => {
    state.isAuth = payload;
  },
  setIsAdmin: (state, payload) => {
    state.isAdmin = payload;
  }
};

export const actions = {
  updateActionValue({ commit }) {
    commit("updateValue");
  },
 async setAuth({commit}, payload) {
    commit("setAuth", await payload)
  }
};
export default { namespaced: true, getters, state, mutations, actions };
