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
              :style="{ 'background-color': color }"
              >{{ color }}
            </a>
          </div>
          <div class="size-height">
            <a
              href="#"
              v-for="(size, index) in selectSizes"
              :class="{
                sizeboxsetting: true,
                sizeActive: sizeActiveIndex === index,
                zeroInventory: size.qty === 0,
              }"
              :key="size.productGroupId"
              :title="size.sizeName"
              :data-productGroupId="size.productGroupId"
              @click="handleSizeClick(index, size.qty)"
            >
              {{ size.sizeName }}
            </a>
          </div>
          <div class="mt-3 d-flex mb-3">
            <div class="text-center">
              <button
                type="button"
                class="form-control btn sizeTableBtn"
                style="font-size: 15px"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                v-if="productDetail.salesCategoryName !== '配件'"
              >
                尺寸表
              </button>
            </div>
            <div
              class="modal fade"
              id="exampleModal"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
              style="z-index: 6000"
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
                    <img :src="baseAddress + 'Public/Img/' + sizeTable" />
                    <p>※ 本尺寸表會因商品素材不同，可能與實際尺寸略有誤差。</p>
                    <p>※ 尺寸表為商品平放測量，以公分(cm)為單位。</p>
                    <img :src="baseAddress + 'Public/Img/' + sizeImg" />
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
            <div class="ms-5 favoriteBtn">
              <button style="font-size: 15px" @click="collect">
                <i class="bi bi-heart" style="color: red" v-if="!like"></i
                ><i class="bi bi-heart-fill" style="color: red" v-else></i
                ><span class="ms-1">收藏</span>
              </button>
            </div>
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
                  >數量</span
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
                />
                <button
                  @click="incrementProductQty()"
                  class="increaseAndDecrease"
                >
                  <i class="bi bi-plus-lg"></i>
                </button>
              </div>
              <div class="col-6">
                <button @click="joinCartItemEventHandler" class="form-control">
                  加入購物車
                </button>
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
                <div>產地:{{ productDetail.productOrigin }}</div>
                <div>材質:{{ productDetail.productMaterial }}</div>
                <div>描述:{{ productDetail.productDescription }}</div>
              </div>
            </div>
          </div>
          <div
            class="tab-pane fade commentDiv"
            id="profile-tab-pane"
            role="tabpanel"
            aria-labelledby="profile-tab"
            tabindex="0"
            v-if="productComment.length > 0"
          >
            <div style="width: 95%; position: relative" class="p-3">
              <h1 class="d-inline">
                綜合評分 : <i class="bi bi-star-fill" style="color: gold"></i>
                {{ productComment[0].averageScore }} / 5
              </h1>
              <span style="right: 0%; position: absolute; font-size: 30px"
                ><i
                  class="bi bi-plus-lg"
                  v-if="!showCommentDiv"
                  @click="showCommentDiv = !showCommentDiv"
                ></i
                ><i
                  class="bi bi-dash-lg"
                  v-else
                  @click="showCommentDiv = !showCommentDiv"
                ></i
              ></span>
              <div v-if="showCommentDiv">
                <div
                  v-for="comment in productComment"
                  :key="comment.commentId"
                  class="mb-3 ms-3"
                >
                  <div class="d-flex">
                    <div>{{ comment.memberNameText }}</div>
                    <div class="ms-3">
                      <i
                        v-for="i in comment.score"
                        :key="i"
                        class="bi bi-star-fill"
                        style="color: gold"
                      ></i>
                    </div>
                    <div class="ms-3">{{ comment.createTimeText }}</div>
                  </div>
                  <div>{{ comment.description }}</div>
                  <hr />
                </div>
                <nav
                  aria-label="Page navigation example"
                  style="
                    display: flex;
                    align-items: center;
                    justify-content: center;
                  "
                >
                  <ul class="pagination">
                    <li class="page-item">
                      <a
                        class="page-link"
                        aria-label="Previous"
                        @click="decrementPage"
                      >
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li
                      v-for="(value, index) in totalPages"
                      class="page-item"
                      :key="index"
                      @click="clickHandler(value)"
                    >
                      <a
                        :class="{
                          pageHandle: thePage === value,
                          'page-link': true,
                        }"
                        >{{ value }}</a
                      >
                    </li>

                    <li class="page-item">
                      <a
                        class="page-link"
                        aria-label="Next"
                        @click="incrementPage"
                      >
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row mt-3">
      <div class="col-12">
        <div class="container-body">
          <div class="d-flex">
            <h1 class="me-auto">你可能會喜歡</h1>
            <button class="me-3 similarBtn" @click="showPrev">
              <i class="bi bi-chevron-left similarIcon"></i>
            </button>
            <button class="me-5 similarBtn" @click="showNext">
              <i class="bi bi-chevron-right similarIcon"></i>
            </button>
          </div>
          <Carousel
            :items-to-show="4"
            :wrap-around="true"
            ref="similarCarousel"
          >
            <Slide
              v-for="card in similarProducts"
              :key="card.productId"
              class="card text-center"
            >
              <ProductCard :card="card"></ProductCard>
            </Slide>
          </Carousel>
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

