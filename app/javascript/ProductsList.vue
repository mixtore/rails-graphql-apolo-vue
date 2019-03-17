<template>
    <div>
        <b-container>
            <b-row>
                <b-col>
                    <h4>Listagem de Produtos</h4>
                    <b-table striped hover :items="items" />
                </b-col>
            </b-row>
        </b-container>
    </div>
</template>

<script>
    export default {
        name: "ProductsList",
        data() {
            return {
                items: [
                    { isActive: true, age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
                    { isActive: false, age: 21, first_name: 'Larsen', last_name: 'Shaw' },
                    { isActive: false, age: 89, first_name: 'Geneva', last_name: 'Wilson' },
                    { isActive: true, age: 38, first_name: 'Jami', last_name: 'Carney' }
                ]
            }
        }
    }
</script>

<style scoped>
h4{
    margin: 20px 0;
}
</style>