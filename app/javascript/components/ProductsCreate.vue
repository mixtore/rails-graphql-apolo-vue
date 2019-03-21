<template>
    <div>
        <h4>Novo produto</h4>
        <b-form @submit.prevent="onSubmit" @reset="onReset">

            <b-form-group
                    label="Nome:"
                    label-for="exampleInput2">
                <b-form-input
                        type="text"
                        v-model="form.name"
                        required
                        placeholder="Enter name"/>
            </b-form-group>

            <b-form-group
                    label="Preço:"
                    label-for="exampleInput1">
                <b-form-input
                        type="number"
                        v-model="form.price"
                        required
                        number
                        placeholder="Enter price"/>
            </b-form-group>

            <BrandsSelector v-model="form.brandId"/>

            <b-button type="submit" variant="primary">Submit</b-button>
            <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
    </div>
</template>

<script>
    import PRODUCTS_ALL from '../graphql/ProductsAll.gql'
    import PRODUCTS_CREATE from '../graphql/ProductsCreate.gql'

    import BrandsSelector from './BrandsSelector'

    export default {
        name: "ProductsCreate",
        data() {
            return {
                form: {
                    name: '',
                    price: '',
                    brandId: null
                }
            }
        },
        components: {
            BrandsSelector
        },
        methods: {
            onSubmit() {
                const name = this.form.name;
                const price = this.form.price;
                const brandId = parseInt(this.form.brandId);

                this.$apollo
                    .mutate({
                        mutation: PRODUCTS_CREATE,
                        variables: {
                            name,
                            price,
                            brandId
                        },
                        update: (cache, {data: {createProduct}}) => {
                            const {products} = cache.readQuery({query: PRODUCTS_ALL});

                            cache.writeQuery({
                                query: PRODUCTS_ALL,
                                data: {
                                    products: products.concat(createProduct)
                                }
                            });
                        }
                    })
                    .then(data => {
                        this.$router.push('/products');
                        console.log(data);
                    })
                    .catch(error => {
                        console.error(error);
                        this.person = name;
                        this.error = `There has been a problem adding ${name} :(`;
                    });
            },
            onReset(evt) {
                evt.preventDefault();
                this.form.name = '';
                this.form.price = '';
                this.form.brandId = null;
            }
        }
    }
</script>

<style scoped>
    h4 {
        margin: 20px 0;
    }
</style>