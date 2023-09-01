<template>
    <ShoesnavBar></ShoesnavBar>
  <div class="page-container1">
    <div class="container-body mt-3">
      <div class="row">
        <div class="col-6">
          <div class="sketchfab-embed-wrapper">
            <iframe
              title="shoes FILA 1"
              frameborder="0"
              allowfullscreen
              mozallowfullscreen="true"
              webkitallowfullscreen="true"
              allow="autoplay; fullscreen; xr-spatial-tracking"
              xr-spatial-tracking
              execution-while-out-of-viewport
              execution-while-not-rendered
              web-share
              width="800"
              height="800"
              src="https://sketchfab.com/models/b55a3d57f34847fc92f32d28d53684b4/embed"
            >
            </iframe>
            <p
              style="
                font-size: 13px;
                font-weight: normal;
                margin: 5px;
                color: #4a4a4a;
              "
            >
              <a
                href="https://sketchfab.com/3d-models/shoes-fila-1-b55a3d57f34847fc92f32d28d53684b4?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4"
                target="_blank"
                rel="nofollow"
                style="font-weight: bold; color: #1caad9"
              ></a>
              <a
                href="https://sketchfab.com/thunk3d.scanner?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4"
                target="_blank"
                rel="nofollow"
                style="font-weight: bold; color: #1caad9"
              ></a>
              <a
                href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4"
                target="_blank"
                rel="nofollow"
                style="font-weight: bold; color: #1caad9"
                ></a>
            </p>
          </div>
        </div>
        <div class="col-6 ps-5">
          <div class="row" style="min-height: 129px">
            <div class="col-7 detailTitle1" :title="shoesChoose.shoesName">
              {{ shoesChoose.shoesName }}
            </div>
            <div class="col-5">
              <div class="">
                <div class="">NT$</div>
                <div
                  class="detailSalesPrice1"
                  :title="shoesChoose.shoesUnitPrice"
                >
                  {{ shoesChoose.shoesUnitPrice }}
                </div>
              </div>
            </div>
          </div>
            <div class="row">
                <div class="col-12">
                  <label for="sizeSelect">Size:</label>
                  <select
                    id="sizeSelect"
                    v-model="selectedSize"
                    @change="handleSizeChange">
                    <option
                      v-for="size in shoesDetail.shoesSize"
                      :key="size.sizeId"
                      :value="size">
                      {{ size.sizeName }}
                    </option>
                  </select>
                  <label class="ms-3">選擇尺寸</label>
                </div>
                  <div class="row d-flex me-3 mt-1 mb-1  col-8">
                      <span
                        class="col-3"
                        style="
                          display: flex;
                          align-items: center;
                        "
                        >數量:</span>
                    <div class="">
                      <button
                        @click="decrementProductQty()"
                        class=""
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
                        class=""
                      >
                        <i class="bi bi-plus-lg"></i>
                      </button>
                    </div>
                 </div>
                  <div class="col-4">
                    <div class="form-control">
                      <span>總金額${{ totalPrice }}</span>
                    </div>
                  </div>
          </div>
          <hr />
          <div class="row mt-3 d-flex">
            <div class="col-4">
                  <label for="optionsSelect">鞋面</label>
                </div>
                <div class="col-4">
                  <label for="materialsSelect">材質:</label>
                  <select
                    id="materialsSelect"
                    v-model="selectedMaterials1"
                    @change="handleMaterialsChange1">
                    <option
                      v-for="material in shoesChoose.shoesMaterials"
                      :key="material.shoesmaterial_Id"
                      :value="material">
                      {{ material.material_Name }}
                    </option>
                  </select>
                </div>
                <div class="col-4">
                  <label for="colorsSelect">顏色:</label>
                  <select
                    id="colorsSelect"
                    v-model="selectedColors1"
                    @change="handleColorsChange1">
                    <option
                      v-for="color in shoesChoose.shoesColors"
                      :key="color.shoesColorId"
                      :value="color">
                      {{ color.colorName }}
                    </option>
                  </select>
                </div>
          </div>
          <div class="row mt-3 d-flex">
            <div class="col-4">
                  <label for="optionsSelect">鞋尖</label>
                </div>
                <div class="col-4">
                  <label for="materialsSelect">材質:</label>
                  <select
                    id="materialsSelect"
                    v-model="selectedMaterials2"
                    @change="handleMaterialsChange2">
                    <option
                      v-for="material in shoesChoose.shoesMaterials"
                      :key="material.shoesmaterial_Id"
                      :value="material">
                      {{ material.material_Name }}
                    </option>
                  </select>
                </div>
                <div class="col-4">
                  <label for="colorsSelect">顏色:</label>
                  <select
                    id="colorsSelect"
                    v-model="selectedColors2"
                    @change="handleColorsChange2">
                    <option
                      v-for="color in shoesChoose.shoesColors"
                      :key="color.shoesColorId"
                      :value="color">
                      {{ color.colorName }}
                    </option>
                  </select>
                </div>
          </div>
          <div class="row mt-3 d-flex">
            <div class="col-4">
                  <label for="optionsSelect">護邊</label>
                </div>
                <div class="col-4">
                  <label for="materialsSelect">材質:</label>
                  <select
                    id="materialsSelect"
                    v-model="selectedMaterials3"
                    @change="handleMaterialsChange3">
                    <option
                      v-for="material in shoesChoose.shoesMaterials"
                      :key="material.shoesmaterial_Id"
                      :value="material">
                      {{ material.material_Name }}
                    </option>
                  </select>
                </div>
                <div class="col-4">
                  <label for="colorsSelect">顏色:</label>
                  <select
                    id="colorsSelect"
                    v-model="selectedColors3"
                    @change="handleColorsChange3">
                    <option
                      v-for="color in shoesChoose.shoesColors"
                      :key="color.shoesColorId"
                      :value="color">
                      {{ color.colorName }}
                    </option>
                  </select>
                </div>
          </div>
          <div class="row mt-3 d-flex">
            <div class="col-4">
                  <label for="optionsSelect">鞋領</label>
                </div>
                <div class="col-4">
                  <label for="materialsSelect">材質:</label>
                  <select
                    id="materialsSelect"
                    v-model="selectedMaterials4"
                    @change="handleMaterialsChange4">
                    <option
                      v-for="material in shoesChoose.shoesMaterials"
                      :key="material.shoesmaterial_Id"
                      :value="material">
                      {{ material.material_Name }}
                    </option>
                  </select>
                </div>
                <div class="col-4">
                  <label for="colorsSelect">顏色:</label>
                  <select
                    id="colorsSelect"
                    v-model="selectedColors4"
                    @change="handleColorsChange4">
                    <option
                      v-for="color in shoesChoose.shoesColors"
                      :key="color.shoesColorId"
                      :value="color">
                      {{ color.colorName }}
                    </option>
                  </select>
                </div>
          </div>
          <div class="row mt-3 d-flex">
            <div class="col-4">
                  <label for="optionsSelect">孔眼片</label>
                </div>
                <div class="col-4">
                  <label for="materialsSelect">材質:</label>
                  <select
                    id="materialsSelect"
                    v-model="selectedMaterials5"
                    @change="handleMaterialsChange5">
                    <option
                      v-for="material in shoesChoose.shoesMaterials"
                      :key="material.shoesmaterial_Id"
                      :value="material">
                      {{ material.material_Name }}
                    </option>
                  </select>
                </div>
                <div class="col-4">
                  <label for="colorsSelect">顏色:</label>
                  <select
                    id="colorsSelect"
                    v-model="selectedColors5"
                    @change="handleColorsChange5">
                    <option
                      v-for="color in shoesChoose.shoesColors"
                      :key="color.shoesColorId"
                      :value="color">
                      {{ color.colorName }}
                    </option>
                  </select>
                </div>
          </div>
          <hr />
          <div class="mt-3 mb-3 col-12">
            <div class="d-flex row">
              <textarea
                class="form-control mt-3"
                rows="10"
                placeholder="請詳細說明您的需求"
                name="message"
                v-model="remark"
                required
              ></textarea>
          </div>
          <div class="col-6 mt-5 ms-6">
                  <label>
                    <input type="checkbox" v-model="agreeToCreateOrder" />
                    我同意建立訂單
                  </label>
                  <span v-if="selectedSize.sizeId === undefined" style="color: red;" class="ms-2">請先選擇尺寸</span>
                </div>
                <router-link v-if="showCheckoutButton" :to="'/CustomeShoes' + '/detail/'+ 'Customization/' + 'order/' + ShoesOrderId">
                  <div class="col-6 mt-5 ms-6">
                    <button class="form-control">前往結帳頁面</button>
                  </div>
                </router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  <homeFooter></homeFooter>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref, computed, watch } from "vue";
