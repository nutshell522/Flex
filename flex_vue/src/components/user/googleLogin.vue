<template>
  <div v-if="loggedIn">
    <!-- <button @click="logout">Logout</button>
    <h2>name:{{ user.name }}</h2>
    <h2>email:{{ user.email }}</h2>
    <img :src="user.picture" /> -->
  </div>
  <div v-else>
    <GoogleLogin :callback="callback" prompt auto-login></GoogleLogin>
  </div>
</template>

<script>
import { decodeCredential, googleLogout } from 'vue3-google-login';

export default {
  data() {
    return {
      loggedIn: false,
      user: null,

      callback: (response) => {
        console.log('googleLoginSuccess');
        this.loggedIn = true;
        window.location.href = '/';
        this.user = decodeCredential(response.credential);
        console.log(this.user.email);
        console.log(this.user.name);
        console.log(this.user.picture);

        // const googleLogin = JSON.stringify(this.user);
        // console.log(googleLogin.user);
        //把登入資訊包在一起傳給本地
      },
    };
  },
  methods: {
    logout() {
      googleLogout();
      this.loggedIn = false;
    },
  },
};
</script>

<style></style>
