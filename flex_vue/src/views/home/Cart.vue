<template>
    <navBar></navBar>
    <main>
        <div class="container">
            <div class="row gx-4">
                <div class="left col-12 col-lg-8">
                    <div class="bg-dark"></div>
                </div>
                <div class="right col-12 col-lg-4">
                    <div class="bg-primary"></div>
                </div>
            </div>
        </div>
    </main>
    <homeFooter></homeFooter>
</template>
    
<script setup>
import navBar from '@/components/home/NavBar.vue';
import homeFooter from '@/components/home/footer.vue';
</script>
    
<style lang="scss">
main {
    margin-top: 40px;
    padding-bottom: 120px;

    .row {
        &>.left {
            &>div {}
        }

        &>.right {
            &>div {}
        }
    }
}
</style>