<template>
        <div class="row cardbody">
    <div v-for="(activity, index) in info" :key="index" class="card mb-3 col-4 cards" style="width: 18rem;">
       
        <img :src='imgBaseUrl+"/Public/Img/"+activity.imgPath' class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{{ activity.activityName }}</h5>
            <!-- 使用計算屬性將日期格式化為所需形式 -->
            <p class="card-text">{{ formatDate(activity.activityDate) }}</p>
            <a :href="'activityInfo/'+activity.activityId" class="btn btn-primary">前往報名</a>
        </div>
    </div>
</div>
</template>
    
<script setup>
    import axios from 'axios';
    import {ref, reactive, onMounted} from 'vue';
    import { useRoute } from 'vue-router';
    const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
    const info = ref([]);
    
    onMounted(()=>{
        var uri = "https://localhost:7183/api/Activity/index";
        axios.get(uri)
             .then(res => {
                    console.log(res.data);
                    info.value = res.data;
                })
             .catch(err => {
                    console.log(err)
                })
    });

            
                
         // 建一個計算屬性 formatDate來格式化日期 (不要時間，只要日期)
    const formatDate=(dateString)=>{
                const date = new Date(dateString);
                return date.toLocaleDateString(); // 格式化為本地化的日期字串
   }
                   
      
</script>
    
<style>
        .cards {
            margin-right: 70px;
            margin-bottom: 70px;

        }

        .cardbody {
            margin: 100px
        }
    
</style>