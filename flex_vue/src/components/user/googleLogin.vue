<template>
  <div v-if="loggedIn">
    <button @click="logout">Logout</button>
    <h2>name:{{ user.name }}</h2>
    <h2>email:{{ user.email }}</h2>
    <img :src="user.picture" />
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
        //console.log(response);
        this.user = decodeCredential(response.credential);
        //console.log(this.user);
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
