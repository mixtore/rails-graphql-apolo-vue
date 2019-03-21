<template>
    <ApolloQuery :query="queries.brands">
        <template slot-scope="{ result: { loading, error, data } }">
            <!-- Loading -->
            <div v-if="loading" class="loading apollo">Loading...</div>

            <!-- Result -->
            <b-form-group v-else-if="data" label="Marca:">
                <b-form-select :options="data.brands" value-field="id" text-field="name" required v-model="brandIdLocal">
                    <option :value="null">Please select a brand</option>
                </b-form-select>
            </b-form-group>

            <!-- No result -->
            <div v-else class="no-result apollo">No result :(</div>
        </template>
    </ApolloQuery>
</template>

<script>
    import BRANDS_All from "../graphql/BrandsAll.gql";

    export default {
        name: "BrandsSelector",
        props: ['brandId'],
        model: {
            prop: 'brandId',
            event: 'brandIdChange'
        },
        data() {
            return {
                queries: {
                    brands: BRANDS_All
                }
            }
        },
        computed: {
            brandIdLocal: {
                get: function() {
                    return this.brandId
                },
                set: function(value) {
                    this.$emit('brandIdChange', value)
                }
            }
        }
    }
</script>

<style scoped>

</style>