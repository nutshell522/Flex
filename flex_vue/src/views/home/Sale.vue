<template>
    <NavBar></NavBar>
    <div class="container mt-5">
        <h2>9折專區</h2>
        <section class="w-100">
            <ul class="d-flex w-100 p-0 justify-content-center align-items-center fs-3">
                <li class="me-5">9折專區</li>
                <li class="me-5">9折專區</li>
                <li class="me-5">9折專區</li>
                <li class="me-5">9折專區</li>
            </ul>
        </section>
        <section class="w-100 p-3">
            <div class="d-flex border-bottom border-dark">
                <div class="me-auto">已選購 0 件，原價 0 元，折扣價 0 元</div>
                <button class="me-3">前</button>
                <button>後</button>
            </div>
            <div>
                <ul class="d-flex p-0">
                    <li>
                        <div>圖</div>
                        <div>
                            商品名稱
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <main class="w-100">
            <ul class="w-100 px-2 row row-cols-2 row-cols-md-3 row-cols-lg-4">
                <li>
                    <div class="border">

                        <a href="javascript:;" class="d-block">
                            圖
                        </a>
                        <div>商品名稱</div>
                        <div>價格</div>
                        <ul class="p-0 d-flex">
                            <li>S</li>
                            <li>S</li>
                            <li>S</li>
                            <li>S</li>
                            <li>S</li>
                        </ul>
                    </div>
                </li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </main>
    </div>
    <HomeFooter></HomeFooter>
</template>
    
<script setup lang='ts'>
import NavBar from "@/components/home/navBar.vue";
import HomeFooter from "@/components/home/footer.vue";
import axios from "axios";
import { ref, onMounted, computed } from "vue";
import { CartItem, ShoppingCartItem } from "@/types/type";
</script>
    
<style scoped lang="scss">
aside {
    height: 80vh;
    width: 250px;
    background-color: #bfa;
}

section {
    background-color: orange;
}
</style>