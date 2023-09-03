<template>
  <div class="loading-block" :class="{ 'd-none': !loading }">
    <div class="loading"></div>
  </div>
  <header class="header">
    <a href="/" class="img-wrapper">
      <img src="@/../public/LOGO/FlexLogoDark.png" alt="" />
    </a>
    <div class="buy-header-right">
      <div class="d-none d-lg-block">客服專線:0800-000-000</div>
      <a href="/cart" class="icon"><i class="bi bi-bag"></i></a>
    </div>
  </header>
  <main>
    <div class="container">
      <div class="row gx-5">
        <div class="buy-info col-12 col-lg-7">
          <form action="" method="post">
            <!-- 寄送資訊 -->
            <div id="step-1-area" class="step-area">
              <h2>輸入你的聯絡資訊:</h2>
              <div class="input-wrapper">
                <input type="text" name="ContactInfo.ContactName" id="contact-name" placeholder="姓名" v-if="cart"
                  v-model="cart.checkoutData.contactInfo.contactName" />
                <span>姓名</span>
              </div>
              <div class="input-wrapper d-none">
                <input type="text" name="ContactInfo.PostalCode" id="postal-code" placeholder="郵遞區號" v-if="cart"
                  v-model="cart.checkoutData.contactInfo.postalCode" />
                <span>郵遞區號</span>
              </div>
              <div class="input-wrapper">
                <input type="text" name="ContactInfo.Address" id="address" placeholder="地址" v-if="cart"
                  v-model="cart.checkoutData.contactInfo.address" />
                <span>地址</span>
                <div class="address-area">
                  <button id="address-btn" type="button">變更地址</button>
                  <ul id="address-box">
                    <li>
                      <h2>已儲存地址</h2>
                    </li>
                    <li class="address-option" v-if="addresses.commonAddress != '' &&
                      addresses.commonAddress != null
                      ">
                      {{ addresses.commonAddress }}
                    </li>
                    <li class="address-option" v-if="addresses.alternateAddress1 != '' &&
                      addresses.alternateAddress1 != null
                      ">
                      {{ addresses.alternateAddress1 }}
                    </li>
                    <li class="address-option" v-if="addresses.alternateAddress2 != '' &&
                      addresses.alternateAddress2 != null
                      ">
                      {{ addresses.alternateAddress2 }}
                    </li>
                  </ul>
                </div>
              </div>
              <div class="input-wrapper">
                <input type="email" name="ContactInfo.Email" id="email" placeholder="電子郵件" v-if="cart"
                  v-model="cart.checkoutData.contactInfo.email" />
                <span>電子郵件</span>
              </div>
              <div class="input-wrapper">
                <input type="tel" name="ContactInfo.Phone" id="phone" placeholder="電話號碼" v-if="cart"
                  v-model="cart.checkoutData.contactInfo.phone" />
                <span>電話號碼</span>
              </div>
              <button type="button" id="next-step-btn-1" class="change-step-btn next-step-btn" target-step="1"
                :disabled="step1Disabled">
                繼續
              </button>
            </div>
            <!-- 帳單 -->
            <div id="step-2-area" class="step-area">
              <h2>輸入你的帳單地址:</h2>
              <label class="same-address-label buy-label">
                <input type="checkbox" id="bill-same-address" class="buy-checkbox" checked />
                帳單地址同送貨地址
              </label>
              <div id="different-address-area">
                <div class="input-wrapper">
                  <input type="text" name="BillingAddress.Name" id="bill-name" placeholder="姓名" />
                  <span>姓名</span>
                </div>
                <!-- <div class="input-wrapper d-none">
                  <input
                    type="text"
                    name="BillingAddress.PostalCode"
                    id="bill-postal-code"
                    placeholder="郵遞區號"
                  />
                  <span></span>
                </div> -->
                <div class="input-wrapper">
                  <input type="text" name="BillingAddress.Address" id="bill-address" placeholder="地址" />
                  <span>地址</span>
                </div>
                <div class="input-wrapper">
                  <input type="tel" name="BillingAddress.Phone" id="bill-phone" placeholder="電話號碼" />
                  <span>電話號碼</span>
                </div>
              </div>
              <button type="button" id="next-step-btn-2" class="change-step-btn next-step-btn" target-step="2">
                繼續
              </button>
            </div>
            <!-- 付款 -->
            <div id="step-3-area" class="step-area">
              <h2>使用優惠券?</h2>
              <a @click="showCouponAreaEventHandler" href="javascript:;" class="choose-coupon">選擇優惠券</a>
              <div class="used-coupon">
                <p v-if="cart?.coupon" class="show-coupon-info">
                  {{ cart.coupon.name }}，折抵{{ cart?.couponValue }} 元
                </p>
              </div>
              <h2>付款方式</h2>
              <input type="hidden" name="payment-method" id="payment-method" value="credit-card" />
              <div class="pay-by-select">
                <div class="pay-by-btn" :class="{ active: btn1Active }" @click="activeBtn(1)" data-value="credit-card">
                  <i class="bi bi-credit-card"></i>
                  信用卡或金融簽帳卡
                </div>
                <div class="pay-by-btn" @click="ECPay" :class="{ active: btn2Active }" data-value="credit-card">
                  <div class="pay-by-btn-img">
                    <img src="@/../public/imgs/payLogo/ecpay_fb.png" alt="" />
                  </div>
                  綠界支付
                </div>
              </div>
              <div class="payment-area" :class="{ active: btn1Active }">
                <h2>詳細付款資訊:</h2>
                <div class="pay-info-area">
                  <div class="input-wrapper">
                    <input type="text" name="PaymentInfo.CardName" id="card-name" placeholder="Name on card" v-if="cart"
                      v-model="cart.checkoutData.paymentInfo.cardName" @blur="validateCardName" />
                    <span>Name on card</span>
                    <div class="valid-text">
                      <p v-if="!isCardNameValid" class="text-danger">信用卡姓名無效</p>
                    </div>
                  </div>
                  <div class="input-wrapper">
                    <input type="tel" name="PaymentInfo.CardNumber" id="card-number" placeholder="Card Number" v-if="cart"
                      v-model="creditCardNumber" @focus="removeSpacesOnFocus" @blur="validateCreditCard" />
                    <span>Card Number</span>
                    <div class="valid-text">
                      <p v-if="!isCreditCardValid" class="text-danger">信用卡卡號無效</p>
                    </div>
                  </div>
                  <div class="row row-cols-2">
                    <div class="input-wrapper">
                      <input type="text" name="PaymentInfo.Expiration" id="expiration" placeholder="MM/YY" v-if="cart"
                        v-model="cart.checkoutData.paymentInfo.expiration" @blur="validateExpiration" />
                      <span>MM/YY</span>
                      <div class="valid-text">
                        <p v-if="!isExpirationValid" class="text-danger">信用卡有效期無效</p>
                      </div>
                    </div>
                    <div class="input-wrapper">
                      <input type="tel" name="PaymentInfo.CVV" id="cvv" placeholder="CVV" v-if="cart"
                        v-model="cart.checkoutData.paymentInfo.cvv" maxlength="3" @blur="validateCvv" />
                      <span>CVV</span>
                      <div class="valid-text">
                        <p v-if="!isCvvValid" class="text-danger">CVV無效</p>
                      </div>
                    </div>
                  </div>
                  <label class="confirm-terms-label buy-label">
                    <input type="checkbox" id="confirm-terms" class="buy-checkbox" v-model="termsChecked" />
                    確認你同意 Flex 付款的 <a href="javascript:;">條款與條件</a>
                  </label>
                  <button @click="checkoutEventHandler" type="button" id="send-order" class="next-step-btn"
                    :disabled="checkoutDisabled">
                    下訂單
                  </button>
                </div>
              </div>
              <form id="payForm" class="payment-area mt-5" :class="{ active: btn2Active }"
                action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5" method="post">
                <input type="hidden" name="MerchantID" :value="payinfo.MerchantID" />
                <input type="hidden" name="MerchantTradeNo" :value="payinfo.MerchantTradeNo" />
                <input type="hidden" name="MerchantTradeDate" :value="payinfo.MerchantTradeDate" />
                <input type="hidden" name="PaymentType" :value="payinfo.PaymentType" />
                <input type="hidden" name="TotalAmount" :value="payinfo.TotalAmount" />
                <input type="hidden" name="TradeDesc" :value="payinfo.TradeDesc" />
                <input type="hidden" name="ItemName" :value="payinfo.ItemName" />
                <input type="hidden" name="ReturnURL" :value="payinfo.ReturnURL" />
                <input type="hidden" name="ChoosePayment" :value="payinfo.ChoosePayment" />
                <input type="hidden" name="EncryptType" :value="payinfo.EncryptType" />
                <input type="hidden" name="ClientBackURL" :value="payinfo.ClientBackURL" />
                <input type="hidden" name="OrderResultURL" :value="payinfo.OrderResultURL" />
                <input type="hidden" name="CheckMacValue" :value="payinfo.CheckMacValue" />
                <input type="hidden" name="CustomField1" :value="payinfo.CustomField1" />
                <input type="hidden" name="CustomField2" :value="payinfo.CustomField2" />
                <input type="hidden" name="CustomField3" :value="payinfo.CustomField3" />
                <input type="hidden" name="CustomField4" :value="payinfo.CustomField4" />
                <label class="confirm-terms-label buy-label">
                  <input type="checkbox" id="confirm-terms2" class="buy-checkbox" v-model="termsChecked2" />
                  確認你同意 Flex 付款的 <a href="javascript:;">條款與條件</a>
                </label>
                <button type="button" class="next-step-btn" id="payButton" @click="submitPayment"
                  :disabled="checkout2Disabled">
                  下訂單
                </button>
              </form>
            </div>
          </form>
          <div class="sent-info-area">
            <div class="step-block">
              <h2>寄送資訊</h2>
              <div class="show-info">
                <!-- 姓名 -->
                <p>{{ cart?.checkoutData.contactInfo.contactName }}</p>
                <!-- 地址 -->
                <p>{{ cart?.checkoutData.contactInfo.address }}</p>
                <!-- Email -->
                <p>{{ cart?.checkoutData.contactInfo.email }}</p>
                <!-- 電話 -->
                <p>{{ cart?.checkoutData.contactInfo.phone }}</p>
                <button class="change-step-btn info-edit-btn" target-step="0">
                  編輯
                </button>
              </div>
            </div>
            <div class="step-block">
              <h2>帳單</h2>
              <div class="show-info">
                <!-- 姓名 -->
                <p>{{ cart?.checkoutData.billingAddress.name }}</p>
                <!-- 地址 -->
                <p>{{ cart?.checkoutData.billingAddress.address }}</p>
                <!-- 電話 -->
                <p>{{ cart?.checkoutData.billingAddress.phone }}</p>
                <button class="change-step-btn info-edit-btn" target-step="1">
                  編輯
                </button>
              </div>
            </div>
            <div class="step-block">
              <h2>付款</h2>
            </div>
          </div>
        </div>
        <div class="buy-summary col-12 col-lg-5" :class="{ active: summaryActive }">
          <div class="mb-5">
            <div class="buy-summary-btn" @click="summaryActiveToggle">
              <h2>訂單摘要</h2>
              <div class="d-block d-lg-none">
                {{ formatter.format(cart ? cart.totalPrice : 0) }}({{
                  cart ? cart.cartItems.length : 0
                }}項商品)<i class="bi bi-chevron-down fw-bold"></i>
              </div>
            </div>
            <div class="buy-summary-all-info">
              <div class="w-100">
                <div class="d-flex buy-summary-item">
                  <div class="me-auto">小計</div>
                  <div v-if="cart">
                    {{ formatter.format(cart.originalTotalAmount) }}
                  </div>
                </div>
                <div class="d-flex buy-summary-item">
                  <div>商品折扣</div>
                  <div class="hint me-auto">
                    ?<span>此折扣尚未包含優惠券</span>
                  </div>
                  <div v-if="cart" class="text-danger">
                    {{
                      formatter.format(
                        cart.originalTotalAmount -
                        cart.totalPrice +
                        cart.deliveryFee -
                        (cart.coupon && cart.coupon.discountType !== 2
                          ? cart.couponValue
                          : 0)
                      )
                    }}
                  </div>
                </div>
                <div class="d-flex buy-summary-item">
                  <div class="me-auto">運費</div>
                  <div v-if="cart">
                    {{ formatter.format(cart.deliveryFee) }}
                  </div>
                </div>
                <hr />
                <div class="d-flex buy-summary-item">
                  <div class="me-auto">總計</div>
                  <div v-if="cart">{{ formatter.format(cart.totalPrice) }}</div>
                </div>
              </div>

              <div class="order-item-area">
                <h2 class="mb-4">訂單詳情</h2>
                <ul>
                  <li v-if="cart" v-for="item in cart.cartItems" :key="item.cartItemId" class="d-flex mb-4">
                    <div class="item-img-wrapper me-2">
                      <img :src="imgBaseUrl + 'Public/Img/' + item.product.imgPath" alt="" />
                    </div>
                    <div class="item-info">
                      <div class="text-black fw-bold title">
                        {{ item.product.productName }}
                      </div>
                      <div v-if="item.product.matchDiscounts.length != 0" class="d-flex text-black">
                        適用折扣:
                        <ul class="d-flex">
                          <li class="me-1 text-black" v-for="matchDiscount in item.product.matchDiscounts"
                            :key="matchDiscount.discountId">
                            {{ matchDiscount.discountName }}
                          </li>
                        </ul>
                      </div>
                      <div class="text-secondary">
                        規格:{{ item.product.color }} 尺寸:{{
                          item.product.size
                        }}
                      </div>
                      <div class="text-secondary">數量: {{ item.qty }}</div>
                      <div class="text-secondary">
                        {{ formatter.format(item.subTotal) }}
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="buy-summary-shadow" @click="closeSummaryActive"></div>
      </div>
    </div>
    <div @click.self="hideCouponAreaEventHandler" id="coupon-area-bg" :class="{ active: isActive }">
      <div id="coupon-area">
        <i @click="hideCouponAreaEventHandler" class="bi bi-x"></i>
        <div id="coupon-header">
          <h2 class="me-auto">使用優惠券</h2>
          <span>可選擇一張</span>
        </div>
        <ul class="coupon-list">
          <li v-if="coupons.length != 0" v-for="coupon in coupons" :key="coupon.sendingId" :class="[
            'coupon-item',
            {
              disabled:
                cart &&
                coupon.discountType == 2 &&
                cart.deliveryFee == 0 &&
                (!cart.coupon?.discountType || cart.coupon.discountType != 2),
            },
          ]" :data-id="coupon.sendingId" @click="selectCouponEventHandler">
            <div class="coupon-body">
              <div class="coupon-top"></div>
              <div class="coupon-bottom"></div>
              <div class="coupon-discount-box">
                <div v-if="coupon.discountType == 2" class="coupon-discount">
                  免運費
                </div>
                <div v-else-if="coupon.discountType == 1" class="coupon-discount">
                  {{
                    coupon.discountValue % 10 == 0
                    ? 10 - coupon.discountValue / 10
                    : 100 - coupon.discountValue
                  }}折
                </div>
                <div v-else-if="coupon.discountType == 0" class="coupon-discount">
                  {{ coupon.discountValue }}元
                </div>
              </div>
              <div class="coupon-info">
                <div class="d-flex">
                  <h3 class="me-auto">{{ coupon.couponName }}</h3>
                  <div v-if="cart &&
                    coupon.discountType == 2 &&
                    cart.deliveryFee == 0 &&
                    (!cart.coupon?.discountType ||
                      cart.coupon.discountType != 2)
                    " class="danger-info text-danger">
                    無法使用 已達免運標準
                  </div>
                </div>
                <div class="d-flex">
                  <div class="description">
                    滿 {{ coupon.minimumPurchaseAmount }} 元可用
                  </div>
                </div>

                <div class="coupon-date-limit">
                  使用期間 {{ coupon.startDateStr }} ~ {{ coupon.endDateStr }}
                </div>
              </div>
            </div>
          </li>
          <li v-else class="w-100 h-100 d-flex justify-content-center align-items-center fs-4 text-gray">
            無可使用的優惠券
          </li>
        </ul>
        <div class="d-flex px-5">
          <div class="me-auto"></div>
          <button class="btn btn-secondary mt-4 me-3" @click="couponCXLEventHandler">
            不使用優惠券
          </button>
          <button @click="couponComfirmEventHandler" id="coupon-comfirm-btn" class="btn btn-primary mt-4" disabled>
            確定
          </button>
        </div>
      </div>
    </div>
  </main>
  <HomeFooter></HomeFooter>
