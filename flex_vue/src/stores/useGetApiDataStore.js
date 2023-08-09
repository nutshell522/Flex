import { defineStore } from 'pinia';
import { ref } from 'vue';
import axios from 'axios';

//第一個參數getApiData指的是整個store的id
//官方建議pinia function 為use開頭
export const useGetApiDataStore = defineStore('getApiData', {
  state: () => {
    return {
      memberData: {},
    };
  },
  actions: {
    handleLogout() {
      this.memberData = {};
    },
    setMemberUsername(username) {
      this.memberData.username = username;
    },
  },
});

// export const useGetApiDataStore = defineStore('getApiData', () => {
//   const memberData = ref('');
//   state: () => {};

//   const handleLogout = () => {
//     memberData.value = '';
//   };

//   return {
//     memberData, //為了讓外界使用到所以放在return
//     setMemberUsername,
//     handleLogout,
//   };
// });
