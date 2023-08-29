<template>
    <NavBar></NavBar>
    <div class="d-flex mb-2 main-sales-title" :style="{
        position: isSticky ? 'sticky' : 'static',
        top: isSticky ? '69px' : 'auto',
        'box-shadow': isSticky ? '0 2px 3px #ccc' : 'none',
    }" @scroll="handleScroll" ref="stickyElement">
        <div class="container">

            <h2 :style="{ fontSize: isFontSmall ? '22px' : '33px' }" :class="{ active: mainDiscountActive }">{{
                mainDiscount?.discountName }}</h2>
            <h3 :style="{ fontSize: isFontSmall ? '16px' : '25px' }" :class="{ active: mainCategoryActive }"> / {{
                mainCategory }}</h3>
        </div>
    </div>

    <div class="container">

        <div class="d-flex main-sales-description">
            <div class="me-auto text-secondary">{{ mainDiscount?.discountDescription }}</div>
            <div class="text-danger">{{ countdownText }}</div>
        </div>
        <section class="w-100">
            <ul class="discount-btn-list gray-scroll p-0">
                <li v-for="discount in discounts" :data-id="discount.discountId" class="discount-btn hide"
                    @click="discountClickHandler(discount)">
                    {{ discount.discountName }}
                </li>
            </ul>
        </section>
        <section class="w-100 p-3 mb-3">
            <ul class="d-flex p-0 row row-cols-4">
                <li @click="categoryClickHandler(0, 'All')" class="category-btn" :class="{ active: mainCategory == 'All' }">
                    All
                </li>
                <li v-for="category in salesCategories"
                    @click="categoryClickHandler(category.id, `${category.salesCategoryStr}`)" class="category-btn"
                    :class="{ active: mainCategory == category.salesCategoryStr }">
                    {{ category.salesCategoryStr }}
                </li>
            </ul>
        </section>
        <main class="w-100">
            <ul v-if="onSaleProducts.length != 0" class="w-100 px-2 row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3">
                <li v-for="product in onSaleProducts">
                    <a :href="`${webBaseAddress}${product.salesCategoryStr}/detail/${product.productId}`"
                        class="d-block product-box">
                        <div class="img-wrapper">
                            <img :src="`${imgBaseUrl}Public/Img/${product.imgPath}`">
                        </div>
                        <div class="product-name">{{ product.productName }}</div>
                        <div class="product-price">NT{{ formatter.format(product.salesPrice) }}</div>
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
import { ref, onMounted, computed, watch, onBeforeUnmount } from "vue";
import { Discount, SalesCategory, OnSaleProduct, CountdownTimer } from "@/types/type";
const baseAddress: string = import.meta.env.VITE_API_BASEADDRESS;
const webBaseAddress = 'https://localhost:8080/';
const imgBaseUrl = ref(baseAddress);
const discounts = ref<Discount[]>([]);
const salesCategories = ref<SalesCategory[]>([]);
const activeCategoryId = ref<Number>(0);
const onSaleProducts = ref<OnSaleProduct[]>([]);
const mainDiscount = ref<Discount>();
const mainCategory = ref<string>('All');
const mainDiscountActive = ref<boolean>(true);
const mainCategoryActive = ref<boolean>(true);
const deadline = ref<CountdownTimer>(new CountdownTimer(0));
const countdownText = ref<string>('');
const isFontSmall = ref(false);
const stickyElement = ref<HTMLElement | null>(null);
const isSticky = ref(false);



const handleScroll = () => {
    if (stickyElement.value) {
        const scrollY = window.scrollY;
        isSticky.value = scrollY >= 70;
        isFontSmall.value = scrollY >= 70;
    }
};


const loadDiscounts = async (callback: (() => Promise<void>) | null) => {
    await axios
        .get<Discount[]>(`${baseAddress}api/Sale`)
        .then(response => {
            mainDiscount.value = response.data[0]
            discounts.value = response.data;
            if (callback) { callback() };
            setTimeout(() => {
                const discountBtns = document.querySelectorAll('.discount-btn');
                const delayedLoop = (iterations: number, delay: number) => {
                    let i = 0;
                    const loop = () => {
                        if (i < iterations) {
                            discountBtns[i].classList.remove('hide');
                            i++;
                            setTimeout(loop, delay);
                        }
                    }
                    loop();
                }
                delayedLoop(discountBtns.length, 100);
            }, 500)
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
        })
        .catch(error => { alert(error) });
}
const discountClickHandler = (discount: Discount) => {
    mainDiscountActive.value = false;
    mainDiscount.value = discount;
    console.log(mainDiscount.value);
    setTimeout(() => {
        mainDiscountActive.value = true;
    }, 200)
    loadProducts();
}
const categoryClickHandler = (id: number, str: string) => {
    mainCategoryActive.value = false;
    mainCategory.value = str;
    activeCategoryId.value = id;
    setTimeout(() => {
        mainCategoryActive.value = true;
    }, 200)

    loadProducts();

}

