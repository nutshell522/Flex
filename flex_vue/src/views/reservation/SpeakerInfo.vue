<template>
<div class="row">
    <div class="col-md-8">左
        <div class="featured-img">
            <img :src='imgBaseUrl+"/Public/Img/"+speaker.speakerImg'
                alt="Featured 1" class="featured-big">
        </div>
        
            <p>講師姓名：{{ speaker.speakerName }}</p>
            <p>擅長領域：{{speaker.fieldName}}</p>
            <p>講師描述：{{speaker.speakerDescription}}</p>
            <p>駐點分店：{{speaker.branchName}} ({{speaker.branchAddress}})</p>
            
        
       

        
            <!-- 預約系統 -->
            <p>預約時間表</p>
            <div id="datePicker">
                <button id="prevButton">前一周</button>
                <span id="currentDate"></span>
                <button id="nextButton">後一周</button>
            </div>
            <div id="schedule">

            </div>
       

    </div>


    <div class="col-md-4">
右
    </div>
</div>

 
</template>
  
<script setup>
import {onMounted, reactive, ref} from 'vue';
import axios from 'axios';
import {useRoute} from 'vue-router';

const route=useRoute();
const speakerId = route.params.id;
console.log(speakerId);
const speaker = ref([]);
const imgBaseUrl = ref(import.meta.env.VITE_API_BASEADDRESS);
onMounted(()=>{
    const datePicker = document.querySelector("#datePicker");
        const prevButton = document.querySelector("#prevButton");
        const nextButton = document.querySelector("#nextButton");
        const currentDateDisplay = document.querySelector("#currentDate");
        const schedule = document.querySelector("#schedule");

        const timeSlots = [
            "11:00  - 12:00 ",
            "12:00  - 13:00 ",
            "13:00  - 14:00 ",
            "14:00  - 15:00 ",
            "15:00  - 16:00 ",
            "16:00  - 17:00 ",
            "17:00  - 18:00 ",
            "18:00  - 19:00 ",
            "19:00  - 20:00 ",
            "20:00  - 21:00 ",
            "21:00  - 22:00 "
        ];

        let currentDate = new Date(); //創建一個包含right now日期和時間的 Date 物件
        console.log(currentDate);
        // 預約表的表頭顯示日期
        function showCurrentDate() {
            const startDate = new Date(currentDate);
            const endDate = new Date(startDate);
            endDate.setDate(startDate.getDate() + 6); //一週結束日期的數字設為: 開始日期的日期數字+6天

            console.log(startDate);

            console.log(endDate);

            currentDateDisplay.textContent = `${startDate.toLocaleDateString()} - ${endDate.toLocaleDateString()}`;
        }

        function createSchedule() {
            schedule.innerHTML = "";

            const table = document.createElement("table");
            table.className = "schedule-table";

            // 建立表的第一橫列 (日期)
            const headerRow = document.createElement("tr");
            headerRow.innerHTML = "<th>時間</th>";
            for (let i = 0; i < 7; i++) {
                const dateCell = document.createElement("th");
                const day = new Date(currentDate); //取得今天的月份+日期
                //迴圈第一圈：今天的日期數字，第二圈日期數字：+1
                day.setDate(currentDate.getDate() + i);
                //用getMonth( )方法產出的月份格式要+1
                const formattedDate = `${day.getMonth() + 1}/${day.getDate()}`;
                dateCell.textContent = formattedDate;

                headerRow.appendChild(dateCell);
            }

            //插入第一行日期的title
            table.appendChild(headerRow);


            // 外層迴圈產生最左側的時間直行
            for (const timeSlot of timeSlots) {
                const row = document.createElement("tr");
                const timeCell = document.createElement("td");
                timeCell.textContent = timeSlot;
                row.appendChild(timeCell);

                for (let i = 0; i < 7; i++) {
                    const cell = document.createElement("td");
                    cell.classList.add("schedule-cell");
                    const day = new Date(currentDate);//取得今天日期時間
                    day.setDate(currentDate.getDate() + i);
                    //使用 data- 屬性來在元素上儲存自定義的資料
                    cell.dataset.date = day.toLocaleDateString();
                    cell.dataset.time = timeSlot;
                    cell.addEventListener("click", handleCellClick);
                    row.appendChild(cell);
                }

                table.appendChild(row);
            }

            schedule.appendChild(table);
        }

        function handleCellClick() {
            const date = this.dataset.date;
            const time = this.dataset.time;
            if (confirm(`您想要預約 ${date} 的 ${time} 嗎？`)) {
                this.classList.add("selected");
                this.removeEventListener("click", handleCellClick);
            }
        }

        prevButton.addEventListener("click", () => {
            currentDate.setDate(currentDate.getDate() - 7);
            updateCalendar();
        });

        nextButton.addEventListener("click", () => {
            currentDate.setDate(currentDate.getDate() + 7);
            updateCalendar();
        });

        function updateCalendar() {
            showCurrentDate();
            createSchedule();
        }

        updateCalendar();

        const loadSpeaker = async(id)=>{
            //呼叫controller得到講師資訊
            axios.get(`https://localhost:7183/api/Reservation/id?id=${id}`)
                        .then(res=>{
                            console.log(res.data);
                            speaker.value = res.data;
                        })
                        .catch(err=>{
                            console.log(err);
                        })
        }
       
        ////呼叫controller得到講師資訊
        loadSpeaker(speakerId);
})
       

</script>
  
<style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .schedule-table {
            border-collapse: collapse;
            margin: 20px auto;
        }

        .schedule-table th,
        .schedule-table td {
            border: 1px solid #ccc;
            padding: 10px;
            cursor: pointer;
        }

        .schedule-table td.selected {
            background-color: green;
            color: white;
        }
 
</style>
  
 