</template>
    
<script setup lang='ts'>
import axios from "axios";
import { Input } from "postcss";
import {
  ref,
  onMounted,
  onUpdated,
  reactive,
  computed,
  toRaw,
  watch,
} from "vue";
import HomeFooter from "@/components/home/footer.vue";
import { CartItem, ShoppingCart, Member, Coupon, PayInfo } from "@/types/type";
import Swal from "sweetalert2";
// 用vite獲得環境變數
const baseAddress: string = import.meta.env.VITE_API_BASEADDRESS;

const loggedInUser = localStorage.getItem("loggedInUser")!;
const memberInfo = JSON.parse(loggedInUser);
const memberId: number = memberInfo.memberId;
const cart = ref<ShoppingCart>();
const cartItems = ref<CartItem[]>([]);
const member = ref<Member>();
const coupons = ref<Coupon[]>([]);
const imgBaseUrl = ref(baseAddress);
const addresses = ref({
  commonAddress: "",
  alternateAddress1: "",
  alternateAddress2: "",
});
const loading = ref<boolean>(true);
const isActive = ref(false);
const step1Disabled = ref<boolean>(false);
const termsChecked = ref<boolean>(false);
const termsChecked2 = ref<boolean>(false);
const checkoutDisabled = ref<boolean>(
  !cart.value ||
  cart.value.checkoutData.paymentInfo.cardName == null ||
  cart.value.checkoutData.paymentInfo.cardName == "" ||
  cart.value.checkoutData.paymentInfo.cardNumber == null ||
  cart.value.checkoutData.paymentInfo.cardNumber == "" ||
  cart.value.checkoutData.paymentInfo.expiration == null ||
  cart.value.checkoutData.paymentInfo.expiration == "" ||
  cart.value.checkoutData.paymentInfo.cvv == null ||
  cart.value.checkoutData.paymentInfo.cvv == "" ||
  !termsChecked.value
);
const checkout2Disabled = ref<boolean>(!termsChecked.value);
const summaryActive = ref<boolean>(false);
const creditCardNumber = ref('');
let formattedNumber = '';
const isCreditCardValid = ref<boolean>(true);
const isCardNameValid = ref<boolean>(true);
const isExpirationValid = ref<boolean>(true);
const isCvvValid = ref<boolean>(true);

