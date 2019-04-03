<template>
    <div>
        <div class="page-header">
            <h4>Produtos</h4>
            <b-button to="/products/new" variant="success">Novo Produto</b-button>
        </div>
        <ApolloQuery :query="query">
            <template slot-scope="{ result: { loading, error, data } }">
                <span v-if="loading">Loading...</span>
                <span v-else-if="error">An error occured</span>

                <section v-if="data">
                    <b-table striped hover :fields="['id', 'name', 'price', 'brand']" :items="data.products">
                        <template slot="name" slot-scope="data">
                            <b-link :to="{ name: 'ProductsPage', params: { id: data.item.id } }">{{ data.item.name }}</b-link>
                        </template>

                        <template slot="brand" slot-scope="data">
                            <b-link :to="{ name: 'BrandsPage', params: { id: data.item.brand.id } }">{{ data.item.brand.name }}</b-link>
                        </template>
                    </b-table>
                </section>
            </template>
        </ApolloQuery>
    </div>
</template>

<script>
    import PRODUCTS_ALL from '../graphql/ProductsAll.gql'

    export default {
        name: "ProductsList",
        data() {
            return {
                query: PRODUCTS_ALL
            }
        },
        mounted() {
            // this.$store.dispatch('test/fetchBrands')
        }
    }
</script>

<style scoped>
.page-header{
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
}
</style>