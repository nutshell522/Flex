<template>
  <!-- 77可以切換了但是怪怪-->
  <div class="container">
    <div class="card card-header">
      <ul class="nav-tabs card-header-tabs">
        <ul
          class="nav nav-tabs d-flex"
          style="align-items: center; justify-content: center"
        >
          <li class="nav-item" role="presentation">
            <button
              class="nav-link active"
              data-bs-toggle="tab"
              aria-selected="false"
            >
              <router-link to="/user">個人資料</router-link>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
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
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="">積分中心</router-link>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="/coupon">優惠券</router-link>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
              class="nav-link"
              data-bs-toggle="tab"
              data-bs-target="#profile-tab-pane"
              aria-selected="false"
            >
              <router-link to="">瀏覽紀錄</router-link>
            </button>
          </li>
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

<script>
import { ref } from 'vue';

const page = ref('favorites');
</script>

<style scoped>
.nav-justified {
  margin-bottom: 50px;
  display: flex;
  justify-content: center;
}

.nav ul {
  background-color: #f5f5f5;
  border-bottom: solid 1px lightgray;
}

.nav-tabs {
  justify-content: center;
}

.nav-tabs li {
  margin-right: 50px;
}

.pills {
  background-color: rebeccapurple;
  width: 20%;
  display: flex;
  justify-content: center;
}
</style>
