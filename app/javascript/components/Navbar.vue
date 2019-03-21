<template>
    <div>
        <b-navbar toggleable="lg" type="dark" variant="info">
            <b-navbar-nav>
                <b-nav-item to="/products" active-class="active">Produtos</b-nav-item>
                <b-nav-item to="/brands" active-class="active">Marcas</b-nav-item>
            </b-navbar-nav>
        </b-navbar>
    </div>
</template>

<script>
    export default {
        name: "Navbar"
    }
</script>

<style scoped>
.navbar{
    background-color: #0D4872 !important;
}
</style>