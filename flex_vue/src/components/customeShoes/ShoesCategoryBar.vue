<template>
    <aside class="side-bar">
      <ul class="list-unstyled">
        <li
          v-for="shoescategory in shoescategories"
          :key="shoescategory.shoesCategoryId"
          class="shoescategory"
        >
          <!-- <router-link :to="`/men?categoryName=${categoryName}`">{{
            categoryName
          }}</router-link> -->
          <router-link :to="'/customeshoes?id=' + shoescategory.shoesCategoryId">{{
            shoescategory.shoesCategoryName
          }}</router-link>
          <!-- <a :href="'/men/' + categoryName">{{ categoryName }}</a> -->       
        </li>
      </ul>
    </aside>
  </template>
  
  <script setup>
  import axios from "axios";
  import { onMounted, ref } from "vue";
  
  const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
  
  const shoescategories = ref({});
  
  let getshoesCategory = async () => {
    await axios
      .get(`${baseAddress}api/ShoesCategory`)
      .then((response) => {  
        shoescategories.value = response.data;
        console.log(response.data);
      })
      .catch((error) => {
        alert("此分類尚未有商品上架");
      });
  };
  
  onMounted(() => {
    getshoesCategory();
  });
  </script>
  
  <style>
  .side-bar{
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