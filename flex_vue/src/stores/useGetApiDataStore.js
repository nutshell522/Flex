import { defineStore } from 'pinia';
import { ref } from 'vue';
import axios from 'axios';

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
    },
  },
});
