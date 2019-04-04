<template>
    <div>
        <h4>Edit product</h4>
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
                <money v-model.lazy="form.price" class="form-control" required></money>
            </b-form-group>

            <BrandsSelector v-model="form.brandId"/>

            <b-form-group label="Opções de produto:">
                <b-card>
                    <b-table striped hover :items="variantOptions">
                        <template slot="options" slot-scope="data">
                            <Chips :items="data.item.options"/>
                        </template>
                    </b-table>

                    <ProductsVariantsCreate @addOption="addOption"/>

                    <b-table :items="form.variants">
                        <template slot="barcode" slot-scope="data">
                            <b-form-input type="text" v-model="data.item.barcode"></b-form-input>
                        </template>
                    </b-table>
                </b-card>
            </b-form-group>

            <b-button type="submit" variant="primary">Submit</b-button>
            <b-button type="reset" variant="danger">Reset</b-button>
        </b-form>
    </div>
</template>

<script>
    import PRODUCTS_ALL from '../graphql/ProductsAll.gql'
    import PRODUCTS_CREATE from '../graphql/ProductsCreate.gql'
    import PRODUCT_FIND from '../graphql/ProductFind.gql'
    import PRODUCT_UPDATE from '../graphql/ProductUpdate.gql'

    import BrandsSelector from './BrandsSelector'
    import ProductsVariantsCreate from './ProductsVariantsCreate'
    import Chips from './Chips'
    import gql from 'graphql-tag';

    import combos from 'combos';

    export default {
        name: "ProductsCreate",

        data() {
            return {
                form: {
                  name: '',
                  price: 0,
                  brandId: null,
                  variants: []
                },
                variantOptions: []
            }
        },

        components: {
            BrandsSelector,
            ProductsVariantsCreate,
            Chips
        },

        created() {
          this.resetVariants();
        },

        mounted() {
          const productId = parseInt(this.$route.params.id);

          this.$apollo.query({
            query: gql`
              query ProductFind($id: Int!) {
                product(id: $id) {
                  id
                  name
                  price,
                  brand {
                    id
                  }
                }
              }
            `,
            variables: {
              id: productId
            }
          })
          .then(res => {
            const { data = { product } } = res;

            this.form.name = data.product.name;
            this.form.price = data.product.price;
            this.form.brandId = data.product.brand.id;
          })
        },

        methods: {
            onSubmit() {
                const id = parseInt(this.$route.params.id);
                const name = this.form.name;
                const price = this.form.price;
                const brandId = parseInt(this.form.brandId);
                const variants = this.form.variants;

                this.$apollo.mutate({
                  mutation: PRODUCT_UPDATE,
                  variables: {
                    id,
                    name,
                    price,
                    brandId,
                    variants
                  }
                })
                .then(data => {
                    const { data: { updateProduct: { id } } } = data;
                    this.$router.push({ name: 'ProductsPage', params: { id } });
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
                const variants = [];
                const options = {};

                if (this.variantOptions.length < 1) return;

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