loadDiscounts(loadProducts);
loadCategories();

watch(
    () => mainDiscount.value,
    () => {
        if (deadline.value) {
            deadline.value.stopCountdown();
        }
        const targetTimeInSeconds = (mainDiscount.value && mainDiscount.value.endDate)
            ? Math.floor(new Date(mainDiscount.value.endDate).getTime() / 1000) + 3600
            : null;
        deadline.value = new CountdownTimer(targetTimeInSeconds);
        countdownText.value = deadline.value.countdownText;
    }
);


onMounted(() => {
    window.addEventListener('scroll', handleScroll);

    const updateInterval = setInterval(() => {
        if (deadline.value) {
            countdownText.value = deadline.value.countdownText;
        }
    }, 1000);




    // 在组件卸载前清除定时器
    onBeforeUnmount(() => {
        clearInterval(updateInterval);
    });
});



const formatter = new Intl.NumberFormat("zh-TW", {
    style: "currency",
    currency: "TWD",
    minimumFractionDigits: 0, // 最少保留小數位數
    maximumFractionDigits: 0, // 最多保留小數位數
});


</script>
    
<style scoped lang="scss">
aside {
    height: 80vh;
    width: 250px;
    background-color: #bfa;
}


.main-sales-title {
    width: 100%;
    background-color: #fff;
    padding: 5px 0;
    z-index: 1000;

    @media screen and (max-width: 991px) {
        margin-top: 20px;
    }

    @media screen and (min-width: 992px) {
        margin-top: 30px;
    }

    .container {
        display: flex;
        align-items: end;

        h2 {
            min-width: 145px;
            padding-right: 20px;
            transform: translateX(-10px);
            opacity: 0;
            margin-bottom: 0;
            font-size: 16px;
            transition: font-size .3s ease;

            &.active {
                transition: transform 0.3s, opacity 0.3s;
                transform: translateX(0);
                opacity: 1;
            }
        }

        h3 {
            color: #777;
            transform: translateX(-10px);
            opacity: 0;
            font-weight: 400;
            margin-bottom: 2px;
            font-size: 16px;
            transition: font-size 3s ease;

            &.active {
                transition: transform 0.3s, opacity 0.3s;
                transform: translateX(0);
                opacity: 1;
            }
        }
    }
}

.main-sales-description {
    @media screen and (max-width: 991px) {
        flex-direction: column;
    }
}

.discount-btn-list {
    display: flex;
    align-items: center;
    overflow-x: scroll;
    border-bottom: 1px solid #ccc;

    @media screen and (min-width: 992px) {
        margin-top: 25px;
    }

    .discount-btn {
        cursor: pointer;
        font-size: 25px;
        padding: 10px 30px;
        white-space: nowrap;
        transform: translateX(0);
        opacity: 1;
        transition: transform 0.3s, opacity 0.3s;

        &.hide {
            transform: translateX(-10px);
            opacity: 0;
        }

        &:hover {
            // background-color: #ccc;
            color: #aaa;
        }
    }
}

.product-box {
    // background-color: #fafafa;
    height: 380px;
    padding: 5px;
    border-radius: 5px;
    box-shadow: 2px 2px 5px -1px #ccc;

    &:hover {
        img {

            transform: scale(1.1);
        }
    }

    .img-wrapper {
        @media screen and (max-width: 991px) {
            height: 220px;
        }

        @media screen and (min-width: 992px) {
            height: 280px;
        }

        border-radius: 5px;
        width: 100%;
        overflow: hidden;
        object-fit: cover;

        img {
            transition: .8s;
        }
    }

    .product-name {
        margin: 10px 0;
        text-align: center;
    }

    .product-price {
        text-align: center;
        font-size: 20px;
    }
}

.category-btn {
    cursor: pointer;
    border: #bbb 1px solid;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #fff;
    padding: 10px 0;

    @media screen and (min-width: 992px) {
        font-size: 20px;
    }

    @media screen and (max-width: 991px) {
        font-size: 18px;
    }

    &:not(:last-child) {
        border-right: none;
    }

    &.active {
        background-color: #4D3028;
        color: #fff;
    }
}
</style>