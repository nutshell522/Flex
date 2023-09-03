<template>
<ShoesnavBar></ShoesnavBar>
<div class="container-body">
    <div class="row">
      <div class="ps-5">
        <div class="row" style="min-height: 129px">
            <div class="">訂單編號 : </div>
          <div class="col-3" :title="shoesOrderDetail.shoesOrderId">
            {{ shoesOrderDetail.shoesOrderId }}
          </div>
        </div>
        <div class="row" style="min-height: 129px">
            <div class="col-3">
            <div class="">
              <div class="">商品編號 : </div>
              <div class="" :title="shoesOrderDetail.shoesName">
                {{ shoesOrderDetail.shoesName }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="">
              <div class="">尺寸 : </div>
              <div class="" :title="shoesOrderDetail.sizeName">
                {{ shoesOrderDetail.sizeName }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="">
              <div class="">NT$</div>
              <div class="" :title="shoesOrderDetail.shoesUnitPrice">
                {{ shoesOrderDetail.shoesUnitPrice }}
              </div>
            </div>
          </div>
          <div class="col-3">
            <div class="">
              <div class="">數量 : </div>
              <div class="" :title="shoesOrderDetail.qty">
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
        <div class="row">
          <div class="mt-3 mb-3 col-12">
            <div class="d-flex row">
            <div class="col-6">
            <div class="">
              <div class="">總金額 : </div>
              <div class="" :title="totalPrice">
                {{ shoesOrderDetail.qty * shoesOrderDetail.shoesUnitPrice }}
              </div>
            </div>
          </div>
              <div class="col-4 ms-6">
                <label for="paymentMethod">付款方式 : </label>
                <select id="paymentMethod" v-model="selectedPaymentMethod" class="form-select mt-2">
                  <option value="creditCard">信用卡結帳</option>
                  <option value="cash">現金付款</option>
                </select>
                  <form id="payForm" action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5" method="post">
                              <input
                        type="hidden"
                        name="MerchantID"
                        :value="payInfo.MerchantID"
                      />
                      <input
                        type="hidden"
                        name="MerchantTradeNo"
                        :value="payInfo.MerchantTradeNo"
                      />
                      <input
                        type="hidden"
                        name="MerchantTradeDate"
                        :value="payInfo.MerchantTradeDate"
                      />
                      <input
                        type="hidden"
                        name="PaymentType"
                        :value="payInfo.PaymentType"
                      />
                      <input
                        type="hidden"
                        name="TotalAmount"
                        :value="payInfo.TotalAmount"
                      />
                      <input type="hidden" name="TradeDesc" :value="payInfo.TradeDesc" />
                      <input type="hidden" name="ItemName" :value="payInfo.ItemName" />
                      <input type="hidden" name="ReturnURL" :value="payInfo.ReturnURL" />
                      <input
                        type="hidden"
                        name="ChoosePayment"
                        :value="payInfo.ChoosePayment"
                      />
                      <input
                        type="hidden"
                        name="EncryptType"
                        :value="payInfo.EncryptType"
                      />
                      <input
                        type="hidden"
                        name="ClientBackURL"
                        :value="payInfo.ClientBackURL"
                      />
                      <input
                        type="hidden"
                        name="OrderResultURL"
                        :value="payInfo.OrderResultURL"
                      />
                      <input
                        type="hidden"
                        name="CheckMacValue"
                        :value="payInfo.CheckMacValue"
                      />
                    <button v-if="selectedPaymentMethod === 'creditCard'" type="button" class="btn btn-primary comenextBtn mt-4"
                            id="payButton" @click="submitPayment">
                      前往信用卡結帳頁面
                    </button>
                    <div v-else-if="selectedPaymentMethod === 'cash'">
                    <label>
                    <input type="checkbox" v-model="agreeToCreateOrder" class="mt-4" />
                    我同意建立訂單
                  </label>
                    <button v-if="showCheckoutButton"  @click="checkoutSuccess" type="button"
                            class="btn btn-primary comenextBtn ms-2 mt-4">
                      結帳
                    </button>
                    </div>
                  </form>
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
import { onMounted, ref, computed,reactive, watch } from "vue";
import { useRoute, useRouter } from "vue-router";
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";
import router from "@/router";
import { useShoesRoute } from "@/stores/useShoesRoute.js";
import Swal from "sweetalert2/dist/sweetalert2.js";

const shoesStore = useShoesRoute();
const optionsAll = ref("");
const shoesOrderDetail = ref({});
const shoesDetail = ref({});
const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const route = useRoute();
const agreeToCreateOrder = ref(false); // 勾選框的狀態
const showCheckoutButton = ref(false);

const selectedPaymentMethod = ref("creditCard"); // 預設選中信用卡結帳

// 根據勾選框的狀態更新 showCheckoutButton 標誌
watch(agreeToCreateOrder, (newVal) => {
  if (newVal) {
    // 當勾選框被勾選時，執行 intoOrder 函式
    ShoestoOrder();
  }  
  showCheckoutButton.value = newVal;
});

const totalPrice = computed(() => {
  return shoesOrderDetail.qty * shoesOrderDetail.shoesUnitPrice;
});

//塞入資料到訂單裡
const shoesUri = `${baseAddress}api/CustomeShoes/IntoOrder`;
//const shoesdataUri = `${baseAddress}api/CustomeShoes/IntoShoesProduct`;



//塞入資料進訂單
var orderData = {};
function ShoestoOrder()
{
  if (!agreeToCreateOrder.value) {
    // 如果勾選框未被選中，不執行建立訂單操作
    return;
  }else{
  orderData.fk_member_Id = parseInt(IdData.memberId);
  orderData.total_quantity = shoesdata.qty;
  orderData.cellphone = member.mobile;
  orderData.receiver = member.name;
  orderData.recipient_address = member.commonAddress;
  orderData.total_price = shoesdata.qty * shoesdata.shoesUnitPrice;
  orderData.pay_method_Id = 1;
  orderData.order_status_Id = 1;
  orderData.pay_status_Id = 3;
  orderData.freight = 60;
  orderData.fk_typeId = 4;
  orderData.order_description = "客製化";
  orderData.product_name = product.shoesName;
  orderData.per_price = product.shoesUnitPrice;
  orderData.quantity = shoesdata.qty;
  orderData.Items_description = product.shoesDescription;
  orderData.discount_name = "無";
  orderData.subtotal = 0;
  orderData.discount_subtotal = 0;
  console.log(orderData)
  axios
    .post(shoesUri, orderData)
    .then((res)=>{
      //console.log(res.data)
    })
    .catch((error)=>{
      console.error("POST request error:", error);
    })
  }
}


//抓取網頁登入資料
const IdInfo = localStorage.getItem('loggedInUser');
console.log(IdInfo);
const IdData = JSON.parse(IdInfo);
const memberId = IdData.memberId;

console.log(memberId);

//傳給後端資料
const payInfo = reactive({
    MerchantID:"",
    MerchantTradeNo:"",
    MerchantTradeDate:"",
    PaymentType:"",
    TotalAmount:"",
    TradeDesc:"",
    ItemName:"",
    ReturnURL:"",
    ChoosePayment:"",
    EncryptType:"",
    ClientBackURL:"",
    CheckMacValue:"",
    OrderResultURL:""
})
//console.log(payInfo)

//傳給後端會員資料
const member = reactive({
    name:"",
    gender:"",
    commonAddress:"",
    mobile:"",
    email:"",
    birthday:""
})

//傳給後端商品資料
const product = reactive({
    shoesProductId:"",
    shoesName:"",
    shoesDescription:"",
    shoesUnitPrice:""
})


const shoesdata = reactive({
  qty:"",
  shoesUnitPrice:"",
})
console.log(shoesdata)

//把會員編號傳給後單，自動帶入會員資料
const loadMember = async (id) => {
  axios
    .get(`https://localhost:7183/api/Activity/SignUp${id}`)
    .then((res) => {
      //console.log(res.data);
      const datas = res.data;
      member.name = datas.name;
      member.commonAddress = datas.commonAddress;
      member.mobile = datas.mobile;
      member.email = datas.email;
      member.birthday = datas.birthday;
      member.gender = datas == true ? "男" : "女";
      //console.log(member.gender);
    })
    .catch((err) => {
      console.log(err);
    });
};
loadMember(memberId);


//結帳完返回商品頁
const isCheckoutInProgress = ref(false);

const checkoutSuccess = async () => {
  if (isCheckoutInProgress.value) return;

  isCheckoutInProgress.value = true;

  try {
    // ... 您的結帳邏輯 ...

    // 顯示SweetAlert對話框
    await Swal.fire({
      title: "恭喜結帳成功",
      text: "3秒後跳轉回商品頁面",
      icon: "success",
      timer: 3000,
      showConfirmButton: false,
    });
    // 模擬延遲
    await new Promise(resolve => setTimeout(resolve, 3000));

    // 返回商品頁面
    router.push('/CustomeShoes');
  } catch (error) {
    console.log(error)
  } finally {
    isCheckoutInProgress.value = false;
  }
};

//抓shoes api資料
let getshoesData = async (id) => {

    await axios.get(
       `${baseAddress}api/CustomeShoes/shoes/Detail/${id}`
    )
    .then(res=>{
    //console.log(res.data);
    shoesDetail.value = res.data;
    product.shoesName = res.data.shoesName;
    product.shoesUnitPrice = res.data.shoesUnitPrice;
    product.shoesDescription = res.data.shoesDescription;
    product.shoesProductId = res.data.shoesProductId

    }).catch(error=>{console.log(error)})}
  

    const activityId = 1;
    console.log(activityId);


//從後端得到綠界需要的參數資訊
axios.get(`https://localhost:7183/api/Payment/Shoes/${activityId}`)

    .then(res=>{
        console.log(res.data);
        console.log(res);
        const payresult = res.data;
        payInfo.MerchantID = payresult.MerchantID;
        console.log("畫面的ID="+payInfo.MerchantID);
        payInfo.MerchantTradeNo = payresult.MerchantTradeNo;
        payInfo.MerchantTradeDate = payresult.MerchantTradeDate;
        payInfo.PaymentType = payresult.PaymentType;
        payInfo.TradeDesc = payresult.TradeDesc;
        payInfo.ItemName = payresult.ItemName;
        payInfo.ReturnURL = payresult.ReturnURL;
        payInfo.ChoosePayment = payresult.ChoosePayment;
        payInfo.EncryptType = payresult.EncryptType;
        payInfo.ClientBackURL = payresult.ClientBackURL;
        payInfo.CheckMacValue = payresult.CheckMacValue;
        payInfo.OrderResultURL = payresult.OrderResultURL;
        payInfo.TotalAmount = payresult.TotalAmount; 
    })
    .catch(err=>{
        console.log(err);
    })
  

    //將會員資料傳到後台
    const submitPayment = () => {
              const formElement = document.querySelector("#payForm");
          if (formElement) {
            formElement.submit();
          } else {
            console.error("找不到表单元素。");
          }
        const formData = {
            MemberID:memberId,
            MerchantTradeNo:payInfo.MerchantTradeNo,
            MerchantID:payInfo.MerchantID,
            TotalAmount:payInfo.TotalAmount,
            MerchantTradeDate:payInfo.MerchantTradeDate,
            PaymentType:payInfo.PaymentType,
            CheckMacValue:payInfo.CheckMacValue,
            ItemName:payInfo.ItemName,
            TradeDesc:payInfo.TradeDesc,
            ActivityId:activityId
        };
        console.log(formData);
        //把訂單資訊傳給後端進資料庫
        axios.post("https://localhost:7183/api/Payment/addOrder", formData)
            .then(res=>{
                //console.log(res.data);
            })
            .catch(err=>{
                console.log(err);
       })
    };

let getData = async () => {
  try {
    const response = await axios.get(
      `${baseAddress}api/CustomeShoes/shoes/Customization/Order/${route.params.ShoesOrderId}`
    );
    console.log(response.data.shoesProductId);
    shoesOrderDetail.value = response.data;
    //console.log(response.data)
    shoesdata.qty = response.data.qty;
    shoesdata.shoesUnitPrice = response.data.shoesUnitPrice;
    optionsAll.value = shoesOrderDetail.value.shoesAllOptions[0]
    getshoesData(response.data.shoesProductId);
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