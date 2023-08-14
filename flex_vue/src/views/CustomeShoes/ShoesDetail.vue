<template>
    <ShoesnavBar></ShoesnavBar>
    <div class="container-body">
      <div class="row">
        <div class="col-6">
          <div class="detailImgbox">
            <img
              class="detailImg"
              :src="baseAddress + 'Public/Img/' + shoesDetail.shoesImgs"
              :title="shoesDetail.shoesName"
            />
          </div>
        </div>
        <div class="col-6">
          <div class="row" style="min-height: 129px">
            <div class="col-7 detailTitle" :title="shoesDetail.shoesName">
              {{ shoesDetail.shoesName }}
            </div>
            <div class="col-5">           
              <div class="detailSalesPriceBox">
                <div class="NTbox">NT$</div>
                <div class="detailSalesPrice" :title="shoesDetail.shoesUnitPrice">
                    {{ shoesDetail.shoesUnitPrice }}
                </div>
              </div>
              <div class="detailshoesDescription" :title="shoesDetail.shoesDescription">
                    {{ shoesDetail.shoesDescription }}
                </div>
                <div class="detailshoesDescription" :title="shoesDetail.shoesOrigin">
                    {{ shoesDetail.shoesOrigin }}
                </div>
                <div class="detailshoesDescription" :title="shoesDetail.shoesCategoryName">
                    {{ shoesDetail.shoesCategoryName }}
                </div>
            </div>
          </div>
          <hr />
          <div class="row color-list">
            <div>
              <span
                class="colorBoxSetting"
                :title="colorName"
                >{{ shoesDetail.colorName }}
              </span>
            </div>
            <div class="mt-3 d-flex">
              <div
                class="sizeboxsetting"
                v-for="size in selectSizes"
                :key="size.sizeId"
                :title="size.sizeName"                
              >
                {{ size.sizeName }}
              </div>
            </div>
            <div class="mt-3 d-flex mb-3">
              <div></div>
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
                  <button class="form-control">進入客製化頁面</button>
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
//import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
export default {
  setup() {
    
    const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
    const route = useRoute();
    const shoesDetail = ref({});
    const selectSizes = ref({});
    const detailImg = ref("");

    let getData = async () => {
      await axios
        .get(`${baseAddress}api/CustomeShoes/shoes/Detail/${route.params.shoesProductId}`)
        .then((response) => {
          console.log(response.data);
          shoesDetail.value = response.data;
             //Color.value = shoesDetail.value.colorName;
             selectSizes.value = shoesDetail.value.shoesSize;
             detailImg.value = shoesDetail.value[0].shoesImgs;
            //console.log(selectSizes.value[0].defaultColorImg);
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
      shoesDetail,
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