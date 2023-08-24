<template>
  <aside class="side-bar">
    <ul class="list-unstyled">
      <li
        v-for="shoescategory in shoescategories"
        :key="shoescategory"
        class="shoescategory mt-2"
      >
      <router-link :to="`/CustomeShoes?shoesCategoryId=${shoescategory.shoesCategoryId}`">
      {{
          shoescategory.shoesCategoryName
        }}
        </router-link>
        <!-- <a :href="'/men/' + categoryName">{{ categoryName }}</a> -->
      </li>
    </ul>
  </aside>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";
import { useRoute, useRouter } from "vue-router";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();
const router = useRouter();
const shoescategories = ref({});

let getshoesCategory = async () => {
  await axios
    .get(`${baseAddress}api/ShoesCategory/CategoryList`)
    .then((response) => {
     shoescategories.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};



onMounted(() => {
  getshoesCategory();
});
</script>

<style>
.side-bar {
  position: fixed;
  left: 0;
  top: 0;
  height: 100vh;
  width: 200px;
}
.shoescategory a {
  color: #83521e;
  text-decoration: none;
  outline: none;
  font-size: 20px;
  font-weight: bold;
}
</style>
