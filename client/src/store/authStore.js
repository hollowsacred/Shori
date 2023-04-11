export const state = () => ({
  isAuth: false,
  isAdmin: false,
  isSuperAdmin: false,
  currentUser: {name:'guest', id:4},
  loginData: {},
  regData: {},
});

export const getters = {
  getAuth: (state) => {
    return state.isAuth;
  },
  getIsAdmin: state => {
    return state.isAdmin;
  },
  getIsSuperAdmin: state => {
    return state.isSuperAdmin;
  },
  getCurrentUser: state => {
    return state.currentUser;
  }
};

export const mutations = {
  setAuth: (state, payload) => {
    state.isAuth = payload;
  },
  setIsAdmin: (state, payload) => {
    state.isAdmin = payload;
  },
  setIsSuperAdmin: (state, payload) => {
    state.isSuperAdmin = payload;
  },
  setCurrentUser: (state, payload) => {
    state.currentUser = payload
  }
};

export const actions = {
  updateActionValue({ commit }) {
    commit("updateValue");
  },
 async setAuth({commit}, payload) {
    commit("setAuth", await payload)
  },

  async setCurrentUser({commit}, payload) {
    commit('currentUser',await payload)
  }
};
export default { namespaced: true, getters, state, mutations, actions };
