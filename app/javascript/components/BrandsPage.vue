<template>
    <div>
        <ApolloQuery :query="queries.brandsFind" :variables="{ id }">
            <template slot-scope="{ result: { loading, error, data } }">
                <span v-if="loading">Loading...</span>
                <span v-else-if="error">An error occured</span>

                <div v-if="data">
                    <h4>{{ data.brand.name }}</h4>
                    <b-table striped hover :fields="['id', 'name', 'price']" :items="data.brand.products"></b-table>
                </div>
            </template>
        </ApolloQuery>
    </div>
</template>

<script>
    import BRANDS_FIND from '../graphql/BrandsFind.gql'

    export default {
        name: "BrandsPage",
        data() {
            return {
                queries: {
                    brandsFind: BRANDS_FIND
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