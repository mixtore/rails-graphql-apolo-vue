<template>
    <div>
        <h4>Novo produto</h4>
        <b-form @submit.prevent="onSubmit" @reset="onReset">

            <b-form-group
                    label="Nome:">
                <b-form-input
                        type="text"
                        v-model="form.name"
                        required
                        placeholder="Enter name"/>
            </b-form-group>

            <b-form-group
                    label="Preço:">
                <b-form-input
                        type="number"
                        v-model="form.price"
                        required
                        number
                        placeholder="Enter price"/>
            </b-form-group>


            <b-form-group label="Opções de produto:">
                <b-card>
                    <b-table striped hover :items="variantOptions"></b-table>

                    <ProductsVariantsCreate @addOption="addOption"/>

                    <b-table :items="form.variants">
                        <template slot="barcode" slot-scope="data">
                            <b-form-input type="text" v-model="data.item.barcode"></b-form-input>
                        </template>
                    </b-table>
                </b-card>
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
    import ProductsVariantsCreate from './ProductsVariantsCreate'

    import combos from 'combos';

    export default {
        name: "ProductsCreate",
        data() {
            return {
                form: {
                    name: 'lorem ipsum',
                    price: 123456,
                    brandId: 1,
                    variants: []
                },
                variantOptions: [
                    { name: 'Cor', options: [ 'azul', 'branco', 'preto' ]},
                    { name: 'Tamanho', options: [ 'P', 'M', 'G', 'GG' ]},
                ]
            }
        },
        components: {
            BrandsSelector,
            ProductsVariantsCreate
        },
        created() {
            this.resetVariants();
        },
        methods: {
            onSubmit() {
                const name = this.form.name;
                const price = this.form.price;
                const brandId = parseInt(this.form.brandId);
                const variants = this.form.variants;
                console.log(variants);

                this.$apollo
                    .mutate({
                        mutation: PRODUCTS_CREATE,
                        variables: {
                            name,
                            price,
                            brandId,
                            variants
                        },
                        update: (cache, {data: {createProduct}}) => {
                            // const { products } = cache.readQuery({ query: PRODUCTS_ALL });
                            //
                            // cache.writeQuery({
                            //     query: PRODUCTS_ALL,
                            //     data: {
                            //         products: products.concat(createProduct)
                            //     }
                            // });
                        }
                    })
                    .then(data => {
                        // this.$router.push('/products');
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
            },
            addOption(option) {
                this.variantOptions.push(option);
                this.resetVariants();
            },
            resetVariants() {
                console.log('resetting variants');
                const variants = [];
                const options = {};

                this.variantOptions.forEach(variant => {
                    options[variant.name] = variant.options
                });

                combos(options).forEach(permutation => {
                    variants.push({
                        name: Object.values(permutation).join(' / '),
                        option1: Object.keys(permutation)[0] || null,
                        option2: Object.keys(permutation)[1] || null,
                        option3: Object.keys(permutation)[2] || null,
                        barcode: null
                    });
                });
                this.form.variants = variants;
            }
        }
    }
</script>

<style scoped>
h4 {
    margin: 20px 0;
}
</style>