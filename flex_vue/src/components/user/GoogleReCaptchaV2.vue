<template>
  <vue-recaptcha
    :sitekey="instance_vueRecaptchaV2.data_v2SiteKey"
    size="normal"
    theme="light"
    hl="zh-TW"
    @verify="instance_vueRecaptchaV2.recaptchaVerified"
    @expire="instance_vueRecaptchaV2.recaptchaExpired"
    @fail="instance_vueRecaptchaV2.recaptchaFailed"
  />
</template>

<script setup lang="ts">
import { reactive } from 'vue';
import vueRecaptcha from 'vue3-recaptcha2';
import axios from 'axios';

const baseAddress = 'https://localhost:7183/';

const uri = `${baseAddress}api/Users/reCaptcha`;

const instance_vueRecaptchaV2 = reactive({
  // SiteKey
  data_v2SiteKey: '6LdZBLonAAAAAELO7936Vn7qqFwk9koFWpX-J5Vs',
  recaptchaVerified: (response_token: string) => {
    //console.log(response_token);

    // 連接後端API，給後端進行認證，後端將會把拿到的token以及密鑰post到reCAPTCHA指定的URL，就會收到回應看成功或是失敗
    axios
      .post(uri, { token: response_token })
      .then((res) => {
        //驗證成功
        console.log('reCAPTCHA驗證成功啦', res);
      })
      .catch((err) => {
        console.log('reCAPTCHA驗證失敗啦', err);
      });
  },
  recaptchaExpired: () => {
    // 驗證過期後進行的動作(token存活的時間為2分鐘)
    // After recaptcha is expired, the action you can do.
    console.log('reCAPTCHA驗證過期啦');
  },
  recaptchaFailed: () => {
    // 驗證失敗進行的動作
    // After recaptcha is failed, the action you can do.
    console.log('reCAPTCHA驗證失敗啦');
  },
});
</script>

<style></style>
