<template>
    <main>
        <div class="container">
            <div class="row gx-4">
                <div class="buy-info col-12 col-lg-7">
                    <form action="post">
                        <!-- 寄送資訊 -->
                        <div id="step-1-area">
                            <h2>輸入你的聯絡資訊:</h2>
                            <div class="input-wrapper">
                                <input type="text" name="name" id="" placeholder="姓名">
                                <span>姓名</span>
                            </div>
                            <div class="input-wrapper">
                                <input type="text" class="readonly" name="name" id="" placeholder="郵遞區號" readonly>
                                <span>郵遞區號</span>
                            </div>
                            <div class="input-wrapper">
                                <input type="text" class="readonly" name="name" id="" placeholder="地址" readonly>
                                <span>地址</span>
                                <button type="button">變更地址</button>
                            </div>
                            <div class="input-wrapper">
                                <input type="email" name="email" id="" placeholder="電子郵件">
                                <span>電子郵件</span>
                            </div>
                            <div class="input-wrapper">
                                <input type="phone" name="phone" id="" placeholder="電話號碼">
                                <span>電話號碼</span>
                            </div>
                            <button type="button" class="next-step-btn">繼續</button>
                        </div>
                        <!-- 帳單 -->
                        <div id="step-2-area">
                            <h2>輸入你的帳單地址:</h2>
                            <label class="same-address-label buy-label">
                                <input type="checkbox" id="bill-same-address" class="buy-checkbox">
                                帳單地址同送貨地址
                            </label>
                            <div class="different-address-area">
                                <div class="input-wrapper">
                                    <input type="text" name="name" id="" placeholder="姓名">
                                    <span>姓名</span>
                                </div>
                                <div class="input-wrapper">
                                    <input type="text" name="name" id="" placeholder="郵遞區號">
                                    <span>郵遞區號</span>
                                </div>
                                <div class="input-wrapper">
                                    <input type="text" name="name" id="" placeholder="地址">
                                    <span>地址</span>
                                </div>
                                <div class="input-wrapper">
                                    <input type="tel" name="phone" id="" placeholder="電話號碼">
                                    <span>電話號碼</span>
                                </div>
                            </div>
                            <button type="button" class="next-step-btn">繼續</button>
                        </div>
                        <!-- 付款 -->
                        <div id="step-3-area">
                            <h2>使用優惠券?</h2>
                            <a href="javascript:;" class="choose-coupon">選擇優惠券</a>
                            <p class="show-coupon-info"></p>
                            <input type="hidden" name="couponid">
                            <h2>付款方式</h2>
                            <input type="hidden" name="payBy" id="payBy">
                            <div class="pay-by-select">
                                <div class="pay-by-btn active" data-value="credit-card"><i class="bi bi-credit-card"></i>
                                    信用卡或金融簽帳卡
                                </div>
                            </div>
                            <div class="input-wrapper">
                                <input type="text" name="phone" id="" placeholder="Name on card">
                                <span>Name on card</span>
                            </div>
                            <div class="input-wrapper">
                                <input type="tel" name="phone" id="" placeholder="Card Number">
                                <span>Card Number</span>
                            </div>
                            <div class="row row-cols-2">
                                <div class="input-wrapper">
                                    <input type="text" name="phone" id="" placeholder="MM/YY">
                                    <span>MM/YY</span>
                                </div>
                                <div class="input-wrapper">
                                    <input type="tel" name="phone" id="" placeholder="CVV">
                                    <span>CVV</span>
                                </div>
                            </div>
                            <label class="confirm-terms-label buy-label">
                                <input type="checkbox" id="confirm-terms" class="buy-checkbox">
                                確認你同意 Flex 付款的 <a href="javascript:;">條款與條件</a>
                            </label>
                            <button type="submit" class="next-step-btn">下訂單</button>
                        </div>
                    </form>
                    <div>
                        <div>
                            <h2>寄送資訊</h2>
                            <div>
                                <!-- 姓名 -->
                                <p></p>
                                <!-- 地址 -->
                                <p></p>
                                <!-- Email -->
                                <p></p>
                                <!-- 電話 -->
                                <p></p>
                            </div>
                            <button>編輯</button>
                        </div>
                        <div>
                            <h2>帳單</h2>
                            <div>
                                <!-- 姓名 -->
                                <p></p>
                                <!-- 地址 -->
                                <p></p>
                                <!-- 電話 -->
                                <p></p>
                            </div>
                        </div>
                        <div>
                            <h2>付款</h2>
                        </div>
                    </div>
                </div>
                <div class="buy-summary col-12 col-lg-5"></div>
            </div>
        </div>
    </main>
</template>
    
<script setup lang='ts'>

</script>
    
<style lang="scss">
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

                        &>button {
                            margin: 10px;
                            padding: 10px 25px;
                            background-color: #fff;
                            border: 1.5px solid #ccc;
                            border-radius: 50px;

                            &:hover {
                                background-color: #eee;
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

                            &.active {
                                border: 2.5px solid #333;
                            }
                        }
                    }
                }
            }
        }
    }
}
</style>