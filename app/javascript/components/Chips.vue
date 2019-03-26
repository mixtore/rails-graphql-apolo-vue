<template>
    <div>
        <b-button v-for="item in items" class="mr-1" size="sm">{{ item }}</b-button>
    </div>
</template>

<script>
    export default {
        name: "Chips",
        props: ['items']
    }
</script>

<style scoped>

</style>