// 正規表達式
const cardNameRegex = /^[A-Za-z\s]+$/; // 姓名
const creditCardNumberRegex = /^[0-9]{16}$/; // 信用卡卡號
const expirationRegex = /^(0[1-9]|1[0-2])(0[0-9]|1[0-9]|2[2-9])$/; // 信用卡有效期限
const cvvRegex = /^[0-9]{3}$/; // CVV

const validateCardName = () => {
  if (cart.value) {
    isCardNameValid.value = cardNameRegex.test(cart.value.checkoutData.paymentInfo.cardName);
  }
};
const validateExpiration = () => {
  let expiration = '';
  if (cart.value) {
    expiration = cart.value.checkoutData.paymentInfo.expiration;
  }
  if (expirationRegex.test(expiration)) {
    const currentYear = new Date().getFullYear() % 100; // 获取当前的两位数年份
    const currentMonth = new Date().getMonth() + 1; // 获取当前的月份，注意要加 1 因为月份是从 0 到 11

    const month = parseInt(expiration.substring(0, 2), 10);
    const year = parseInt(expiration.substring(2, 4), 10);

    if (year > currentYear || (year === currentYear && month >= currentMonth)) {
      // 有效期在当前日期之后或者是当前日期之后的同一年的月份
      isExpirationValid.value = true;
    } else {
      // 有效期在当前日期之前，无效
      isExpirationValid.value = false;
    }
  } else {
    // 格式不合法
    isExpirationValid.value = false;
  }
};

