// Apollo
import graphqlClient from '../utils/graphql';
import gql from 'graphql-tag';

export default {
  namespaced: true,
  state: {
    products: null,
    brands: null
  },

  getters: {
    getBrands: state => state.brands,
  },

  actions: {
    fetchBrands({ commit }, data) {
      graphqlClient.query({
        query: gql`
          query Brands {
            brands {
              id
              name
              products {
                id
                name
                price
              }
            }
          }
        `
      }).then(res => {
        const { data } = res;

        const products = data.brands.map(item => item.products);
        commit('setProducts', products);
        commit('setBrands', data.brands);
      })
    }
  },

  mutations: {
    setProducts(state, payload) {
      state.products = payload;
    },

    setBrands(state, payload) {
      state.brands = payload;
    },
  }
}