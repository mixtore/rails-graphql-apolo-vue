<template>
  <div id="nav">
      <Navbar />
      <b-container>
          <b-row>
              <b-col>
                  <router-view/>
              </b-col>
          </b-row>
      </b-container>
  </div>
</template>

<script>
import Navbar from './components/Navbar'

export default {
    data: function () {
        return {
            message: "Hello Vue!!!"
        }
    },
    components: {
        Navbar
    }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