const validateCvv = () => {
  if (cart.value) {
    isCvvValid.value = cvvRegex.test(cart.value.checkoutData.paymentInfo.cvv);
  }
};
const formatCreditCardNumber = () => {
  // 在每四個數字後插入一個空格
  formattedNumber = creditCardNumber.value.replace(/\s/g, '').replace(/(.{4})/g, '$1 ');
  if (cart.value) {
    cart.value.checkoutData.paymentInfo.cardNumber = formattedNumber;
  }

  // 更新信用卡卡號
  creditCardNumber.value = formattedNumber;
};

const removeSpacesOnFocus = () => {
  // 在焦點時去除所有空格
  formattedNumber = creditCardNumber.value.replace(/\s/g, '');
  creditCardNumber.value = formattedNumber;
};

const validateCreditCard = () => {
  const strippedNumber = creditCardNumber.value.replace(/\s/g, '');
  if (creditCardNumberRegex.test(strippedNumber)) {
    // 信用卡卡號有效
    isCreditCardValid.value = true;
  } else {
    // 信用卡卡號無效，可以在這裡執行錯誤處理邏輯
    isCreditCardValid.value = false;
  }
  formatCreditCardNumber();
};
const summaryActiveToggle = () => {
  summaryActive.value = !summaryActive.value;
};
const closeSummaryActive = () => {
  summaryActive.value = false;
};
// 載入購物車
const loadCartItems = async () => {
  let url: string = `${baseAddress}api/Cart`;
  await axios
    .post<CartItem[]>(url, memberId, {
      headers: {
        "Content-Type": "application/json",
      },
    })
    .then((response) => {
      cartItems.value = response.data;
      loadCart(loadMember);
    })
    .catch((error) => {
      alert(error);
    });
};

loadCartItems();
//
const loadCart = async (callback?: () => Promise<void>): Promise<void> => {
  let url: string = `${baseAddress}api/Cart/GetTotalAmount`;
  const request = {
    CartItems: cartItems.value,
    memberId: memberId,
  };
  await axios
    .post<ShoppingCart>(url, request, {
      headers: {
        "Content-Type": "application/json",
      },
    })
    .then((response) => {
      cart.value = response.data;
      callback?.();
    })
    .catch((error) => {
      alert(error);
    });
};

const loadMember = async (): Promise<void> => {
  let url: string = `${baseAddress}api/Users/${memberId}`;
  await axios
    .get<Member>(url)
    .then((response) => {
      member.value = response.data;
      if (cart.value?.checkoutData?.contactInfo) {
        cart.value.checkoutData.contactInfo.contactName = response.data.name;
        cart.value.checkoutData.contactInfo.address =
          response.data.commonAddress;
        cart.value.checkoutData.contactInfo.email = response.data.email;
        cart.value.checkoutData.contactInfo.phone = response.data.mobile;
        cart.value.checkoutData.contactInfo.postalCode = "";
        cart.value.memberId = response.data.memberId;
      }

      addresses.value.commonAddress = response.data.commonAddress;
      addresses.value.alternateAddress1 = response.data.alternateAddress1;
      addresses.value.alternateAddress2 = response.data.alternateAddress2;
      loading.value = false;
    })
    .catch((error) => {
      alert(error);
    });
};

