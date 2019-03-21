import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'

import Home from './components/Home'
import ProductsList from './components/ProductsList'
import ProductsCreate from './components/ProductsCreate'
import BrandsList from './components/BrandsList'
import BrandsCreate from './components/BrandsCreate'

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
            component: ProductsCreate
        },
        {
            path: '/brands',
            component: BrandsList
        },
        {
            path: '/brands/new',
            component: BrandsCreate
        }
    ]
})