import { useRoute } from "vue-router";
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const selectedSize = ref("");
const shoesChoose = ref({});
const shoesDetail = ref({});
const route = useRoute();
const fieldGroups = ref([]);
const buyQty = ref(1);
const remark = ref("");
const showDetailDiv = ref(true);

const selectedMaterials1 = ref(""); // 第一組選擇框
const selectedColors1 = ref(""); // 第一組選擇框

const selectedMaterials2 = ref(""); // 第二組選擇框
const selectedColors2 = ref(""); // 第二組選擇框

const selectedMaterials3 = ref(""); // 第三組選擇框
const selectedColors3 = ref(""); // 第三組選擇框

const selectedMaterials4 = ref(""); // 第四組選擇框
const selectedColors4 = ref(""); // 第四組選擇框

const selectedMaterials5 = ref(""); // 第五組選擇框
const selectedColors5 = ref(""); // 第五組選擇框

const agreeToCreateOrder = ref(false); // 勾選框的狀態

const showCheckoutButton = ref(false);

// 根據勾選框的狀態更新 showCheckoutButton 標誌
watch(agreeToCreateOrder, (newVal) => {
  if (newVal) {
    // 當勾選框被勾選時，執行 intoOrder 函式
    intoOrder();
  }  
  showCheckoutButton.value = newVal;
});

