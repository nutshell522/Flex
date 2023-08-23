<template>
    <NavBar></NavBar>
    <div class="container mt-5">
        <div class="d-flex">
            <h2>{{ mainDiscount?.discountName }}</h2>
            <div>{{ mainDiscount?.discountDescription }}</div>
        </div>
        <section class="w-100">
            <ul class="d-flex w-100 p-0 justify-content-center align-items-center fs-3">
                <li v-for="discount in discounts" :data-id="discount.discountId" class="me-5"
                    @click="discountClickHandler(discount)">
                    {{ discount.discountName }}
                </li>
            </ul>
        </section>
        <section class="w-100 p-3">
            <ul class="d-flex p-0 row row-cols-4">
                <li @click="categoryClickHandler(0)">All</li>
                <li v-for="category in salesCategories" @click="categoryClickHandler(category.id)">
                    {{ category.salesCategoryStr }}
                </li>
            </ul>
        </section>
        <main class="w-100">
            <ul v-if="onSaleProducts.length != 0" class="w-100 px-2 row row-cols-2 row-cols-md-3 row-cols-lg-4">
                <li v-for="product in onSaleProducts">
                    <a :href="`${webBaseAddress}${product.salesCategoryStr}/detail/${product.productId}`" class="d-block">
                        <div class="d-block">
                            <img :src="`${imgBaseUrl}Public/Img/${product.imgPath}`">
                        </div>
                        <div>{{ product.productName }}</div>
                        <div>{{ product.salesPrice }}</div>
                    </a>
                </li>
            </ul>
            <div v-else class="d-flex justify-content-center align-items-center">此分類沒有商品</div>
        </main>
    </div>
    <HomeFooter></HomeFooter>
</template>
    
<script setup lang='ts'>
import NavBar from "@/components/home/navBar.vue";
import HomeFooter from "@/components/home/footer.vue";
import axios from "axios";
import { ref, onMounted, computed } from "vue";
import { Discount, SalesCategory, OnSaleProduct } from "@/types/type";
const baseAddress: string = import.meta.env.VITE_API_BASEADDRESS;
const webBaseAddress = 'https://localhost:8080/';
const imgBaseUrl = ref(baseAddress);
const mainDiscount = ref<Discount>();
const discounts = ref<Discount[]>([]);
const salesCategories = ref<SalesCategory[]>([]);
const activeCategoryId = ref<Number>(0);
const onSaleProducts = ref<OnSaleProduct[]>([]);

const loadDiscounts = async (callback: (() => Promise<void>) | null) => {
    await axios
        .get<Discount[]>(`${baseAddress}api/Sale`)
        .then(response => {
            mainDiscount.value = response.data[0]
            discounts.value = response.data;
            if (callback) { callback() };
        })
        .catch(error => { alert(error) });
}
const loadCategories = async () => {
    await axios
        .get<SalesCategory[]>(`${baseAddress}api/Sale/GetProductCategories`)
        .then(response => {
            salesCategories.value = response.data;
        })
        .catch(error => { alert(error) });
}
const loadProducts = async () => {
    await axios
        .get<OnSaleProduct[]>(`${baseAddress}api/Sale/GetDiscountProducts/${mainDiscount.value?.discountId}/${activeCategoryId.value}`)
        .then(response => {
            onSaleProducts.value = response.data;
            console.log(response.data, onSaleProducts.value);
        })
        .catch(error => { alert(error) });
}
const discountClickHandler = (discount: Discount) => {
    mainDiscount.value = discount;
    loadProducts();
}
const categoryClickHandler = (id: number) => {
    activeCategoryId.value = id;
    loadProducts();
}

loadDiscounts(loadProducts);
loadCategories();
</script>
    
<style scoped lang="scss">
aside {
    height: 80vh;
    width: 250px;
    background-color: #bfa;
}

section {}
</style>