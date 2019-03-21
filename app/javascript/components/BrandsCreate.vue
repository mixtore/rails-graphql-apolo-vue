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
    import BRANDS_ALL from '../graphql/BrandsAll.gql'
    import BRAND_CREATE from '../graphql/BrandsCreate.gql'

    export default {
        name: "BrandsCreate",
        data() {
            return {
                form: {
                    name: '',
                }
            }
        },
        methods: {
            onSubmit() {
                const name = this.form.name;

                this.$apollo
                    .mutate({
                        mutation: BRAND_CREATE,
                        variables: {
                            name
                        },
                        update: (cache, {data: {createBrand}}) => {
                            const {brands} = cache.readQuery({query: BRANDS_ALL});

                            cache.writeQuery({
                                query: BRANDS_ALL,
                                data: {
                                    brands: brands.concat(createBrand)
                                }
                            });
                        }
                    })
                    .then(data => {
                        this.$router.push('/brands');
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
            }
        }
    }
</script>

<style scoped>
    h4 {
        margin: 20px 0;
    }
</style>