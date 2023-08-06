<template>{{ x }}</template>

<script setup>
import { computed, ref } from "vue";
import { useRouter, useRoute } from "vue-router";

const route = useRoute();
const x = computed(() => route.path);
</script>

<style></style>
