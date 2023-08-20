<template>
  <div>
  <ShoesnavBar></ShoesnavBar>
  <div class="container-body">
    <div class="row">
      <div class="dscene col-6">
        <div class="sketchfab-embed-wrapper"> <iframe title="shoes FILA 1" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share width="800" height="800" src="https://sketchfab.com/models/b55a3d57f34847fc92f32d28d53684b4/embed"> </iframe> <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;"> <a href="https://sketchfab.com/3d-models/shoes-fila-1-b55a3d57f34847fc92f32d28d53684b4?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> shoes FILA 1 </a> by <a href="https://sketchfab.com/thunk3d.scanner?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> thunk3d.scanner </a> on <a href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=b55a3d57f34847fc92f32d28d53684b4" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p></div>
      </div>
      <div class="part col-6 ps-5">
        <div class="row" style="min-height: 129px">
          <div class="col-7 detailTitle" :title="shoesChoose.shoesName">
            {{ shoesChoose.shoesName }}
          </div>
          <div class="col-5">
            <div class="detailSalesPriceBox">
              <div class="NTbox">NT$</div>
              <div class="detailSalesPrice" :title="shoesChoose.shoesUnitPrice">
                {{ shoesChoose.shoesUnitPrice }}
              </div>
            </div>
          </div>
        </div>
        <hr />
        <div class="mt-3 d-flex">
          <div class="col-12">
            <button class="btn btn-primary" @click="addNewFields">新增客製化選項</button>
          </div>
        </div>
          <div class="row mt-3 d-flex selectbox">
                  <div v-for="(field, index) in newFields" :key="index" class="col-4">
                      <label :for="`newSelect${index}`">{{ field.label }}:</label>
                          <select :id="`newSelect${index}`" v-model="field.value" @change="onChange(index)">
                              <option v-for="item in field.options" :key="item.optionId || item.shoesmaterial_Id || item.shoesColorId"
                                  :value="item.optinName || item.material_Name || item.colorName">
                                  {{ item.optinName || item.material_Name || item.colorName }}
                              </option>
                      </select>
                  </div>
          </div>
              <div class="mt-3 d-flex">
          <div class="col-12">
              <button class="btn btn-danger" @click="removeAllFields">刪除客製化選項</button>
          </div>
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
                  justify-content: center;">
                  數量:
              </span>              
              <input
                type="text"
                name="productQty"
                id="productQty"
                class="form-control text-center"
                style="border-radius: 0"
                v-model="buyQty"
                @input="handleQyt"
              />     
            </div>
              <div class="col-6">
                <div class="form-control">
                  <span>總金額${{ totalPrice }}</span>
                </div>
              </div>
                  <textarea
                  class="form-control mt-3"
                  rows="10"
                  placeholder="請詳細說明您的需求"
                  name="message"
                  required
                  ></textarea>
            <div class="col-6 mt-5 ms-6">
              <button class="form-control">商品結帳</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div v-if="showToast" class="toast">
    {{ toastMessage }}
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
              <div>產地:{{ shoesChoose.shoesOrigin }}</div>
              <div>類別:{{ shoesChoose.shoesCategoryName }}</div>
              <div>描述:{{ shoesChoose.shoesDescription }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <homeFooter></homeFooter>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref, computed } from "vue";
import { useRoute } from "vue-router";
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const selectedMaterials = ref("");
const selectedColors = ref("");
const selectedOptions = ref("");
const shoesChoose = ref({});
const route = useRoute();
const fieldGroups = ref([]);
const buyQty = ref(1);
const showDetailDiv = ref(true);
const totalPrice = computed(() => {
      return buyQty.value * shoesChoose.value.shoesUnitPrice;
    });

const newFields = ref([]);
const showToast = ref(false);
const toastMessage = ref("");


//客製化選項的下拉清單  
const addNewFields = () => {
if (newFields.value.length < 15) {
  const newOption = {
    label: "部位",
    value: "",
    options: shoesChoose.value.shoesOptions
  };

  const existingNames = newFields.value.map(field => field.value);
  if (existingNames.includes(newOption.value)) {
    showToastMessage("Duplicate value detected. Please choose a different value.");
    return;
  }

  newFields.value.push(newOption);
  newFields.value.push({
    label: "材質",
    value: "",
    options: shoesChoose.value.shoesMaterials
  });

  newFields.value.push({
    label: "顏色",
    value: "",
    options: shoesChoose.value.shoesColors
  });

  const uniqueShoesOptions = shoesChoose.value.shoesOptions.filter(option =>
    !existingNames.includes(option.optinName)
  );
  newOption.options = uniqueShoesOptions;
}
};

//移除選項的按鈕
const removeAllFields = () => {
  if (newFields.value.length >= 3) {
  newFields.value.splice(newFields.value.length - 3, 3);
  }

};

//錯誤訊息
const showToastMessage = (message) => {
toastMessage.value = message;
showToast.value = true;
console.log('Show toast');
setTimeout(() => {
  showToast.value = false;
  console.log('Hide toast');
}, 3000);
};

//變更下拉清單的事件
const onChange = (index) => {
  handleNewFieldChange(index);
};

const handleNewFieldChange = (index) => {
  console.log(`New Field ${index} changed:`, newFields.value[index].value);
};

//抓api資料
const getData = async () => {
  try {
    const response = await axios.get(`${baseAddress}api/CustomeShoes/shoes/Customization/${route.params.shoesProductId}`);
    shoesChoose.value = response.data;
    selectedColors.value = shoesChoose.value.shoesColors[0].colorName;
    selectedOptions.value = shoesChoose.value.shoesOptions[0].optinName;
    selectedMaterials.value = shoesChoose.value.shoesMaterials[0].material_Name;
  } catch (error) {
    alert(error);
  }
};

//啟用方法
onMounted(() => {
  getData();
});
</script>

<style>
  /* ... (樣式代碼) */
.selectbox
{
  align-items: center;
justify-content: center;
border: 1px solid rgb(185, 184, 184);
border-radius: 10px;
}

textarea {
max-width: 400px;
max-height: 200px;
color: #000;
letter-spacing: 1px;
}

.dscene{
width: 800px;
height: 800px;
margin-left: auto;
margin-top: auto;
}

.part{
width: 800px;
height: 800px;
margin-right: auto;
}

</style>