const loadCoupons = async (): Promise<void> => {
  let url: string = `${baseAddress}api/Cart/GetMemberAllCoupons`;
  await axios
    .post<Coupon[]>(url, memberId, {
      headers: {
        "Content-Type": "application/json",
      },
    })
    .then((response) => {
      coupons.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};

// 判斷input的title是否秀出來
function updateTitleVisibility(
  input: HTMLInputElement,
  title: HTMLElement
): void {
  if (input.value !== "") {
    title.classList.add("d-block");
    title.classList.remove("d-none");
  } else {
    title.classList.remove("d-block");
    title.classList.add("d-none");
  }
}

// 處理input的聚焦及失焦事件
function attachInputEventHandlers(
  input: HTMLInputElement,
  title: HTMLElement,
  originalPlaceholder: string
): void {
  input.addEventListener("focus", function () {
    input.removeAttribute("placeholder");
    title.classList.add("d-block");
    title.classList.remove("d-none");
  });

  input.addEventListener("blur", function () {
    input.setAttribute("placeholder", originalPlaceholder);
    updateTitleVisibility(input, title);
  });
}

function updateBillingAddressFromContactInfo() {
  const checkbox = document.querySelector(
    "#bill-same-address"
  ) as HTMLInputElement;

  if (checkbox.checked && cart.value?.checkoutData?.contactInfo) {
    cart.value.checkoutData.billingAddress.name =
      cart.value.checkoutData.contactInfo.contactName;
    cart.value.checkoutData.billingAddress.postalCode =
      cart.value.checkoutData.contactInfo.postalCode;
    cart.value.checkoutData.billingAddress.address =
      cart.value.checkoutData.contactInfo.address;
    cart.value.checkoutData.billingAddress.phone =
      cart.value.checkoutData.contactInfo.phone;
  } else {
    if (cart.value?.checkoutData?.contactInfo) {
      const billName = document.querySelector("#bill-name") as HTMLInputElement;
      // const billPostalCode = document.querySelector(
      //   "#bill-postal-code"
      // ) as HTMLInputElement;
      const billAddress = document.querySelector(
        "#bill-address"
      ) as HTMLInputElement;
      const billPhone = document.querySelector(
        "#bill-phone"
      ) as HTMLInputElement;
      cart.value.checkoutData.billingAddress.name = billName.value;
      // cart.value.checkoutData.billingAddress.postalCode = billPostalCode.value;
      cart.value.checkoutData.billingAddress.address = billAddress.value;
      cart.value.checkoutData.billingAddress.phone = billPhone.value;
    }
  }
}
function showAddressBoxEventHandler() {
  const addressBox = document.querySelector("#address-box")!;
  addressBox.classList.add("active");
}
function hideAddressBoxEventHandler() {
  const addressBox = document.querySelector("#address-box")!;
  addressBox.classList.remove("active");
}
const toggleAddressBoxEventHandler = () => {
  const addressBox = document.querySelector("#address-box")!;
  addressBox.classList.toggle("active");
};

const showCouponAreaEventHandler = () => {
  isActive.value = true;
  toggleActive();
};
function hideCouponAreaEventHandler() {
  isActive.value = false;
  toggleActive();
}

const toggleActive = () => {
  if (isActive.value) {
    document.body.style.overflow = "hidden";
  } else {
    document.body.style.overflow = "";
  }
};

const clearCouponSelected = (items: NodeListOf<Element>) => {
  items.forEach((item) => {
    item.classList.remove("selected");
  });
};

const selectCouponEventHandler = (event: MouseEvent) => {
  const couponItems = document.querySelectorAll(".coupon-item");
  const couponBtn = document.querySelector(
    "#coupon-comfirm-btn"
  ) as HTMLButtonElement;
  if ((event.currentTarget as HTMLElement).classList.contains("disabled")) {
    return;
  }
  clearCouponSelected(couponItems);
  (event.currentTarget as HTMLElement).classList.add("selected");
  couponBtn.disabled = document.querySelectorAll(".selected").length != 1;
};
const couponCXLEventHandler = () => {
  const couponItems = document.querySelectorAll(".coupon-item");
  couponItems.forEach((item) => {
    item.classList.remove("selected");
  });
  couponComfirmEventHandler();
};

const couponComfirmEventHandler = () => {
  const dataId = document
    .querySelector(".selected")
    ?.getAttribute("data-id") as string;
  const couponId = parseInt(dataId);

  let request: object = {};
  const cartItemIds: number[] = [];
  if (cart.value) {
    cart.value.cartItems.forEach((item) => {
      cartItemIds.push(item.cartItemId);
    });
    request = {
      MemberId: cart.value.memberId,
      CartItemIds: cartItemIds,
      CouponId: couponId,
    };
    cart.value.coupon = new Coupon();
    cart.value.coupon.sendingId = couponId;
  }
  const headers = {
    "Content-Type": "application/json",
  };
  axios
    .post<ShoppingCart>(`${baseAddress}api/Cart/LoadCartAndCoupon`, request, {
      headers,
    })
    .then((response) => {
      if (cart.value) {
        cart.value.coupon = response.data.coupon;
        cart.value.couponValue = response.data.couponValue;
        cart.value.deliveryFee = response.data.deliveryFee;
        cart.value.totalPrice = response.data.totalPrice;
        cart.value.cartItems = response.data.cartItems;
        console.log(response.data.coupon);
      }
      hideCouponAreaEventHandler();
    })
    .catch((error) => {
      console.error(error);
    });
};

const formatter = new Intl.NumberFormat("zh-TW", {
  style: "currency",
  currency: "TWD",
  minimumFractionDigits: 0, // 最少保留小數位數
  maximumFractionDigits: 0, // 最多保留小數位數
});

const payinfo = ref<PayInfo>(new PayInfo());

const btn1Active = ref<boolean>(true);
const btn2Active = ref<boolean>(false);

const activeBtn = (num: number) => {
  if (num == 1) {
    btn1Active.value = true;
    btn2Active.value = false;
  } else if (num == 2) {
    btn1Active.value = false;
    btn2Active.value = true;
  }
}

const ECPay = async () => {
  const ids: number[] = [];
  cart.value?.cartItems.forEach((item) => {
    ids.push(item.cartItemId);
  });
  const request = {
    memberId: memberId,
    CartItemIds: ids,
    CouponId: null as null | number,
    checkoutData: {
      contactInfo: toRaw(cart.value?.checkoutData.contactInfo),
      billingAddress: toRaw(cart.value?.checkoutData.billingAddress),
      paymentInfo: toRaw(cart.value?.checkoutData.paymentInfo),
    },
  };
  if (request.checkoutData.paymentInfo) {
    request.checkoutData.paymentInfo.paymentMethod = 2;
  }
  if (cart.value?.coupon?.id) {
    request.CouponId = cart.value.coupon.sendingId;
  }

  await axios
    .post<PayInfo>(`${baseAddress}api/Payment/ProductMakePayment`, request)
    .then((response) => {
      payinfo.value = response.data;
      activeBtn(2);
      // paymentSubmit();
    })
    .catch((error) => {
      alert(error);
    });
};
const paymentSubmit = async () => {
  const request: PayInfo = {
    MerchantID: payinfo.value.MerchantID,
    MerchantTradeNo: payinfo.value.MerchantTradeNo,
    MerchantTradeDate: payinfo.value.MerchantTradeDate,
    PaymentType: payinfo.value.PaymentType,
    TotalAmount: payinfo.value.TotalAmount,
    TradeDesc: payinfo.value.TradeDesc,
    ItemName: payinfo.value.ItemName,
    ReturnURL: payinfo.value.ReturnURL,
    ChoosePayment: payinfo.value.ChoosePayment,
    EncryptType: payinfo.value.EncryptType,
    ClientBackURL: payinfo.value.ClientBackURL,
    CheckMacValue: payinfo.value.CheckMacValue,
    OrderResultURL: payinfo.value.OrderResultURL,
    CustomField1: payinfo.value.CustomField1,
  };
  console.log(request);

  await axios
    .post(`https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5`, request)
    .then((res) => {
      console.log(res.data);
    })
    .catch((err) => { });
};
const submitPayment = () => {
  document.querySelector("#payForm").submit();
}

const checkoutEventHandler = async () => {
  loading.value = true;
  const ids: number[] = [];
  cart.value?.cartItems.forEach((item) => {
    ids.push(item.cartItemId);
  });
  const request = {
    memberId: memberId,
    CartItemIds: ids,
    CouponId: null as null | number,
    checkoutData: {
      contactInfo: toRaw(cart.value?.checkoutData.contactInfo),
      billingAddress: toRaw(cart.value?.checkoutData.billingAddress),
      paymentInfo: toRaw(cart.value?.checkoutData.paymentInfo),
    },
  };
  if (request.checkoutData.paymentInfo) {
    request.checkoutData.paymentInfo.paymentMethod = 2;
  }
  if (cart.value?.coupon?.id) {
    request.CouponId = cart.value.coupon.sendingId;
  }

  await axios
    .post(`${baseAddress}api/Cart/Checkout`, request)
    .then((response) => {
      if (response.data.isSuccess) {
        setTimeout(() => {
          loading.value = false;
          Swal.fire({
            position: "center",
            icon: "success",
            title: "結帳成功",
            showConfirmButton: false,
            timer: 1500,
          });
          setTimeout(() => {
            window.location.href = "https://localhost:8080/";
          }, 1500);
        }, 2000);
      } else {
        loading.value = false;
        Swal.fire({
          icon: "error",
          title: "結帳失敗",
          text: `${response.data.errorMessage}`,
          footer: '<a href="/cart">回購物車?</a>',
        });
      }
    })
    .catch((error) => {
      alert(error);
    });
};

class FlexCheckoutProcess {
  private _step = 0;
  private _stepAreas = document.querySelectorAll(".step-area");
  private _showInfos = document.querySelectorAll(".show-info");
  private _stepBlock = document.querySelectorAll(".step-block");

  constructor() {
    // 初始化
    this.setupStep1();
    this.setupStep2();
    this.initBtnClickHandler();
  }

  get step(): number {
    return this._step;
  }
  set step(nextStep: number) {
    if (nextStep < 0) {
      this._step = 0;
    } else if (nextStep > 2) {
      this._step = 2;
    } else {
      this._step = nextStep;
    }
  }
  process(): void {
    for (let i = 0; i < this._stepAreas.length; i++) {
      const isStep = i === this.step;
      this._stepAreas[i].classList.toggle("d-block", isStep);
      this._stepAreas[i].classList.toggle("d-none", !isStep);
      this._stepBlock[i].classList.toggle("active", isStep);

      if (i < this._stepAreas.length - 1) {
        const shouldShowInfo = i < this.step;
        this._showInfos[i].classList.toggle("d-block", shouldShowInfo);
        this._showInfos[i].classList.toggle("d-none", !shouldShowInfo);
      }
      window.scrollTo({ top: 0, behavior: "smooth" });
    }
  }
  private initBtnClickHandler(): void {
    const changeStepBtns = document.querySelectorAll(
      ".change-step-btn"
    ) as NodeListOf<HTMLElement>;
    changeStepBtns.forEach((btn) => {
      btn.addEventListener("click", () => {
        this.setStep(btn);
      });
    });
  }
  private setStep(btn: HTMLElement): void {
    let stepNum = parseInt(btn.getAttribute("target-step")!);
    this.step = stepNum;
    this.process();
  }
  private setupStep1(): void {
    const nextStepBtn1 = document.querySelector(
      "#next-step-btn-1"
    ) as HTMLButtonElement;
    const step1Inputs = document.querySelectorAll(
      "#step-1-area .input-wrapper input"
    ) as NodeListOf<HTMLInputElement>;
    this.checkInputsAndToggle(step1Inputs, nextStepBtn1, true);
    this.setupInputListeners(step1Inputs, nextStepBtn1, true);
  }

  private setupStep2(): void {
    const nextStepBtn2 = document.querySelector(
      "#next-step-btn-2"
    ) as HTMLButtonElement;
    const billSameAddress = document.querySelector(
      "#bill-same-address"
    ) as HTMLInputElement;
    const differentAddressArea = document.querySelector(
      "#different-address-area"
    ) as HTMLElement;
    const step2Inputs = document.querySelectorAll(
      "#step-2-area .input-wrapper input"
    ) as NodeListOf<HTMLInputElement>;

    const updateStep2Elements = (): void => {
      this.checkInputsAndToggle(
        step2Inputs,
        nextStepBtn2,
        !billSameAddress.checked
      );
      differentAddressArea.classList.toggle(
        "d-block",
        !billSameAddress.checked
      );
      differentAddressArea.classList.toggle("d-none", billSameAddress.checked);
    };

    updateStep2Elements();
    billSameAddress.addEventListener("change", updateStep2Elements);
    this.setupInputListeners(
      step2Inputs,
      nextStepBtn2,
      billSameAddress.checked
    );
  }

  private checkInputsAndToggle(
    inputs: NodeListOf<HTMLInputElement>,
    btn: HTMLButtonElement,
    condition: boolean,
    defaultBtnDisabled: boolean = false
  ): void {
    const anyInputEmpty = Array.from(inputs).some(
      (input) => input.value.trim() === ""
    );
    btn.disabled = condition ? anyInputEmpty : defaultBtnDisabled;
  }

  private setupInputListeners(
    inputs: NodeListOf<HTMLInputElement>,
    btn: HTMLButtonElement,
    condition: boolean,
    defaultBtnDisabled: boolean = false
  ): void {
    inputs.forEach((input) => {
      input.addEventListener("keyup", () => {
        this.checkInputsAndToggle(inputs, btn, condition, defaultBtnDisabled);
      });
      input.addEventListener("change", () => {
        this.checkInputsAndToggle(inputs, btn, condition, defaultBtnDisabled);
      });
    });
  }
}
loadCoupons();

onMounted(() => {
  const nextStepBtn2 = document.querySelector("#next-step-btn-2");
  nextStepBtn2?.addEventListener("click", updateBillingAddressFromContactInfo);

  let flexCheckout = new FlexCheckoutProcess();
  flexCheckout.process();
  const addressBtn = document.querySelector("#address-btn");
  addressBtn?.addEventListener("click", (event) => {
    event.stopPropagation();
    toggleAddressBoxEventHandler();
  });
  step1Disabled.value =
    !cart.value ||
    cart.value.checkoutData.contactInfo.contactName == null ||
    cart.value.checkoutData.contactInfo.contactName == "" ||
    cart.value.checkoutData.contactInfo.address == null ||
    cart.value.checkoutData.contactInfo.address == "" ||
    cart.value.checkoutData.contactInfo.email == null ||
    cart.value.checkoutData.contactInfo.email == "" ||
    cart.value.checkoutData.contactInfo.phone == null ||
    cart.value.checkoutData.contactInfo.phone == "";

  checkoutDisabled.value =
    !cart.value ||
    cart.value.checkoutData.paymentInfo.cardName == null ||
    cart.value.checkoutData.paymentInfo.cardName == "" ||
    cart.value.checkoutData.paymentInfo.cardNumber == null ||
    cart.value.checkoutData.paymentInfo.cardNumber == "" ||
    cart.value.checkoutData.paymentInfo.expiration == null ||
    cart.value.checkoutData.paymentInfo.expiration == "" ||
    cart.value.checkoutData.paymentInfo.cvv == null ||
    cart.value.checkoutData.paymentInfo.cvv == "" ||
    !isCreditCardValid.value ||
    !isCardNameValid.value ||
    !isExpirationValid.value ||
    !isCvvValid.value ||
    !termsChecked.value;
});
watch(
  [
    () => cart.value?.checkoutData.paymentInfo.cardName,
    () => cart.value?.checkoutData.paymentInfo.cardNumber,
    () => cart.value?.checkoutData.paymentInfo.cvv,
    () => cart.value?.checkoutData.paymentInfo.expiration,
    () => termsChecked.value,
    () => isCreditCardValid.value,
    () => isCardNameValid.value,
    () => isExpirationValid.value,
    () => isCvvValid.value,
  ],
  () => {
    checkoutDisabled.value =
      !cart.value ||
      cart.value.checkoutData.paymentInfo.cardName == null ||
      cart.value.checkoutData.paymentInfo.cardName == "" ||
      cart.value.checkoutData.paymentInfo.cardNumber == null ||
      cart.value.checkoutData.paymentInfo.cardNumber == "" ||
      cart.value.checkoutData.paymentInfo.expiration == null ||
      cart.value.checkoutData.paymentInfo.expiration == "" ||
      cart.value.checkoutData.paymentInfo.cvv == null ||
      cart.value.checkoutData.paymentInfo.cvv == "" ||
      !isCreditCardValid.value ||
      !isCardNameValid.value ||
      !isExpirationValid.value ||
      !isCvvValid.value ||
      !termsChecked.value;
  }
);
watch(
  [
    () => termsChecked2.value,
  ],
  () => {
    checkout2Disabled.value = !termsChecked2.value;
  }
);

watch(
  [
    () => cart.value?.checkoutData.contactInfo.contactName,
    () => cart.value?.checkoutData.contactInfo.address,
    () => cart.value?.checkoutData.contactInfo.email,
    () => cart.value?.checkoutData.contactInfo.phone,
  ],
  () => {
    step1Disabled.value =
      !cart.value ||
      cart.value.checkoutData.contactInfo.contactName == null ||
      cart.value.checkoutData.contactInfo.contactName == "" ||
      cart.value.checkoutData.contactInfo.address == null ||
      cart.value.checkoutData.contactInfo.address == "" ||
      cart.value.checkoutData.contactInfo.email == null ||
      cart.value.checkoutData.contactInfo.email == "" ||
      cart.value.checkoutData.contactInfo.phone == null ||
      cart.value.checkoutData.contactInfo.phone == "";
  }
);

onUpdated(() => {
  const textInputs = document.querySelectorAll(
    ".input-wrapper > input"
  ) as NodeListOf<HTMLInputElement>;
  const textTitles = document.querySelectorAll(".input-wrapper > span");
  textInputs.forEach((input, index) => {
    const originalPlaceholder = textTitles[index].innerHTML!;
    const title = textTitles[index] as HTMLElement;
    updateTitleVisibility(input, title);
    attachInputEventHandlers(input, title, originalPlaceholder);
  });

  const addressOption = document.querySelectorAll(".address-option");
  const addressInput = document.querySelector("#address") as HTMLInputElement;
  addressOption.forEach((option) => {
    option.addEventListener("click", () => {
      if (cart.value?.checkoutData?.contactInfo) {
        cart.value.checkoutData.contactInfo.address = option.innerHTML;
      }
      hideAddressBoxEventHandler();
    });
  });
});
</script>
    
<style scoped lang="scss">
.loading-block {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1000;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100vw;
  height: 100vh;
  background-color: rgba($color: #fff, $alpha: 0.5);
  padding: 25vh 0 40vh;

  .loading {
    position: relative;
    width: 50px;
    height: 50px;
    border: 3.5px solid #000;
    border-top-color: rgba(0, 0, 0, 0.2);
    border-right-color: rgba(0, 0, 0, 0.2);
    border-bottom-color: rgba(0, 0, 0, 0.2);
    border-radius: 100%;

    animation: circle infinite 0.75s linear;
  }
}

@keyframes circle {
  0% {
    transform: rotate(0);
  }

  100% {
    transform: rotate(360deg);
  }
}

.header {
  width: 100vw;
  height: 80px;
  background-color: #fff;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 60px;
  position: relative;
  z-index: 50;

  .img-wrapper {
    display: block;
    width: 90px;
    overflow: hidden;
  }

  .buy-header-right {
    display: flex;
    align-items: center;
    height: 100%;

    &>div {
      font-size: 18px;
    }

    .icon {
      font-size: 25px;
      margin-left: 25px;
      margin-right: 10px;
    }
  }
}

main {
  width: 70%;
  margin: auto;
  margin-top: 100px;

  .container {
    .row {
      .buy-info {
        form {
          h2 {
            font-size: 25px;
            margin-bottom: 30px;
          }

          .input-wrapper {
            position: relative;
            margin-bottom: 30px;

            &>span {
              background-color: #fff;
              position: absolute;
              left: 20px;
              top: -10px;
              padding: 0 10px;
              font-size: 14px;
              color: #999;
            }

            &>input {
              padding: 20px;
              width: 100%;
              height: 100%;
              border: 1.5px solid #999;
              border-radius: 7px;

              &.readonly {
                cursor: auto;
              }

              &:hover {
                border-color: #333;

                +span {
                  color: #333;
                }
              }

              &:focus {
                border-color: #333;

                +span {
                  color: #333;
                }
              }
            }

            .address-area {
              button {
                margin: 10px;
                padding: 10px 25px;
                background-color: #fff;
                border: 1.5px solid #ccc;
                border-radius: 50px;

                &:hover {
                  background-color: #eee;
                }
              }

              ul {
                background: #fff;
                border: 2px solid rgba($color: #000000, $alpha: 0);
                border-radius: 10px;
                overflow: hidden;
                width: 100%;
                max-height: 0;
                font-size: 18px;
                padding: 0;
                transition: max-height 0.6s;

                &>li:first-child {
                  margin-top: 15px;
                }

                &>li:last-child {
                  margin-bottom: 30px;
                }

                &.active {
                  border: 2px solid #999;
                  max-height: 500px;

                  &:hover {
                    border: 2px solid #000;
                  }
                }

                li {
                  padding: 20px 15px;
                  width: 100%;

                  h2 {
                    padding: 0;
                    margin: 0;
                  }

                  &.address-option {
                    cursor: pointer;
                    padding: 20px 45px;
                    border-radius: 10px;

                    &:hover {
                      background: #ccc;
                    }
                  }
                }
              }
            }
          }

          .buy-checkbox {
            transform: scale(1.7);
            margin-right: 20px;
            cursor: pointer;

            &:checked {
              background-color: #333;
            }
          }

          .buy-label {
            cursor: pointer;
            font-size: 20px;
            margin-bottom: 50px;

            &>a {
              text-decoration: underline;

              &:hover {
                color: #ccc;
              }
            }
          }

          .next-step-btn {
            width: 100%;
            background-color: #333;
            color: #fff;
            border-radius: 50px;
            padding: 15px 0;
            font-size: 20px;

            &:disabled {
              color: #999;
              background-color: #eee;
            }
          }

          .choose-coupon {
            text-decoration: underline;
            font-size: 18px;
          }

          .used-coupon {
            height: 50px;
            display: flex;
            align-items: center;

            .show-coupon-info {
              padding: 0;
            }
          }

          .show-coupon-info {
            height: 18px;
            font-size: 18px;
            margin-bottom: 30px;
          }

          .pay-by-select {
            margin-bottom: 50px;

            .pay-by-btn {
              border: 1.5px #999 solid;
              padding: 20px;
              border-radius: 7px;
              font-size: 20px;
              cursor: pointer;
              display: flex;
              margin-bottom: 15px;

              .pay-by-btn-img,
              i {
                margin-right: 15px;
              }

              .pay-by-btn-img {
                width: 35px;

                img {
                  object-fit: cover;
                }
              }

              &.active {
                border: 2.5px solid #333;
              }
            }
          }
        }

        .sent-info-area {
          margin-top: 30px;

          .step-block {
            padding: 30px 0;
            border-top: 1px solid #ccc;

            &.active>h2 {
              color: #333;
            }

            h2 {
              font-size: 28px;
              font-weight: 500;
              color: #999;
            }

            .show-info {
              position: relative;

              &>p {
                margin: 0;
                color: #999;
              }

              .info-edit-btn {
                position: absolute;
                right: 0;
                top: -50px;
                font-size: 20px;
                padding: 10px 30px;
                border: 1.5px solid #ccc;
                border-radius: 50px;

                &:hover {
                  background-color: #eee;
                }
              }
            }
          }
        }
      }

      @media screen and (max-width: 991px) {
        .buy-summary-shadow {
          position: fixed;
          width: 100vw;
          height: 100vh;
          top: 0;
          left: 0;
          background-color: rgba($color: #000000, $alpha: 0.5);

          opacity: 0;
          visibility: hidden;
        }
      }

      // 購物摘要
      .buy-summary {
        @media screen and (max-width: 991px) {
          position: absolute;
          top: 80px;
          left: 0;
          background-color: #fff;
          width: 100vw;
          z-index: 50;

          .buy-summary-all-info {
            display: flex;
            flex-direction: column-reverse;
            max-height: 0;
            overflow: hidden;
          }

          &.active {
            +.buy-summary-shadow {
              transition: 0.3s;
              visibility: visible;
              opacity: 1;
            }

            .buy-summary-all-info {
              max-height: 100%;
            }
          }
        }

        .buy-summary-btn {
          display: flex;
          align-items: end;
          margin-bottom: 30px;

          h2 {
            margin: 0;
            margin-right: auto;
          }

          >div {
            display: flex;
            align-items: end;
            font-size: 18px;
            font-weight: bold;
          }

          @media screen and (max-width: 991px) {
            cursor: pointer;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding-top: 15px;
            padding-bottom: 15px;
          }
        }

        .buy-summary-item {
          margin-bottom: 8px;
          align-items: center;

          &>div {
            font-size: 20px;
          }

          .hint {
            position: relative;
            font-size: 17px;
            width: 20px;
            height: 20px;
            border: 1px solid #333;
            border-radius: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: default;
            margin-left: 10px;

            &:hover>span {
              display: block;
            }

            &>span {
              display: none;
              position: absolute;
              width: 100px;
              font-size: 15px;
              left: calc(100% + 10px);
              color: #fff;
              border-radius: 5px;
              text-align: center;
              background: rgba($color: #000000, $alpha: 0.6);
            }
          }
        }

        .order-item-area {
          &>ul {
            padding: 0;

            &>li {
              .item-img-wrapper {
                width: 130px;
                height: 130px;
              }

              .item-info {
                font-size: 16px;

                .title {
                  font-size: 18px;
                }

                ul {
                  padding: 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

#coupon-area-bg {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  z-index: 9999;
  background: rgba($color: #000, $alpha: 0);
  visibility: hidden;
  transition: background 0.3s;

  &.active {
    visibility: visible;
    background: rgba($color: #000, $alpha: 0.5);

    #coupon-area {
      height: 80vh;
      min-height: 400px;
      max-height: 700px;
    }
  }

  #coupon-area {
    position: relative;
    background-color: rgba($color: #fff, $alpha: 1);

    @media screen and (max-width: 991px) {
      top: 0;
    }

    @media screen and (min-width: 992px) {
      width: 40%;
      min-width: 600px;
      left: calc((100% - 40%) / 2);
      top: 10%;
    }

    overflow: hidden;
    transition: 0.3s;
    max-height: 0;

    .bi-x {
      position: absolute;
      top: 10px;
      right: 20px;
      font-size: 40px;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      line-height: 40px;

      &:hover {
        background-color: #ccc;
        cursor: pointer;
      }
    }

    #coupon-header {
      display: flex;
      justify-content: center;
      align-items: end;
      padding: 50px;
      padding-bottom: 20px;

      h2 {
        padding: 0;
        margin: 0;
      }

      span {
        color: #999;
      }
    }

    .coupon-list {
      width: 85%;
      height: 65%;
      margin: auto;
      border: 2px solid #ccc;
      overflow-x: hidden;
      overflow-y: scroll;
      padding: 0;

      .text-gray {
        color: #999;
        font-weight: 500;
      }

      .coupon-item {
        border: 3px rgba($color: #000000, $alpha: 0) dashed;
        margin: 3px 0 0 8px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 130px;

        &:not(.disabled) {
          cursor: pointer;

          &.selected {

            // border-color: #9bf;
            .coupon-discount {
              background-color: #c25033;
              color: #333;
              font-size: 23px;
            }
          }
        }

        &.disabled {
          opacity: 0.4;
        }

        .coupon-body {
          display: flex;
          width: 98%;
          height: 90%;
          // border: 1px solid blue;
          border-radius: 10px;
          position: relative;
          background-color: #2a456e;

          .coupon-top {
            position: absolute;
            width: 100%;
            height: 6px;
            top: -8px;
            background-color: #fff;
          }

          &::before {
            content: "";
            width: 15px;
            height: 15px;
            background-color: #fff;
            position: absolute;
            top: -8px;
            left: 102px;
            border-radius: 50px;
            // border: 2px solid blue;
          }

          .coupon-bottom {
            position: absolute;
            width: 100%;
            height: 7px;
            bottom: -8px;
            background-color: #fff;
            z-index: 100;
          }

          &::after {
            content: "";
            width: 15px;
            height: 15px;
            background-color: #fff;
            position: absolute;
            bottom: -8px;
            left: 102px;
            border-radius: 50px;
            // border: 2px solid blue;
          }

          .coupon-discount-box {
            border-right: 2px dashed #fff;
            width: 110px;
            height: 100%;
            padding: 8px;

            .coupon-discount {
              width: 100%;
              height: 100%;
              display: flex;
              align-items: center;
              justify-content: center;
              border-radius: 5px;
              color: #fff;
              transition: 0.3s;
            }
          }

          .coupon-info {
            display: flex;
            justify-content: center;
            flex-direction: column;
            padding-left: 20px;

            h3 {
              color: #fff;
              font-size: 20px;
            }

            .description {
              color: #fff;
              background-color: #333;
              padding: 0 20px;
              border-radius: 50px;
            }

            .coupon-date-limit {
              color: red;
              margin-top: 3px;
              font-size: 15px;
            }
          }
        }
      }
    }

    /* Webkit (Chrome, Safari) */
    ::-webkit-scrollbar {
      width: 8px;
    }

    ::-webkit-scrollbar-thumb {
      background-color: #888;
      border-radius: 4px;
    }

    ::-webkit-scrollbar-thumb:hover {
      background-color: #555;
    }

    /* Firefox */
    ::-moz-scrollbar {
      width: 8px;
    }

    ::-moz-scrollbar-thumb {
      background-color: #888;
      border-radius: 4px;
    }

    ::-moz-scrollbar-thumb:hover {
      background-color: #555;
    }
  }
}

.payment-area {
  display: none;

  &.active {
    display: block;
  }
}

.valid-text {
  height: 15px;
}
</style>