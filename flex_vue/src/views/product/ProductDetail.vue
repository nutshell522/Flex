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
          <div class="col-7 detailTitle" :title="productDetail.productName">
            {{ productDetail.productName }}
          </div>
          <div class="col-5">
            <div
              v-if="productDetail.unitPrice !== null"
              :title="productDetail.unitPrice"
              class="text-decoration-line-through detailUnitPrice text-right"
            >
              {{ productDetail.unitPrice }}
            </div>
            <div class="detailSalesPriceBox">
              <div class="NTbox">NT$</div>
              <div class="detailSalesPrice" :title="productDetail.salesPrice">
                {{ productDetail.salesPrice }}
              </div>
            </div>
          </div>
        </div>
        <hr />
        <div class="row color-list">
          <div>
            <span
              class="colorBoxSetting"
              v-for="(sizes, color) in productDetail.colorAndSize"
              :key="color"
              @click="updateSizeList(sizes)"
              :title="color"
              >{{ color }}
            </span>
          </div>
          <div class="mt-3 d-flex">
            <div
              class="sizeboxsetting"
              v-for="size in selectSizes"
              :key="size"
              :title="size"
            >
              {{ size }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { computed, onMounted, ref } from "vue";
import { useRouter, useRoute } from "vue-router";

export default {
  setup() {
    const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
    const route = useRoute();
    const productDetail = ref({});
    const selectSizes = ref([]);

    let getData = async () => {
      await axios
        .get(`${baseAddress}api/Products/Detail/${route.params.prdouctId}`)
        .then((response) => {
          //console.log(response.data.colorAndSize);
          productDetail.value = response.data;
          const firstColor = Object.keys(productDetail.value.colorAndSize)[0];
          if (firstColor) {
            selectSizes.value = productDetail.value.colorAndSize[firstColor];
          }
        })
        .catch((error) => {
          alert(error);
        });
    };

    let updateSizeList = (sizes) => {
      selectSizes.value = sizes;
    };

    onMounted(() => {
      getData();
    });

    return {
      productDetail,
      selectSizes,
      baseAddress,
      updateSizeList,
    };
  },
};
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
  background-color: rgb(222, 222, 222);
  font-size: 30px;
  border-radius: 10px;
}

.sizeboxsetting {
  width: 60px;
  height: 35px;
  padding: 0;
  margin-right: 15px;
  background-color: gainsboro;
  font-size: 20px;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}

.detailTitle {
  font-size: 15px;
  color: #706e6c;
}

.detailUnitPrice {
  font-size: 20px;
  font-weight: 600;
}

.detailSalesPriceBox {
  position: relative;
  display: flex;
  align-items: flex-start;
  justify-content: flex-end;
}

.detailSalesPrice {
  color: red;
  font-size: 60px;
  font-weight: 700;
}

.NTbox {
  font-size: 15px;
  color: red;
  margin-right: 10px;
  margin-top: 10px;
  align-self: flex-start;
  font-weight: 700;
}
</style>
