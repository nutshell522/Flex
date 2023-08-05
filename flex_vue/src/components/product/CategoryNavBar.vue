<template>
  <nav>
    <ul class="list-unstyled">
      <li
        v-for="(subCategories, category) in categories"
        :key="category"
        class="category"
      >
        <a href="#">{{ category }}</a>
        <ul class="list-unstyled">
          <li
            class="subCategory"
            v-for="subCategory in subCategories"
            :key="subCategory"
          >
            <a href="#">{{ subCategory }}</a>
          </li>
        </ul>
      </li>
    </ul>
  </nav>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;

const categories = ref({});

let getCategory = async () => {
  await axios
    .post(`${baseAddress}api/Category/Men`)
    .then((response) => {
      categories.value = response.data.categories;
    })
    .catch((error) => {
      alert(error);
    });
};

onMounted(() => {
  getCategory();
});
</script>

<style>
.category a {
  color: #83521e;
  text-decoration: none;
  outline: none;
  font-size: 20px;
}

.subCategory a {
  color: #83521e;
  text-decoration: none;
  outline: none;
  font-size: 15px;
  margin-left: 10px;
}
</style>
