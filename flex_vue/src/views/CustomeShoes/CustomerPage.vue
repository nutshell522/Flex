<template>
    <ShoesnavBar></ShoesnavBar>
    <div class="container-body">
        <div class="row">
        <div class="col-6 ps-5">
            <div class="row" style="min-height: 129px">
            <div class="col-7 detailTitle" :title="shoesDetail.shoesName">
                {{ shoesDetail.shoesName }}
            </div>
            <div class="col-5">
                <div class="detailSalesPriceBox">
                <div class="NTbox">NT$</div>
                <div class="detailSalesPrice" :title="shoesDetail.shoesUnitPrice">
                    {{ shoesDetail.shoesUnitPrice }}
                </div>
                </div>  
            </div>
            </div>
            <hr />
            
            <hr />
        </div>
        </div>
    </div>
</template>

<script setup>
import axios from "axios";
import { onMounted, ref, computed } from "vue";
import { useRoute } from "vue-router";
import ShoesnavBar from "@/components/customeShoes/ShoesnavBar.vue";
import homeFooter from "@/components/home/footer.vue";

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const selectedMaterials = ref("");
const selectedColors = ref("");
const selectedOptions = ref("");
const showDetailDiv = ref(true);

</script>

<style>

</style>