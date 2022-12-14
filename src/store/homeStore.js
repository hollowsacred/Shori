import { menList, womenList, bestOffers } from "../mocks/mocks";

const toChange = (state, list, item, changedItem) => {
  const index = state[list].findIndex((elem) => elem.id === item.id);
  state[list] = [
    ...state[list].slice(0, index),
    changedItem,
    ...state[list].slice(index + 1),
  ];
};

export const state = () => ({
  menList,
  womenList,
  bestOffers,
  maxId: bestOffers.length + 1,
});

export const getters = {
  getHomeBestOfferList: (state) => {
    return state.bestOffers;
  },
  getHomeMenList: (state) => {
    return state.menList;
  },
  getHomeWomenList: (state) => {
    return state.womenList;
  },
};

export const mutations = {
  updateValue: (state, payload) => {
    state.value = payload;
  },
  addItem: (state, { dataItem, type }) => {
    if (type === "best-offer") {
      state.maxId += 1;
      state.bestOffers.push({
        id: state.maxId,
        ...dataItem,
        img: require("../assets/placeholder.png"),
      });
    } else if (type === "men") {
      state.maxId += 1;
      state.menList.push({
        id: state.maxId,
        ...dataItem,
        img: require("../assets/placeholder.png"),
      });
    } else if (type === "women") {
      state.maxId += 1;
      state.womenList.push({
        id: state.maxId,
        ...dataItem,
        img: require("../assets/placeholder.png"),
      });
    }
  },
  deleteItem: (state, { item, type }) => {
    if (type === "best-offer") {
      state.bestOffers = state.bestOffers.filter((elem) => elem.id !== item.id);
    } else if (type === "men") {
      state.menList = state.menList.filter((elem) => elem.id !== item.id);
    } else if (type === "women") {
      state.womenList = state.womenList.filter((elem) => elem.id !== item.id);
    }
  },
  changeItem: (state, { item, changedItem, type }) => {
    if (type === "best-offer") {
      toChange(state, "bestOffers", item, changedItem);
    } else if (type === "men") {
      toChange(state, "menList", item, changedItem);
    } else if (type === "women") {
      toChange(state, "womenList", item, changedItem);
    }
  },
};

export const actions = {
  updateActionValue({ commit }) {
    commit("updateValue");
  },
};

export default {
  namespaced: true,
  actions,
  getters,
  mutations,
  state,
};
