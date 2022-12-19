// import { getAllProducts } from "@/http/fetchProduct";
// import { clothesList } from "../mocks/mocks";
const searchedClothes = (state, arr) => {
  if (!state.search) {
    return arr;
  }

  return arr.filter(item => item.title.toLowerCase().includes(state.search.toLowerCase()));
}

const filteredClothes = (state, category, belong) => {
  if (!state.clothes) {
    return;
  }
  return searchedClothes(state, [...state.clothes].filter((item) => item.category.name === category && item.belongs === belong));
};
export const state = () => ({
  clothes: null,
  currentSort: "",
  search: '',
});

export const getters = {
  getterValue: (state) => {
    return state.value;
  },
  getClothes: (state) => {
    return state.clothes;
  },

  sortedClothes: (state) => (category, belong) => {
    if (state.currentSort === "По возрастанию") {
      return filteredClothes(state, category, belong).sort((a, b) => b.price - a.price);
    } else if (state.currentSort === "По убыванию") {
      return filteredClothes(state, category, belong).sort((a, b) => a.price - b.price);
    } else {
      return filteredClothes(state, category, belong);
    }
  },
};

export const mutations = {
  setSort: (state, sort) => {
    state.currentSort = sort;
  },
  setSearch: (state, payload) => {
    state.search = payload;
  },
  setClothesList: (state, payload) => {
    state.clothes = payload;
  },
  addItem: (state, dataItem) => {
    state.clothes.push({
      ...dataItem,
      img: dataItem.img,
    });
  },
  deleteItem: (state, item ) => {
    state.clothes = state.clothes.filter((elem) => elem.id !== item.id);
  },
  
  changeItem: (state, { item, changedItem }) => {
    const index = state.clothes.findIndex((elem) => elem.id === item.id);
    state.clothes = [
      ...state.clothes.slice(0, index),
      changedItem,
      ...state.clothes.slice(index + 1),
    ];
  },
};

export const actions = {
  updateActionValue({ commit }) {
    commit("updateValue");
  },
  setClothesList: async ({ commit }, payload) => {
    commit("setClothesList", await payload);
  },
  addItem: async ({ commit }, payload) => {
    commit("addItem", await payload);
  },
  deleteItem: async ({commit}, payload) => {
    commit('deleteItem', await payload)
  }
};
export default { namespaced: true, state, getters, mutations, actions };
