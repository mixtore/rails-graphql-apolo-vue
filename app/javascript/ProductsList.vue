<template>
    <div>
        <h4>Listagem de Produtos</h4>
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
import { GET_PRODUCTS } from "./queries.js";

export default {
    name: "ProductsList",
    data() {
        return {
            query: GET_PRODUCTS
        }
    }
}
</script>

<style scoped>
h4{
    margin: 20px 0;
}
</style>