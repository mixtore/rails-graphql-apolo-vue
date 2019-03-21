import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'

import Home from './components/Home'
import ProductsList from './components/ProductsList'
import ProductsForm from './components/ProductsForm'
import BrandsList from './components/BrandsList'

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: __dirname,
    routes: [
        {
            path: '/',
            component: Home
        },
        {
            path: '/products',
            component: ProductsList
        },
        {
            path: '/products/new',
            component: ProductsForm
        },
        {
            path: '/brands',
            component: BrandsList
        }
    ]
})