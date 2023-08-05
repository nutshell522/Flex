<template>
        <div >
     
        
        <div class="mb-3">
            <label class="form-label">姓名</label>
            <input type="text" v-model="member.mame" class="form-control" placeholder="請輸入姓名">
            <!-- {{member.mame}} -->
        </div>

        <div class="mb-3">
            <label class="form-label">出生年月日</label>
            <input type="text" v-model="member.birthday" class="form-control" placeholder="請輸入生日">
        </div>

        <div class="mb-3">
            <label class="form-label">性別</label>
            <input type="text" v-model="member.gender" class="form-control" placeholder="請輸入性別">
        </div>

        <div class="mb-3">
            <label class="form-label">電話</label>
            <input type="text" v-model="member.mobile" class="form-control" placeholder="請輸入電話">
        </div>

        <div class="mb-3">
            <label class="form-label">通訊地址</label>
            <input type="text" v-model="member.commonAddress" class="form-control" placeholder="請輸入地址">
        </div>

        <div class="mb-3">
            <label class="form-label">聯絡信箱</label>
            <input type="text" v-model="member.email" class="form-control" placeholder="請輸入電子信箱">
        </div>
        <br>
        <div class="mb-3">
            <p>本人 {{member.mame}} 謹此聲明，自願參加貴單位舉辦的（活動名稱），並願意遵守以下所有條款與約定。在此，本人郑重承諾遵守本切結書所規定的所有規定與要求，並將全力配合活動主辦方的運作。

健康安全：本人保證自身身體狀況良好，並無任何潛在的傳染病或感染風險。若本人在活動期間出現任何症狀或發現任何健康風險，將立即通報活動主辦單位。

活動規定：本人將遵守活動主辦單位所制定的一切規定和指導方針，包括但不限於活動時間、地點、行程安排和參與活動的規範。

財物損失：本人了解在活動期間所攜帶的個人財物和物品由本人負責保管，若有任何損失或損壞，活動主辦單位將不負擔任何賠償責任。

活動安全：本人明白參加活動可能存在某些風險，包括但不限於身體受傷、財物損失等，並願意自行承擔相關風險。本人同意在活動期間嚴格遵守活動主辦單位的安全指示，確保自身和他人的安全。</p>
        </div>
        <button class="btn btn-primary" click="send">確認報名</button>

    </div>



   
    
        
</template>
    
<script setup>
import axios from 'axios';
import{ref, reactive} from 'vue';
const member = reactive({
    mame:"",
    gender:"",
    commonAddress:"",
    mobile:"",
    email:"",
    birthday:""
})
const loadMember = async (id)=>{
    axios.get(`https://localhost:7183/api/Activity/SignUp${id}`)
        .then(res=>{
            console.log(res.data);
            const datas = res.data;
            member.mame = datas.name;
            member.commonAddress = datas.commonAddress;
            member.mobile = datas.mobile;
            member.email = datas.email;
            member.birthday = datas.birthday;
            member.gender = datas==true? "男":"女";
            
        })
        .catch(err=>{
            console.log(err);
        })
}
loadMember(24);
    
</script>
    
<style>
    
</style>