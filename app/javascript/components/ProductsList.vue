<template>
    <div>
        <div class="list-header">
            <h4>Produtos</h4>
            <b-button to="/products/new" variant="success">Novo Produto</b-button>
        </div>
        <ApolloQuery :query="query">
            <template slot-scope="{ result: { loading, error, data } }">
                <span v-if="loading">Loading...</span>
                <span v-else-if="error">An error occured</span>

                <section v-if="data">
                    <b-table striped hover :items="data.products" />
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
        }
    }
</script>

<style scoped>
.list-header{
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
}
</style>