<template>
    <div>
        <ApolloQuery :query="queries.productsFind" :variables="{ id }">
            <template slot-scope="{ result: { loading, error, data } }">
                <span v-if="loading">Loading...</span>
                <span v-else-if="error">An error occured</span>

                <div v-if="data">
                    <h4>{{ data.product.name }}</h4>
                    <h5>R$ {{ data.product.price }}</h5>
                    <h5>Brand: {{ data.product.brand.name }}</h5>
                    <h5>Variants:</h5>
                    <b-table striped hover :items="data.product.variants"></b-table>
                </div>
            </template>
        </ApolloQuery>
        <b-link :to="{ name: 'ProductEdit', params: { id: id } }"> Edit this product </b-link>
    </div>
</template>

<script>
    import PRODUCTS_FIND from '../graphql/ProductsFind.gql'

    export default {
        name: "BrandsPage",
        data() {
          return {
            queries: {
                productsFind: PRODUCTS_FIND
            },
            id: parseInt(this.$route.params['id'])
          }
        }
    }
</script>

<style scoped>
    h4 {
        margin: 20px 0;
    }
</style>