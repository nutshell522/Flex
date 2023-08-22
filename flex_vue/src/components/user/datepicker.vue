<template>
  <VueDatePicker
    v-model="date"
    :format="dateFormat"
    :disabled-dates="disabledDates"
  ></VueDatePicker>
</template>

<script>
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css';
import { ref, computed } from 'vue';

export default {
  components: { VueDatePicker },
  setup() {
    const date = ref(null);

    const dateFormat = 'yyyy-MM-dd';

    // For demo purposes disables dates after today
    const disabledDates = computed(() => {
      const today = new Date();
      return (date) => date > today;
    });

    return {
      date,
      dateFormat,
      disabledDates,
    };
  },
};
</script>

<style></style>
