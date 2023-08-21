import { defineStore } from "pinia";
import { ref } from "vue";

//引入了 pinia 中的 defineStore 函數，這是用來定義一個 Pinia store 的工具。
export const useActivityRoute = defineStore("activityRoute", {
    state: () => ({
        activityId: "",
        originalPath: ""
    }),
    actions: {
        setActivityId(newId) {
            this.activityId = newId;
        },
        setOriginalPath(newPath) {
            this.originalPath = newPath;
        }
    }

});