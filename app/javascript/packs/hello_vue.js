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
import ApolloClient from 'apollo-boost'
import VueApollo from 'vue-apollo'
import App from '../App.vue'

const apolloClient = new ApolloClient({
  // You should use an absolute URL here
  uri: 'http://localhost:3000/graphql'
});

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
});

Vue.use(VueApollo);
Vue.use(BootstrapVue);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#hello',
    data: {
      message: "Can you say hello?"
    },
    apolloProvider,
    components: { App }
  })
});