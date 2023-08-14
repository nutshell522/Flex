<template>
  <div class="container area">
    <div class="text">
      <label for="checkNum">驗證碼</label>
    </div>
    <input
      type="text"
      class="form-control mb-3"
      name="checkNum"
      placeholder="請輸入4位驗證碼"
    />
    <div class="nextBtn">
      <button type="submit" class="btn btn-info">下一步</button>
    </div>
    <div class="checkText">
      <label for="">沒收到驗證信 ?</label>
    </div>
  </div>
</template>

<script setup>
// const email = ref('');
</script>

<style scoped>
.area {
  border: 1px solid;
  max-width: 50%;
}
.checkNum {
  margin-bottom: 10px;
}
.nextBtn {
  margin-bottom: 10px;
  display: flex;
  justify-content: center;
}
.text {
  margin-bottom: 10px;
}
.checkText {
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
