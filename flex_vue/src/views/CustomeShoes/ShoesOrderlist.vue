<template>
<ShoesnavBar></ShoesnavBar>
<div class="container-body">
    <div class="row">
      <div class="ps-5">
        <div class="row" style="min-height: 129px">
            <div class="NTbox">訂單編號 : </div>
          <div class="col-3 orderTitle" :title="shoesOrderDetail.shoesOrderId">
            {{ shoesOrderDetail.shoesOrderId }}
          </div>
        </div>
        <div class="row" style="min-height: 129px">
            <div class="col-3">
            <div class="detailSalesPriceBox">
              <div class="NTbox">商品編號 : </div>
              <div class="detailSalesPrice" :title="shoesOrderDetail.shoesName">
                {{ shoesOrderDetail.shoesName }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="detailSalesPriceBox">
              <div class="NTbox">尺寸 : </div>
              <div class="detailSalesPrice" :title="shoesOrderDetail.sizeName">
                {{ shoesOrderDetail.sizeName }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="detailSalesPriceBox">
              <div class="NTbox">NT$</div>
              <div class="detailSalesPrice" :title="shoesOrderDetail.shoesUnitPrice">
                {{ shoesOrderDetail.shoesUnitPrice }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="detailSalesPriceBox">
              <div class="NTbox">數量 : </div>
              <div class="detailSalesPrice" :title="shoesOrderDetail.qty">
                {{ shoesOrderDetail.qty }}
              </div>
            </div>
          </div>
        </div>
        <hr />
        <div class="row" style="min-height: 129px">
            <div class="col-6">
                  <label for="OptionsAll">客製化項目 : </label>
                  <div class="row">
                    <option
                      v-for="shoesAllOptions in shoesOrderDetail.shoesAllOptions"
                      :key="shoesAllOptions.shoesOrderId"
                      :value="shoesAllOptions">
                      {{ shoesAllOptions.optinName }} | 
                      {{ shoesAllOptions.material_Name }} | 
                      {{ shoesAllOptions.colorName }}
                    </option>
                </div>
            </div>
            <div class="col-6">
                  <label for="remark">備註說明 : </label>
                  <div id="remark" class="" :title="shoesOrderDetail.remark">
                    {{ shoesOrderDetail.remark }}
                </div>
            </div>
        </div>
        <hr/>
        <div class="row color-list">
          <div class="mt-3 mb-3 col-12">
            <div class="d-flex row">
            <div class="col-6">
            <div class="detailSalesPriceBox">
              <div class="NTbox">總金額 : </div>
              <div class="detailSalesPrice" :title="totalPrice">
                {{ shoesOrderDetail.qty * shoesOrderDetail.shoesUnitPrice }}
              </div>
            </div>
          </div>
                <div class="col-6 mt-5 ms-6">
                  <button type="submit" class="btn btn-primary comenextBtn">
                    結帳
                  </button>
                </div>
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

const optionsAll = ref("");
const shoesOrderDetail = ref({});
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();

const totalPrice = computed(() => {
  return shoesOrderDetail.qty * shoesOrderDetail.shoesUnitPrice;
});


let getData = async () => {
  try {
    const response = await axios.get(
      `${baseAddress}api/CustomeShoes/shoes/Customization/Order/${route.params.ShoesOrderId}`
    );
    console.log(response.data);
    shoesOrderDetail.value = response.data;
    optionsAll.value = shoesOrderDetail.value.shoesAllOptions[0]
  } catch (error) {
    alert(error);
  }
};

onMounted(() => {
  getData();
});

</script>

<style>

</style>