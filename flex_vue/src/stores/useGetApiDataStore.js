import { defineStore } from 'pinia';
import { ref } from 'vue';
import axios from 'axios';
import Cookies from 'js-cookie';

//第一個參數getApiData指的是整個store的id
//官方建議pinia function 為use開頭
export const useGetApiDataStore = defineStore('getApiData', {
  state: () => {
    return {
      memberData: ref({}),
    };
  },
  actions: {
    handleLogout() {
      this.memberData.value = {};
      Cookies.remove('user_cookie');

      const baseAddress = 'https://localhost:7183';
      const uri = `${baseAddress}/api/Users/Logout`;
      axios
        .delete(uri)
        .then((res) => {
          console.log('delet API');
        })
        .catch((err) => {
          console.error(err);
        });
    },
    setMemberUsername(username) {
      this.memberData.username = username;
      this.checkUserCookie(); // 在设置 username 后调用检查函数
    },
    checkUserCookie() {
      const username = Cookies.get('user_cookie');
      this.memberData.loginSuccess = username;
    },
  },
});
