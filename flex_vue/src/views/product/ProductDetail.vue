<template>
  <div class="container-body">
    <div class="row">
      <div class="col-6 pe-3">
        <div class="detailImgbox">
          <img
            class="detailImg"
            :src="baseAddress + 'Public/Img/' + detailImg"
            :title="productDetail.productName"
          />
        </div>
      </div>
      <div class="col-6 ps-5">
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
          <div class="">
            <a
              href="#"
              v-for="(groupDetail, color, index) in productDetail.productGroup"
              :class="{
                colorBoxSetting: true,
                colorActive: colorActiveindex === index,
              }"
              :key="color"
              @click="updateSizeList(groupDetail, index)"
              :title="color"
              >{{ color }}
            </a>
          </div>
          <div class="size-height">
            <div
              v-for="(size, index) in selectSizes"
              :class="{
                sizeboxsetting: true,
                sizeActive: sizeActiveIndex === index,
              }"
              :key="size.productGroupId"
              :title="size.sizeName"
              :data-productGroupId="size.productGroupId"
              @click="changeSize(index)"
            >
              {{ size.sizeName }}
            </div>
          </div>
          <div class="mt-3 d-flex mb-3">
            <div>預計尺寸跟最愛</div>
          </div>
          <hr />
          <div class="mt-3 mb-3 col-12 buy-height">
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
                <button
                  @click="decrementProductQty()"
                  class="increaseAndDecrease"
                >
                  <i class="bi bi-dash-lg"></i>
                </button>
                <input
                  type="text"
                  name="productQty"
                  id="productQty"
                  class="form-control text-center"
                  style="border-radius: 0"
                  v-model="buyQty"
                  @input="handleQyt"
                  maxlength="2"
                />
                <button
                  @click="incrementProductQty()"
                  class="increaseAndDecrease"
                >
                  <i class="bi bi-plus-lg"></i>
                </button>
              </div>
              <div class="col-6">
                <button class="form-control">加入購物車</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row mt-5">
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
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              id="profile-tab"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              type="button"
              role="tab"
              aria-controls="profile-tab-pane"
              aria-selected="false"
            >
              商品評價
            </button>
          </li>
        </ul>
        <div class="tab-content mt-3" id="myTabContent">
          <div
            class="tab-pane fade show active"
            id="home-tab-pane"
            role="tabpanel"
            aria-labelledby="home-tab"
            tabindex="0"
            style="
              align-items: center;
              justify-content: center;
              border: 1px solid black;
            "
          >
            <div style="width: 80%" class="p-3">
              <div>產地:{{ productDetail.productOrigin }}</div>
              <div>材質:{{ productDetail.productMaterial }}</div>
              <div>描述:{{ productDetail.productDescription }}</div>
            </div>
          </div>
          <div
            class="tab-pane fade"
            id="profile-tab-pane"
            role="tabpanel"
            aria-labelledby="profile-tab"
            tabindex="0"
            style="
              align-items: center;
              justify-content: center;
              border: 1px solid black;
            "
          >
            <div style="width: 80%" class="p-3">
              <div>評論跑V-for</div>
              <div>評論跑</div>
              <div>我好累</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-12">
        <div class="detailImgboxs">
          <img
            v-for="datas in productImgs"
            :key="datas.productImgId"
            :src="baseAddress + 'Public/Img/' + datas.imgPath"
            class="detailImgList"
          />
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
    const colorActiveindex = ref(0);
    const sizeActiveIndex = ref(0);
    const buyQty = ref(1);
    const productImgs = ref([]);

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

    let getImgs = async () => {
      await axios
        .get(`${baseAddress}api/Products/Imgs/${route.params.productId}`)
        .then((response) => {
          console.log(response.data);
          productImgs.value = response.data;
        })
        .catch((error) => {
          alert(error);
        });
    };

    let updateSizeList = (sizesDto, index) => {
      colorActiveindex.value = index;
      selectSizes.value = sizesDto;
      detailImg.value = sizesDto[0].defaultColorImg;
    };

    let changeSize = (index) => {
      sizeActiveIndex.value = index;
    };

    let handleQyt = (event) => {
      buyQty.value = event.target.value.replace(/\D/g, "");
      if (buyQty.value <= 1) {
        buyQty.value = 1;
      }
    };

    let decrementProductQty = () => {
      if (buyQty.value <= 1) {
        buyQty.value = 1;
      } else {
        buyQty.value--;
      }
    };

    let incrementProductQty = () => {
      if (buyQty.value >= 99) {
        buyQty.value = 99;
      } else {
        buyQty.value++;
      }
    };

    onMounted(() => {
      getData();
      getImgs();
    });

    return {
      productDetail,
      selectSizes,
      baseAddress,
      detailImg,
      colorActiveindex,
      sizeActiveIndex,
      buyQty,
      productImgs,
      updateSizeList,
      changeSize,
      handleQyt,
      decrementProductQty,
      incrementProductQty,
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

.detailImgboxs {
  width: 100%;
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

.color-height {
  min-height: 70px;
  display: flex;
  align-items: center;
}

.size-height {
  min-height: 70px;
  display: flex;
  align-items: center;
  margin-top: 15px;
}

.buy-height {
  min-height: 70px;
  display: flex;
  align-items: center;
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

.colorActive {
  background-color: #804040;
  border: 1px solid black;
  color: aliceblue;
}

.sizeActive {
  background-color: #804040;
  border: 1px solid black;
  color: aliceblue;
}

.increaseAndDecrease {
  background-color: gainsboro;
}

.increaseAndDecrease:hover {
  background-color: #804040;
  border: 1px solid black;
  color: aliceblue;
}
</style>
