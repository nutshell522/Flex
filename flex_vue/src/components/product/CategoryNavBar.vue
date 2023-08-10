<template>
  <nav>
    <ul class="list-unstyled">
      <li
        v-for="(subCategories, categoryName) in categories"
        :key="categoryName"
        class="category"
      >
        <router-link :to="`/men?categoryName=${categoryName}`">{{
          categoryName
        }}</router-link>
        <!-- <router-link :to="'/men/' + categoryName">{{
          categoryName
        }}</router-link> -->
        <!-- <a :href="'/men/' + categoryName">{{ categoryName }}</a> -->
        <ul class="list-unstyled">
          <li
            class="subCategory"
            v-for="subCategoryName in subCategories"
            :key="subCategoryName"
          >
            <router-link
              :to="`/men?categoryName=${categoryName}&subCategoryName=${subCategoryName}`"
              >{{ subCategoryName }}</router-link
            >
            <!-- <router-link :to="'/men/' + categoryName + '/' + subCategoryName">{{
              subCategoryName
            }}</router-link> -->
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
  font-weight: bold;
}

.subCategory a {
  color: #83521e;
  text-decoration: none;
  outline: none;
  font-size: 15px;
  font-weight: 400;
}

ul li.subCategory {
  background-image: url("../../../public/LOGO/CategoryIcon.jpg");
  background-size: 13px 13px;
  background-repeat: no-repeat;
  padding-left: 20px;
  font-size: 15px;
  margin-bottom: 5px;
  line-height: 18px;
}
</style>
