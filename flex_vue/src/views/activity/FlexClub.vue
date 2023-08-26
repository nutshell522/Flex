<template>
    <NavBar></NavBar>
    <main>
        <section class="img">
            <swiper :effect="'coverflow'" :grabCursor="true" :centeredSlides="true" :slidesPerView="'auto'" :loop="true"
                :navigation="navigation" ref="swiperRef" :coverflowEffect="{
                    rotate: 0,
                    stretch: 0,
                    depth: 100,
                    modifier: 2,
                    slideShadows: true,
                }" :pagination="false" :modules="modules" class="mySwiper">
                <swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-1.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-2.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-3.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-4.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-5.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-6.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-7.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-8.jpg" /></swiper-slide><swiper-slide>
                    <img src="https://swiperjs.com/demos/images/nature-9.jpg" /></swiper-slide>
            </swiper>
            <div class="text-box">精彩瞬間</div>
            <div class="pad pad-left pad-top"></div>
            <div class="pad pad-right pad-top"></div>
            <div class="pad pad-left pad-bottom"></div>
            <div class="pad pad-right pad-bottom"></div>
        </section>
        <section class="container">

        </section>
    </main>
    <HomeFooter></HomeFooter>
</template>
    
<script setup>
import NavBar from "@/components/activity/ActivityNav.vue";
import HomeFooter from "@/components/home/footer.vue";
import { ref, nextTick } from 'vue';
import { Swiper, SwiperSlide } from 'swiper/vue';
import 'swiper/css';
import 'swiper/css/effect-coverflow';
import 'swiper/css/pagination';
import { EffectCoverflow, Pagination } from 'swiper/modules';
const modules = [Pagination, EffectCoverflow];

</script>
    
<style scoped lang="scss">
main {


    .img {
        position: relative;
        width: 100%;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;

        .swiper {
            width: 100%;
            padding-top: 50px;
            padding-bottom: 50px;
        }

        .swiper-slide {
            background-position: center;
            background-size: cover;
            width: 50%;
            filter: blur(6px);
            background-color: azure;

            &.swiper-slide-active {
                filter: blur(0);
            }
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            background-color: azure;
        }

        .text-box {
            $width: 20vw;
            $height: 8vw;
            width: $width;
            height: $height;
            text-align: center;
            position: absolute;
            color: #ddd;
            top: calc((100% - $height) / 2);
            left: calc((100% - $width) / 2);
            z-index: 4000;
            font-size: 5vw;
        }

        .pad {
            position: absolute;
            width: 5.5vw;
            height: 5.5vw;
            $border-color: #ddd;
            $border-width: 0.8vw;
            z-index: 3000;

            &.pad-top {
                border-top: $border-width solid $border-color;

                @media screen and (min-width: 992px) {
                    top: 20%;
                }

                @media screen and (max-width: 991px) {
                    top: 24%;
                }

                @media screen and (max-width: 768px) {
                    top: 30%;
                }

                @media screen and (max-width: 577px) {
                    top: 32vw;
                }

                @media screen and (max-width: 543px) {
                    top: 37%;
                }

                @media screen and (max-width: 394px) {
                    top: 41%;
                }

            }

            &.pad-bottom {
                border-bottom: $border-width solid $border-color;

                @media screen and (min-width: 992px) {
                    bottom: 20%;
                }

                @media screen and (max-width: 991px) {
                    bottom: 24%;
                }

                @media screen and (max-width: 768px) {
                    bottom: 30%;
                }

                @media screen and (max-width: 577px) {
                    bottom: 32vw;
                }

                @media screen and (max-width: 543px) {
                    bottom: 37%;
                }

                @media screen and (max-width: 394px) {
                    bottom: 41%;
                }
            }

            &.pad-left {
                border-left: $border-width solid $border-color;
                left: 3.5vw;
            }

            &.pad-right {
                border-right: $border-width solid $border-color;
                right: 3.5vw;
            }
        }
    }
}
</style>