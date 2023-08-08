import { defineStore } from 'pinia';
import { ref } from 'vue';
import axios from 'axios';

export const useGetApiDataStore = defineStore('getApiData', () => {
  const res = ref([]);
  // 把axios修改為async await函式
  async function getData(url) {
    try {
      const data = await axios.get(url);
      res.value = data.data;
    } catch (error) {
      console.log(error);
    }
  }
  return {
    res,
    getData,
  };
});

// export const useGetApiDataStore = defineStore({
//   id: 'counter',
//   state: () => ({
//     counter: 0,
//   }),
//   getters: {
//     doubleCount: (state) => state.counter * 2,
//   },
//   actions: {
//     increment() {
//       this.counter++;
//     },
//   },
// });
