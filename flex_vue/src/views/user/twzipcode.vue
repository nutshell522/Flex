<template>
  <twzipcode-county text-template=":zipcode :county-:city"></twzipcode-county>

  <select id="twzipcode__zipcode" class="twzipcode twzipcode__zipcode">
    <option value="100">100 臺北市-中正區</option>
    <option value="103">103 臺北市-大同區</option>
  </select>
</template>

<script setup>
import Vue from 'vue';
import { Zipcodes } from 'twzipcode-vue';
// import Zipcode from 'twzipcode-vue/Zipcodes';

new Vue({
  el: '#app',
  components: {
    TwzipcodeZipcode: Zipcodes,
  },
});
</script>

<style></style>
