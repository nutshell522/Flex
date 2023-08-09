import { defineStore } from 'pinia';
import { ref } from 'vue';
import axios from 'axios';

//第一個參數getApiData指的是整個store的id
//官方建議pinia function 為use開頭
export const useGetApiDataStore = defineStore('getApiData', () => {
  const list = ref([]);
  // 把axios修改為async await函式
  const getData = async () => {
    try {
      const res = await axios.get('https://localhost:7183/api/Products/Men');
      console.log(res);
      list.value = res.data;
    } catch (error) {
      console.log(error);
    }
  };
  return {
    list, //為了讓外界使用到所以放在return
    getData,
  };
});
