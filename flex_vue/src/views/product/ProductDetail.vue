<template>
  <div class="container-body">
    <div class="row">
      <div class="col-6">
        <div class="detailImgbox">
          <img
            class="detailImg"
            :src="baseAddress + 'Public/Img/' + detailImg"
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
              v-for="(groupDetail, color) in productDetail.productGroup"
              :key="color"
              @click="updateSizeList(groupDetail)"
              :title="color"
              >{{ color }}
            </span>
          </div>
          <div class="mt-3 d-flex">
            <div
              class="sizeboxsetting"
              v-for="size in selectSizes"
              :key="size.productGroupId"
              :title="size.sizeName"
              :data-productGroupId="size.productGroupId"
            >
              {{ size.sizeName }}
            </div>
          </div>
          <div class="mt-3 d-flex mb-3">
            <div>預計尺寸跟最愛</div>
          </div>
          <hr />
          <div class="mt-3 mb-3 col-12">
            <div class="d-flex row">
              <div class="d-flex me-3 col-5">
                <span
                  class="col-3"
                  style="
                    display: flex;
                    align-items: center;
                    justify-content: center;
                  "
                  >數量:</span
                >
                <input
                  type="number"
                  name=""
                  id=""
                  min="1"
                  class="form-control"
                />
              </div>
              <div class="col-6">
                <button class="form-control">加入購物車</button>
              </div>
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
    const selectSizes = ref({});
    const detailImg = ref("");

    let getData = async () => {
      await axios
        .get(`${baseAddress}api/Products/Detail/${route.params.productId}`)
        .then((response) => {
          //console.log(response.data.productGroup);
          productDetail.value = response.data;
          const firstColor = Object.keys(productDetail.value.productGroup)[0];
          //console.log(firstColor);
          if (firstColor) {
            selectSizes.value = productDetail.value.productGroup[firstColor];
            detailImg.value = selectSizes.value[0].defaultColorImg;
            //console.log(selectSizes.value[0].defaultColorImg);
          }
        })
        .catch((error) => {
          alert(error);
        });
    };

    let updateSizeList = (sizes) => {
      selectSizes.value = sizes;
      detailImg.value = sizes[0].defaultColorImg;
    };

    onMounted(() => {
      getData();
    });

    return {
      productDetail,
      selectSizes,
      baseAddress,
      detailImg,
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
