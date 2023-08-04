<template>
    <div class="container">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <td>訂單日期</td>
                    <td>訂單編號</td>
                    <td>總數量</td>
                    <td>總金額</td>
                    <td>付款方式</td>
                    <td>發票編號</td>
                    <td>訂單狀態</td>
                </tr>
            </thead>
            <tbody>
                <tr v-for="item in GetOrders" :key="item.id">
                    <td>{{ item.ordertime }}</td>
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

import { ref, onMounted } from 'vue'
import axios from "axios";

const GetOrders = ref([])

const loadGetOrders = async () => {
    await axios
        .get(`https://localhost:7183/api/Orders/GetOrders`)
        .then((response) => {
            //console.log(response.data);
            GetOrders.value = response.data;
        })
        .catch((error) => {
            alert(error);
        });
}
onMounted(() => {
    loadGetOrders()
})
</script>
<style scoped>
.table>thead>tr>td {
    background-color: maroon;
    color: white;
}
</style>