<script setup>
import axios from "axios";
import {
  computed,
  onMounted,
  ref,
  watch,
  inject,
  toRef,
  defineProps,
} from "vue";
import { useRouter, useRoute } from "vue-router";
import ProductCard from "@/components/product/ProductCard.vue";
import { useProductRoute } from "@/stores/useProductRoute.js";
import { Carousel, Slide } from "vue3-carousel";
import navBar from "@/components/home/navBar.vue";
import Swal from "sweetalert2/dist/sweetalert2.js";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();
const productDetail = ref({});
const selectSizes = ref({});
const detailImg = ref("");
const colorActiveindex = ref(0);
const sizeActiveIndex = ref(0);
const buyQty = ref(1);
const productImgs = ref([]);
const productComment = ref([]);
const showCommentDiv = ref(true);
const showDetailDiv = ref(true);
const cards = ref([]);
const productStore = useProductRoute();
//const productName = ref("");
const similarProducts = ref([]);
const totalPages = ref(1);
const thePage = ref(1);
const currentIndex = ref(0);
const visibleCards = ref([]);
const sizeImg = ref("");
const sizeTable = ref("");
const like = ref();
const router = useRouter();
//let likeProductName = '';
//檢查本地儲存是否有登錄信息
const storedUser = localStorage.getItem("loggedInUser");

function redirectToStoredPath() {
  const loggedInUser = localStorage.getItem("loggedInUser");
  if (loggedInUser == null || loggedInUser == undefined) {
    const localStorageKey = "originalRoute";
    localStorage.setItem(localStorageKey, route.path);
  }
}

//sweetalert樣式
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

const similarCarousel = ref(null);

//輪播自訂切換
const showPrev = () => {
  similarCarousel.value.prev();
  similarCarousel.value.updateSlideWidth();
};
//輪播自訂切換
const showNext = () => {
  similarCarousel.value.next();
  similarCarousel.value.updateSlideWidth();
};

