<template>
  <navBar></navBar>
  <userBar></userBar>
  <div
    class="container likeProductCard"
    v-for="(product, index) in likeProducts"
    :key="index"
  >
    <div class="card mb-3 likeCard" v-if="product.isShow">
      <div class="row g-0">
        <div class="col-md-4">
          <!--商品完整路徑 <img
            src="https://localhost:7183/Public/Img/550af4ee0a2047d69bf578c0bbe63fa7.jpg"
          /> -->
          <img :src="baseAddress + 'Public/Img/' + product.firstImgPath" />
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title">
              {{ product.productName }}
            </h5>
            <p class="card-text">{{ product.unitPrice }}</p>
            <p class="card-text">{{ product.salesPrice }}</p>
            <div class="allBtn">
              <div class="likeBtn">
                <button
                  class=""
                  style="font-size: 20px"
                  @click="removeFavoriteProduct(product.productId, index)"
                >
                  <i class="bi bi-heart-fill" style="color: red"></i>
                  <label for="" v-if="likeProName">{{
                    product.productName
                  }}</label>
                </button>
              </div>
              <div>
                <button style="font-size: 20px">
                  <i class="bi bi-cart4"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import navBar from "@/components/home/navBar.vue";
import userBar from "@/components/user/userBar.vue";
import { ref, onMounted } from "vue";
import axios from "axios";
import Swal from "sweetalert2/dist/sweetalert2.js";

//const likeProductNames = ref([]);
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const likeProducts = ref([]);
const likeProName = ref(false);
const storedUser = localStorage.getItem("loggedInUser");
const userObject = JSON.parse(storedUser);
const Toast = Swal.mixin({
  toast: true,
  position: "bottom-end",
  showConfirmButton: false,
  timer: 3000,
  onOpen: (toast) => {
    toast.addEventListener("mouseenter", Swal.stopTimer);
    toast.addEventListener("mouseleave", Swal.resumeTimer);
  },
});
const getFavoritesProducts = async () => {
  //檢查本地儲存是否有登錄信息
  if (storedUser) {
    //呼叫api把喜愛商品Id取出來
    const getLikeProductUri = `${baseAddress}api/Users/GetFavorites?memberId=${userObject.memberId}`;
    await axios
      .get(getLikeProductUri)
      .then((res) => {
        likeProducts.value = res.data;
        //console.log('商品湯圓', likeProducts);
      })
      .catch((err) => {
        err;
      });
  }
};

const removeFavoriteProduct = (productId, index) => {
  const data = { MemberId: userObject.memberId, ProductId: productId };

  axios
    .delete(`${baseAddress}api/Users/DeleteFavorite`, { data: data })
    .then((response) => {
      Toast.fire({
        icon: "success",
        title: response.data,
      });
    })
    .catch((error) => {
      Toast.fire({
        icon: "success",
        title: response.data,
      });
    });
  likeProducts.value[index].isShow = false;
};

onMounted(() => {
  getFavoritesProducts();
});
</script>

<style scoped>
.likeProductCard {
  display: flex;
}
.likeCard {
  max-width: 540px;
}
.likeProduct {
  border: 1px solid;
  align-items: center;
  display: flex;
}
.detailImgList {
  width: 100%;
  height: auto;
  display: block;
}
.allBtn {
  display: flex;
}
.likeBtn {
  margin-right: 15px;
}
</style>
