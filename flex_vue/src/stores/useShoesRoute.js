import { defineStore } from "pinia";
import { ref } from "vue";

//引入了 pinia 中的 defineStore 函數，這是用來定義一個 Pinia store 的工具。
export const useShoesRoute = defineStore("ShoesRoute", {
    state: () => ({
        shoesProductId: "",
        originalPath: ""
    }),
    actions: {
        setShoesId(newId) {
            this.shoesProductId = newId;
        },
        setOriginalPath(newPath) {
            this.originalPath = newPath;
        }
    }

});