//基本資料
let getData = async () => {
  await axios
    .get(`${baseAddress}api/Products/Detail/${route.params.productId}`)
    .then((response) => {
      //console.log(response.data.productName);
      productDetail.value = response.data;
      //productName.value = response.data.productName;
      const firstColor = Object.keys(productDetail.value.productGroup)[0];
      //console.log(firstColor);
      if (firstColor) {
        selectSizes.value = productDetail.value.productGroup[firstColor];
        detailImg.value = selectSizes.value[0].defaultColorImg;
        //console.log(selectSizes.value[0].defaultColorImg);
      }
      // likeProductName = productName.value; //ying加的
      // productStore.setProductName(productName.value);

      if (
        response.data.productCategoryName == "上衣" &&
        response.data.salesCategoryName == "男裝"
      ) {
        sizeTable.value = "男裝上衣尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "上衣" &&
        response.data.salesCategoryName == "女裝"
      ) {
        sizeTable.value = "女裝上衣尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "上衣" &&
        response.data.salesCategoryName == "童裝"
      ) {
        sizeTable.value = "童裝上衣尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "男裝" &&
        response.data.productSubCategoryName == "短褲"
      ) {
        sizeTable.value = "男裝褲子短褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "男裝" &&
        response.data.productSubCategoryName == "長褲"
      ) {
        sizeTable.value = "男裝褲子長褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "女裝" &&
        response.data.productSubCategoryName == "短褲"
      ) {
        sizeTable.value = "女裝褲子短褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "女裝" &&
        response.data.productSubCategoryName == "長褲"
      ) {
        sizeTable.value = "女裝褲子長褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "童裝" &&
        response.data.productSubCategoryName == "短褲"
      ) {
        sizeTable.value = "童裝褲子短褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "褲子" &&
        response.data.salesCategoryName == "童裝" &&
        response.data.productSubCategoryName == "長褲"
      ) {
        sizeTable.value = "童裝褲子長褲尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "鞋子" &&
        response.data.salesCategoryName == "男裝"
      ) {
        sizeTable.value = "成人鞋子尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "鞋子" &&
        response.data.salesCategoryName == "女裝"
      ) {
        sizeTable.value = "成人鞋子尺寸表.jpg";
      } else if (
        response.data.productCategoryName == "鞋子" &&
        response.data.salesCategoryName == "童裝"
      ) {
        sizeTable.value = "童裝鞋子尺寸表.jpg";
      }

      // console.log(sizeTable.value);

      if (response.data.productCategoryName == "上衣") {
        sizeImg.value = "上衣說明表.jpg";
      } else if (response.data.productCategoryName == "褲子") {
        sizeImg.value = "下身說明表.jpg";
      } else if (response.data.productCategoryName == "鞋子") {
        sizeImg.value = "鞋子說明表.jpg";
      }
    })
    .catch((error) => {
      alert(error);
    });
};

