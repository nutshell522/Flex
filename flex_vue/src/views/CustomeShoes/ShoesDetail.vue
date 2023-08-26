<template>
  <ShoesnavBar></ShoesnavBar>
<div class="container mt-4">
  <div class="container-body d-flex">
    <div class="row">
      <div class="col-3 detailbox">
        <div class="nav-category">
          <ShoesCategoryBar style="position: relative"></ShoesCategoryBar>
        </div>
      </div>
      <div class="col-5 pe-3 detailbox">
        <div class="detailImgbox">
          <img
            class="detailImg"
            :src="baseAddress + 'Public/Img/' + shoesDetail.shoesImgs"
            :title="shoesDetail.shoesName"
          />
        </div>
      </div>
      <div class="col-4 detailbox">
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
          </div>
        </div>
        <hr />
        <div class="row color-list">
            <div class="d-flex align-items-center">
                <div>
                  <span class="colorBoxSetting" :title="shoesDetail.colorName">
                    {{ shoesDetail.colorName }}
                  </span>
                </div>
                <div class="text-center">
                  <button
                    type="button"
                    class="form-control btn sizeTableBtn"
                    style="font-size: 20px"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  >
                    尺寸表
                  </button>
                </div>
              </div>
            <div
              class="modal fade"
              id="exampleModal"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">
                      尺寸表
                    </h1>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body modal-dialog modal-dialog-scrollable">
                    <img src="/public/imgs/成人鞋子尺寸表.jpg" />
                    <p>※ 本尺寸表會因商品素材不同，可能與實際尺寸略有誤差。</p>
                    <p>※ 尺寸表為商品平放測量，以公分(cm)為單位。</p>
                    <img src="/public/imgs/鞋子說明表.jpg" />
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button"
                      class="btn btn-secondary"
                      data-bs-dismiss="modal"
                    >
                      關閉
                    </button>
                  </div>
                </div>
              </div>
            </div>
          <div class="mt-3 mb-3">
            <div class="d-flex row">
                <div class="col-6 ms-6">
                  <router-link
                  :to="'/CustomeShoes' + '/detail/'+ 'Customization/' + shoesProductId"
                  :disabled="isButtonDisabled"             
                >
                  <button
                    type="submit"
                    class="btn btn-primary comenextBtn"
                  >
                    進入客製化頁面
                  </button>
                </router-link>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <ul
        class="nav nav-tabs d-flex"
        style="align-items: center; justify-content: center"
        id="myTab"
        role="tablist"
      >
        <li class="nav-item" role="presentation">
          <button
            class="nav-link active"
            id="home-tab"
            data-bs-toggle="tab"
            data-bs-target="#home-tab-pane"
            type="button"
            role="tab"
            aria-controls="home-tab-pane"
            aria-selected="true"
          >
            商品資訊
          </button>
        </li>
      </ul>
      <div class="tab-content mt-3" id="myTabContent">
        <div
          class="tab-pane fade show active commentDiv"
          id="home-tab-pane"
          role="tabpanel"
          aria-labelledby="home-tab"
          tabindex="0"
        >
          <div style="width: 95%; position: relative" class="p-3">
            <h1 style="display: inline">商品資訊</h1>
            <span style="right: 0%; position: absolute; font-size: 30px"
              ><i
                class="bi bi-plus-lg"
                v-if="!showDetailDiv"
                @click="showDetailDiv = !showDetailDiv"
              ></i
              ><i
                class="bi bi-dash-lg"
                v-else
                @click="showDetailDiv = !showDetailDiv"
              ></i
            ></span>
            <div class="mt-3 ms-3" v-if="showDetailDiv">
              <div>產地:{{ shoesDetail.shoesOrigin }}</div>
              <div>類別:{{ shoesDetail.shoesCategoryName }}</div>
              <div>描述:{{ shoesDetail.shoesDescription }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row mt-3">
    <div class="col-12">
      <div class="detailImgboxs">
        <img
          v-for="datas in shoesImgs"
          :key="datas.shoesPicture_Id"
          :src="baseAddress + 'Public/Img/' + datas.shoesPictureUrl"
          class="detailImgList"
        />
      </div>
    </div>
  </div>
</div>
  <homeFooter></homeFooter>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref, computed } from "vue";
import ShoesCategoryBar from "@/components/customeShoes/ShoesCategoryBar.vue";
import { useRoute } from "vue-router";
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();
const shoesDetail = ref({});
const detailImg = ref("");
const showDetailDiv = ref(true);
const shoesImgs = ref([]);
const errors = ref([]);
const shoesProductId = route.params.shoesProductId;

//抓api資料
let getData = async () => {
  try {
    const response = await axios.get(
      `${baseAddress}api/CustomeShoes/shoes/Detail/${route.params.shoesProductId}`
    );
    console.log(response.data);
    shoesDetail.value = response.data;
    detailImg.value = shoesDetail.value.shoesImgs;
  } catch (error) {
    alert(error);
  }
};

//抓api資料(圖片)
let getImgs = async () => {
  await axios
    .get(`${baseAddress}api/CustomeShoes/Imgs/${route.params.shoesProductId}`)
    .then((response) => {
      //console.log(response.data);
      shoesImgs.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};


//啟用方法
onMounted(() => {
  getData();
  getImgs();
});

</script>

<style>

.detailImgbox {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2px;
}

.detailImgbox img {
  max-width: 100%;
  height: auto;
}

.detailImg {
  width: 400px;
  height: 430px;
}
.color-list {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.detailbox{
  height:350px;

}

.detailImgboxs {
  margin-top: 20px; /* 调整此值以适应需求 */
  width: 50%;
  height: 0;
  padding-bottom: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap; /* 换行排列 */
}

.detailImgList {
  margin-bottom: 20px;
  width: 80%;
  height: auto;
  display: block;
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
  font-size: 20px;
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
  font-weight: 500;
}

.NTbox {
  font-size: 15px;
  color: red;
  margin-right: 10px;
  margin-top: 10px;
  align-self: flex-start;
  font-weight: 700;
}

.increaseAndDecrease {
  background-color: gainsboro;
}


.commentDiv {
  align-items: center;
  justify-content: center;
  border: 1px solid rgb(185, 184, 184);
  border-radius: 10px;
}

/* 调整左侧栏宽度和间距 */
.col-3 {
  width: 25%;
  padding-right: 15px;
}

/* 调整右侧栏宽度和间距 */
.col-9 {
  width: 75%;
  padding-left: 15px;
}

/* 确保左侧栏高度和右侧栏一致 */
.container-body {
  align-items: flex-start; /* 顶部对齐 */
}
</style>