const totalPrice = computed(() => {
  return buyQty.value * shoesChoose.value.shoesUnitPrice;
});

const shoesProductId = route.params.shoesProductId;


const handleSizeChange = () => {
  console.log("Selected size changed:", selectedSize.value);
  agreeToCreateOrder.value = false;
};



const handleMaterialsChange1 = () => {
  console.log("Selected materials changed:", selectedMaterials1.value);
};

const handleColorsChange1 = () => {
  console.log("Selected color changed:", selectedColors1.value);
};


const handleMaterialsChange2 = () => {
  console.log("Selected materials changed:", selectedMaterials2.value);
};

const handleColorsChange2 = () => {
  console.log("Selected color changed:", selectedColors2.value);
};


const handleMaterialsChange3 = () => {
  console.log("Selected materials changed:", selectedMaterials3.value);
};

const handleColorsChange3 = () => {
  console.log("Selected color changed:", selectedColors3.value);
};


const handleMaterialsChange4 = () => {
  console.log("Selected materials changed:", selectedMaterials4.value);
};

const handleColorsChange4 = () => {
  console.log("Selected color changed:", selectedColors4.value);
};


const handleMaterialsChange5 = () => {
  console.log("Selected materials changed:", selectedMaterials5.value);
};

const handleColorsChange5 = () => {
  console.log("Selected color changed:", selectedColors5.value);
};


const errors = ref([]);

