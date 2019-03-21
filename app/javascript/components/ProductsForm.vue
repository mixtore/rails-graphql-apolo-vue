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
                        placeholder="Enter name" />
            </b-form-group>

            <b-form-group
                    label="Preço:"
                    label-for="exampleInput1"
            >
                <b-form-input
                        type="number"
                        v-model="form.price"
                        required
                        number
                        placeholder="Enter price" />
            </b-form-group>

            <b-form-group label="Marca:" label-for="exampleInput3">
                <b-form-select :options="brandIds" required v-model="form.brandId" />
            </b-form-group>

            <b-button type="submit" variant="primary">Submit</b-button>
            <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
    </div>
</template>

<script>
import { GET_PRODUCTS, CREATE_PRODUCT } from '../queries'

export default {
    name: "ProductsForm",
    data() {
        return {
            form: {
                name: '',
                price: '',
                brandId: null
            },
            brandIds: [
                { value: 1, text: 'Option A (from options prop)' },
                { value: 2, text: 'Option B (from options prop)' }
            ],
            show: true
        }
    },
    methods: {
        onSubmit() {
            const name = this.form.name;
            const price = this.form.price;
            const brandId = this.form.brandId;

            this.$apollo
                .mutate({
                    mutation: CREATE_PRODUCT,
                    variables: {
                        name,
                        price,
                        brandId
                    },
                    update: (cache, { data: { createProduct } }) => {
                        const { products } = cache.readQuery({ query: GET_PRODUCTS });

                        cache.writeQuery({
                            query: GET_PRODUCTS,
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
h4{
    margin: 20px 0;
}
</style>