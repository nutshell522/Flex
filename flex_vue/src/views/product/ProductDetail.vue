<template>
  <div class="container-body">
    <div class="row">
      <div class="col-6">
        <div class="detailImgbox">
          <img
            class="detailImg"
            :src="
              baseAddress + 'Public/Img/0cac753e1aae4728a93d94044326304e.jpg'
            "
            :title="productDetail.productName"
          />
        </div>
      </div>
      <div class="col-6">
        <div class="row" style="min-height: 129px">
          <div class="col-7">{{ productDetail.productName }}</div>
          <div class="col-5">
            <div v-if="productDetail.unitPrice !== null">
              {{ productDetail.unitPrice }}
            </div>
            <div>{{ productDetail.salesPrice }}</div>
          </div>
        </div>
        <hr />
        <div class="row color-list">
          <div>
            <span
              class="colorBoxSetting"
              v-for="(sizes, color) in productDetail.colorAndSize"
              :key="color"
              >{{ color }}
            </span>
          </div>
          <!-- <div>
                <span
                  class="sizeboxsetting"
                  v-for="size in sizes"
                  :key="size"
                  >{{ size }}</span
                >
              </div> -->
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import axios from "axios";
import { computed, onMounted, ref } from "vue";
import { useRouter, useRoute } from "vue-router";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();
const productDetail = ref({});

let getData = async () => {
  await axios
    .get(`${baseAddress}api/Products/Detail/${route.params.prdouctId}`)
    .then((response) => {
      console.log(response.data.colorAndSize);
      productDetail.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};

onMounted(() => {
  getData();
});

// const x = computed(() => route.path);
</script>

<style>
.detailImgbox {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2px;
}
.detailImg {
  width: 490px;
  height: 520px;
}
.color-list {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.colorBoxSetting {
  padding: 0;
  margin-right: 15px;
  background-color: gainsboro;
  font-size: 30px;
  border: 1px solid black;
}

.sizeboxsetting {
  padding: 0;
  margin-right: 15px;
  background-color: gainsboro;
  font-size: 30px;
}
</style>