//商品數量的增減事件
let handleQyt = (event) => {
  buyQty.value = event.target.value.replace(/\D/g, "");
  if (buyQty.value <= 1) {
    buyQty.value = 1;
  }
  if (buyQty.value >= 99) {
    buyQty.value = 99;
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


//塞入資料到資料庫
const orderUri = `${baseAddress}api/CustomeShoes/EnterCustomerChoose`;
const optionsUri = `${baseAddress}api/CustomeShoes/ChoseAllOptions`;

var orderData = {};
let ShoesOrderId = '';
function intoOrder() {
  if (!agreeToCreateOrder.value) {
    // 如果勾選框未被選中，不執行建立訂單操作
    return;
  }
  if (selectedSize.value.sizeId === undefined) {
    //todo檢查有沒有選擇size
    errors.value = [];
    errors.value.push("Size還未選擇，請先選擇");
    agreeToCreateOrder.value = false;
    return;}

   else {
    errors.value = [];
    // orderData.shoesOrderId = shoesOrderId;
    orderData.fk_ShoesSizeId = selectedSize.value.sizeId;
    orderData.qty = buyQty.value;
    orderData.remark = remark.value;
    
    axios
      .post(orderUri, orderData)
      .then((res) => {
        ShoesOrderId=res.data;
        console.log(res.data)
        intoOptions();    
      })
      .catch((error) => {
        console.error("POST request error:", error);
      });

  }
}

//塞入各式選項到資料庫

var optionsData = {};

function intoOptions() {
  const nodeList = document.querySelectorAll('select');
  let flag =false;
  let selectStr = '';
  nodeList.forEach(item=>{
    
    if(item.value = "" || item.value==null){
      selectStr=item.getAttribute('data-select');
      flag=true;
      return;
    }
  })
  if (flag) {
    if (selectStr == '部位') {      
      //todo檢查有沒有選擇部位
      errors.value = [];
      errors.value.push("還沒有任何客製化選項，請先選擇");
    }
    else if (selectStr == '材質') {
    //todo檢查有沒有選擇材質
    errors.value = [];
    errors.value.push("還沒有選擇材質，請先選擇");
    }else if (selectStr == '顏色') {
    //todo檢查有沒有選擇顏色
    errors.value = [];
    errors.value.push("還沒有選擇顏色，請先選擇");
  }}
    else {
    console.log(123);
    errors.value = [];
    for (let i = 1; i <= 5; i++) {
      const currentSelectedMaterials = eval(`selectedMaterials${i}`);
      const currentSelectedColors = eval(`selectedColors${i}`);

      const optionsData = {
        shoesMainId: route.params.shoesProductId,
        optionId: i,
        materialId: currentSelectedMaterials.value.shoesmaterial_Id,
        shoesColorId: currentSelectedColors.value.shoesColorId,
        customerOrderId: ShoesOrderId
      };

      console.log(optionsData.customerOrderId)

      axios
        .post(optionsUri, optionsData, {
      headers: {
        'Content-Type': 'application/json',
          },
        })
        .then((res) => {
          console.log(`Option ${i} added:`, res.data);
        })
        .catch((error) => {
          console.error(`POST request error for option ${i}:`, error);
        });
    }
  }
}


//抓api資料
let getDataSize = async () => {
  try {
    const response = await axios.get(
      `${baseAddress}api/CustomeShoes/shoes/Detail/${route.params.shoesProductId}`
    );
    console.log(response.data);
    shoesDetail.value = response.data;
    if (shoesDetail.value.shoesSize && shoesDetail.value.shoesSize.length > 0) {
      selectedSize.value = shoesDetail.value.shoesSize[0].sizeName;
    }
  } catch (error) {
    alert(error);
  }
};

//抓api資料
const getData = async () => {
  try {
    const response = await axios.get(
      `${baseAddress}api/CustomeShoes/shoes/Customization/${route.params.shoesProductId}`
    );
    shoesChoose.value = response.data;
    selectedColors1.value = shoesChoose.value.shoesColors[0];
    selectedMaterials1.value = shoesChoose.value.shoesMaterials[0];

    selectedColors2.value = shoesChoose.value.shoesColors[0];
    selectedMaterials2.value = shoesChoose.value.shoesMaterials[0];
    
    selectedColors3.value = shoesChoose.value.shoesColors[0];
    selectedMaterials3.value = shoesChoose.value.shoesMaterials[0];

    selectedColors4.value = shoesChoose.value.shoesColors[0];
    selectedMaterials4.value = shoesChoose.value.shoesMaterials[0];

    selectedColors5.value = shoesChoose.value.shoesColors[0];
    selectedMaterials5.value = shoesChoose.value.shoesMaterials[0];
  } catch (error) {
    alert(error);
  }
};

//啟用方法
onMounted(() => {
  getDataSize();
  getData();
});


</script>

<style>
/* ... (樣式代碼) */
.page-container1 {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh; /* 确保容器至少占满整个视口高度 */
}

.detailSalesPrice1 {
  color: red;
  font-size: 60px;
  font-weight: 500;
}

.detailTitle1
{
  font-size: 30px;
}

</style>
