<template>
    <div>
        <div class="list-header">
            <h4>Marcas</h4>
            <b-button to="/brands/new" variant="success">Nova Marca</b-button>
        </div>
        <ApolloQuery :query="query">
            <template slot-scope="{ result: { loading, error, data } }">
                <span v-if="loading">Loading...</span>
                <span v-else-if="error">An error occured</span>

                <section v-if="data">
                    <b-table striped hover :items="data.brands" />
                </section>
            </template>
        </ApolloQuery>
    </div>
</template>

<script>
import BRANDS_ALL from "../graphql/BrandsAll.gql";

export default {
    name: "BrandsList",
    data() {
        return {
            query: BRANDS_ALL
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