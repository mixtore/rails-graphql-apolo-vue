/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import 'style/application.scss'

import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import money from 'v-money'
import ApolloClient from 'apollo-boost'
import VueApollo from 'vue-apollo'

import { sync } from 'vuex-router-sync';
import App from '../App.vue'
import router from '../router'
import store from '../store/index';

const apolloClient = new ApolloClient({
  uri: 'http://localhost:3000/graphql'
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
});

// sync store with router
sync(store, router);

Vue.use(VueApollo);
Vue.use(BootstrapVue);
Vue.use(money, {
  precision: 2,
  decimal: ',',
  thousands: '.',
  prefix: 'R$ '
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#hello',
    store,
    apolloProvider,
    router,
    components: { App }
  })
});