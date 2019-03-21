import Vue from 'vue/dist/vue.esm'
import Router from 'vue-router'

import Home from './components/Home'
import ProductsList from './components/ProductsList'
import ProductsCreate from './components/ProductsCreate'
import BrandsList from './components/BrandsList'
import BrandsCreate from './components/BrandsCreate'
import BrandsPage from './components/BrandsPage'

Vue.use(Router);

export default new Router({
    mode: 'history',
    base: __dirname,
    routes: [
        {
            name: 'Home',
            path: '/',
            component: Home
        },
        {
            name: 'ProductsList',
            path: '/products',
            component: ProductsList
        },
        {
            name: 'ProductsCreate',
            path: '/products/new',
            component: ProductsCreate
        },
        {
            name: 'BrandsList',
            path: '/brands',
            component: BrandsList
        },
        {
            name: 'BrandsCreate',
            path: '/brands/new',
            component: BrandsCreate
        },
        {
            name: 'BrandsPage',
            path: '/brands/:id',
            component: BrandsPage
        }
    ]
})