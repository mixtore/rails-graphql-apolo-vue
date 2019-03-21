<template>
    <div>
        <h4>Nova marca</h4>
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

            <b-button type="submit" variant="primary">Submit</b-button>
            <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
    </div>
</template>

<script>
    import PRODUCTS_ALL from '../graphql/ProductsAll.gql'
    import PRODUCT_CREATE from '../graphql/ProductsCreate.gql'

    export default {
        name: "BrandsCreate",
        data() {
            return {
                form: {
                    name: '',
                },
                show: true
            }
        }
        methods: {
            onSubmit() {
                const name = this.form.name;
                const price = this.form.price;
                const brandId = parseInt(this.form.brandId);

                this.$apollo
                    .mutate({
                        mutation: PRODUCT_CREATE,
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

                this.show = false;
                this.$nextTick(() => {
                    this.show = true
                })
            }
        }
    }
</script>

<style scoped>
    h4 {
        margin: 20px 0;
    }
</style>