<template>
  <!-- 77可以切換了但是怪怪-->
  <div class="container">
    <div class="card card-header navTabs">
      <ul class="card-header-tabs">
        <ul
          class="nav nav-tabs d-flex"
          style="align-items: center; justify-content: center"
        >
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              :class="{ active: btnActive == '1' }"
              data-bs-toggle="tab"
              aria-selected="false"
            >
              <router-link to="/user">個人資料</router-link>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              :class="{ active: btnActive == '2' }"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="true"
            >
              <router-link to="/orders">訂單查詢 / 申請退貨</router-link>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="/favorites">收藏清單</router-link>
            </button>
          </li>
          <!-- <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="">積分中心</router-link>
            </button>
          </li> -->
          <!-- <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="/coupon">優惠券</router-link>
            </button>
          </li> -->
          <!-- <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="">瀏覽紀錄</router-link>
            </button>
          </li> -->
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="">購物車</router-link>
            </button>
          </li>
        </ul>
      </ul>
    </div>
  </div>
</template>

<script setup>
import { ref, defineProps } from "vue";

const page = ref("favorites");

const { btnActive } = defineProps(["btnActive"]);
</script>

<style scoped>
.nav-justified {
  margin-bottom: 50px;
  display: flex;
  justify-content: center;
}

.navTabs ul {
  background-color: #f5f5f5;
  border-bottom: solid 1px lightgray;
}

.navTabs {
  justify-content: center;
}

.navTabs li {
  margin-right: 50px;
}
.card {
  width: 100%;
  height: 0%;
}
</style>
