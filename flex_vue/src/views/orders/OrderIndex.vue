<template>
  <OrdernavBar></OrdernavBar>
  <dev id="searchorderout" class="container">
    <dev id="srarchdate" class="col-3">
      <input type="text" v-model="begintime" @searchInputbegintime="inputbegintime" class="form-control"
        placeholder="輸入開始日期">
      ~
      <input type="text" v-model="endtime" @searchInputendtime="inputendtime" class="form-control" placeholder="輸入結束日期">
    </dev>
    <div id="searchorder" class="col-3">
      <input type="text" v-model="keyword" @searchInput="inputhandler" class="form-control" placeholder="輸入名稱">
      <button class="button" @click="keywordSearch">搜尋</button>
    </div>
  </dev>
  <div id="cate" class="container">
    <button @click="setTypeValue('1')">商品</button>

    <button @click="setTypeValue('4')">客製化</button>

    <button @click="setTypeValue('2')">活動</button>

    <button @click="setTypeValue('3')">課程</button>
  </div>
  <div class="container">
    <table class="table table-striped table-hover" style="width: 100%">
      <thead>
        <tr>
          <th>訂單日期</th>
          <th>訂單編號</th>
          <th>總數量</th>
          <th>總金額</th>
          <th>付款方式</th>
          <th>發票編號</th>
          <th>訂單狀態</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in GetOrders" :key="item.id">
          <td>{{ formatOrderTime(item.ordertime) }}</td>
          <td>{{ item.id }}</td>
          <td>{{ item.total_quantity }}</td>
          <td>{{ item.total_price }}</td>
          <td>{{ item.pay_method }}</td>
          <td>{{ item.receipt }}</td>
          <td>{{ item.order_status }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script setup>
import OrdernavBar from "@/components/Order/OrdernavBar.vue";
import { ref, onMounted } from "vue";
import axios from "axios";

const GetOrders = ref([]);
const Type = ref("");
const keyword = ref("");
const begintime = ref("");
const endtime = ref("");

const loadGetOrders = async () => {
  await axios
    .get(`https://localhost:7183/api/Orders/GetOrders?begintime=${begintime.value}&endtime=${endtime.value}&keyword=${keyword.value}&typeId=${Type.value}`)
    .then((response) => {
      //console.log(response.data);
      GetOrders.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};
const formatOrderTime = (ordertime) => {
  const dateTimeObject = new Date(ordertime);
  const year = dateTimeObject.getFullYear();
  const month = (dateTimeObject.getMonth() + 1).toString().padStart(2, "0");
  const dates = dateTimeObject.getDate().toString().padStart(2, "0");
  const hours = dateTimeObject.getHours().toString().padStart(2, "0");
  const minutes = dateTimeObject.getMinutes().toString().padStart(2, "0");
  return year + "-" + month + "-" + dates + " " + hours + ":" + minutes + "";
};
const setTypeValue = (paramValue) => {
  Type.value = paramValue;
  loadGetOrders();
};

const emit = defineEmits(["searchInput"])
const inputhandler = () => {
  emit1("searchInput", keyword.value);
  loadGetOrders();
};

const inputbegintime = () => {
  emit2("searchInputbegintime", begintime.value);
  loadGetOrders();
};

const inputendtime = () => {
  emit3("searchInputendtime", endtime.value);
  loadGetOrders();
};

const keywordSearch = () => {
  loadGetOrders();
};

onMounted(() => {
  Type.value = 1;
  loadGetOrders();
});
</script>
<style scoped>
.table>thead>tr>th {
  background-color: maroon;
  color: white;
  text-align: center;
}

.table>tbody>tr>td {
  text-align: center;
}

#cate>button {
  text-align: center;
  padding-right: 20px;
  margin-right: 80px;
  font-size: 30px;
}

#cate {
  background-color: antiquewhite;
  text-align: center;
  width: 60%;
}

#searchorder {
  text-align: center;
  width: 60%;
  display: flex;
  justify-content: center;
  align-items: center;
}

#searchorder>input {
  margin: 20px;
  padding: 10px;
  width: 300px;
}

#searchorder>button {
  margin: 20px;
  padding: 10px;
  width: 60px;
  position: relative;
}

#srarchdate {
  text-align: center;
  width: 60%;
  display: flex;
  justify-content: center;
  align-items: center;
}

#srarchdate>input {
  margin: 20px;
  padding: 10px;
  width: 300px;
}
</style>
