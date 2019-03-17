<template>
  <div id="nav">
      <Navbar />
      <b-container>
          <b-row>
              <b-col>
                <ProductsList />
              </b-col>
          </b-row>
      </b-container>
  </div>
</template>

<script>
import Navbar from './Navbar'
import ProductsList from './ProductsList'

export default {
    data: function () {
        return {
            message: "Hello Vue!!!"
        }
    },
    components: {
        Navbar,
        ProductsList
    }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
