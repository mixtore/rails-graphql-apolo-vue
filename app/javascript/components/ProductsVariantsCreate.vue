<template>
    <b-form-group
            label="Adicionar opção">
        <b-form-input
                type="text"
                v-model="form.name"
                class="mb-2"
                placeholder="Enter name"/>
        <b-form-input
                type="text"
                v-model="form.options"
                class="mb-2"
                placeholder="Enter options (comma separated)"/>
        <b-button class="mb-1" @click="addOption" variant="primary">Add</b-button>
    </b-form-group>
</template>

<script>
    export default {
        name: "ProductsVariantsCreate",
        data() {
            return {
                form: {
                    name: '',
                    options: ''
                }
            }
        },
        methods: {
            addOption() {
                const name = this.form.name;
                const options = this.form.options.split(',');

                this.$emit('addOption', { name, options });
                this.resetForm();
            },
            resetForm() {
                this.form.name = '';
                this.form.options = '';
            }
        }
    }
</script>

<style scoped>
input {
    width: 45%;
    display: inline-block;
}
</style>