//抓照片
let getImgs = async () => {
  await axios
    .get(`${baseAddress}api/Products/Imgs/${route.params.productId}`)
    .then((response) => {
      //console.log(response.data);
      productImgs.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};

//分頁
let clickHandler = (page) => {
  //console.log(page);
  thePage.value = page;
  getComment();
};
//上一頁
let decrementPage = () => {
  if (thePage.value > 1) {
    thePage.value--;
    getComment();
  }
};
//下一頁
let incrementPage = () => {
  if (thePage.value < totalPages.value) {
    thePage.value++;
    getComment();
  }
};

//留言
let getComment = async () => {
  await axios
    .get(
      `${baseAddress}api/Products/Comment/${route.params.productId}?page=${thePage.value}&pageSize=3`
    )
    .then((response) => {
      //console.log(response.data);
      productComment.value = response.data;
      totalPages.value = response.data[0].totalPage;
      //console.log(totalPages);
    })
    .catch((error) => {
      alert(error);
    });
};

//相似商品
let getSimilarProducts = async () => {
  await axios
    .get(`${baseAddress}api/Products/Similar/${route.params.productId}`)
    .then((response) => {
      //console.log(response.data);
      similarProducts.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};

//更新size+照片
let updateSizeList = (sizesDto, index) => {
  colorActiveindex.value = index;
  selectSizes.value = sizesDto;
  detailImg.value = sizesDto[0].defaultColorImg;
};

//被選重要加入樣式
let changeSize = (index) => {
  sizeActiveIndex.value = index;
};

//被選重要加入樣式
let handleSizeClick = (index, qty) => {
  if (qty > 0) {
    changeSize(index);
  }
};

//購買數量(手輸)
let handleQyt = (event) => {
  buyQty.value = event.target.value.replace(/\D/g, "");
  if (buyQty.value <= 1) {
    buyQty.value = 1;
  }
  if (buyQty.value >= 99) {
    buyQty.value = 99;
  }
};

//購買數量(--)
let decrementProductQty = () => {
  if (buyQty.value <= 1) {
    buyQty.value = 1;
  } else {
    buyQty.value--;
  }
};

//購買數量(++)
let incrementProductQty = () => {
  if (buyQty.value >= 99) {
    buyQty.value = 99;
  } else {
    buyQty.value++;
  }
};

watch(
  () => route.params.productId,
  (newProductId) => {
    if (newProductId != undefined) {
      getData();
      getImgs();
      getComment();
      getSimilarProducts();
      redirectToStoredPath();
    }
  }
);

onMounted(() => {
  getData();
  getImgs();
  getComment();
  getSimilarProducts();
  isFavorite();
  redirectToStoredPath();
});

function collect() {
  if (storedUser) {
    const userObject = JSON.parse(storedUser);
    like.value = !like.value;
    const data = {
      MemberId: userObject.memberId,
      ProductId: `${route.params.productId}`,
    };
    if (like.value) {
      //呼叫api(memberId、productId)存進去
      axios
        .post(`${baseAddress}api/Users/SaveFavorites`, data)
        .then((response) => {
          if (props.updateFavoritesCount) {
            props.updateFavoritesCount();
          }
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
    } else {
      axios
        .delete(`${baseAddress}api/Users/DeleteFavorite`, { data: data })
        .then((response) => {
          if (props.updateFavoritesCount) {
            props.updateFavoritesCount();
          }
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
    }
  } else {
    Swal.fire({
      title: "登入",
      text: "是否前往登入頁面?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "確認",
      cancelButtonText: "取消",
    }).then((result) => {
      if (result.isConfirmed) {
        router.push("/login");
      }
    });
  }
}

//檢查有沒有在最愛裡，有的話要給like綁訂定true
const isFavorite = async () => {
  if (storedUser) {
    await axios
      .get(
        `${baseAddress}api/Users/IsFavorite?memberId=${
          JSON.parse(storedUser).memberId
        }&productId=${route.params.productId}`
      )
      .then((response) => {
        like.value = response.data;
      })
      .catch((error) => {
        alert(error);
      });
  } else {
    like.value = false;
  }
};

const props = defineProps({
  updateCartFunction: Function,
  updateFavoritesCount: Function,
});
const joinCartItemEventHandler = async () => {
  const storedUser = localStorage.getItem("loggedInUser");
  if (storedUser) {
    const userObject = JSON.parse(storedUser);
    const product = document.querySelector(".sizeActive");
    if (product) {
      const productId = product.getAttribute("data-productgroupid");
      const Qty = document.querySelector("#productQty").value;
      const requestData = {
        MemberId: parseInt(userObject.memberId),
        CartItem: {
          ProductId: parseInt(productId),
          Qty: parseInt(Qty),
        },
      };
      console.log(requestData);
      await axios
        .put(`${baseAddress}api/Cart/UpdateItem`, requestData)
        .then((response) => {
          if (props.updateCartFunction) {
            props.updateCartFunction();
            Toast.fire({
              icon: "success",
              title: "已加入購物車",
            });
          }
        })
        .catch((err) => {
          alert("加入購物車錯誤", err);
        });
    } else {
      Swal.fire({
        icon: "warning",
        title: "請選擇尺寸",
      });
    }
  } else {
    Swal.fire({
      title: "登入",
      text: "是否前往登入頁面?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "確認",
      cancelButtonText: "取消",
    }).then((result) => {
      if (result.isConfirmed) {
        router.push("/login");
      }
    });
  }
};
</script>

<style scoped>
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
  flex-wrap: wrap;
  /* 换行排列 */
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
  margin-right: 10px;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  overflow: hidden;
  border: 1px solid #e0e0e0;
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
  border: 2px solid black;
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
}

.increaseAndDecrease:hover i {
  color: aliceblue;
}

.commentDiv {
  align-items: center;
  justify-content: center;
  border: 1px solid rgb(185, 184, 184);
  border-radius: 10px;
}

.similarBtn {
  width: 50px;
  height: 50px;
  font-size: 20px;
  border-radius: 50%;
  background-color: #dbdbdb;
}

.similarBtn:hover {
  background-color: #ababab;
}

.similarBtn:hover .similarIcon {
  color: white;
}

.pageHandle {
  background-color: #706e6c;
  color: white;
}

.zeroInventory {
  background-color: white;
  color: #acaba9;
  border: 1px dotted #acaba9;
}

.sizeTableBtn {
  border: none;
}

.favoriteBtn {
  display: flex;
  align-items: center;
  justify-content: center;
}

.setColorBoxSize {
  width: 50px;
  height: 50px;
}
</style>
