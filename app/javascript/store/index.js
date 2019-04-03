import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex';

// Modules
import test from './test';

Vue.use(Vuex);

export default new Vuex.Store({
  strict: process.env.NODE_ENV !== 'production',
  modules: {
    test
  }
});