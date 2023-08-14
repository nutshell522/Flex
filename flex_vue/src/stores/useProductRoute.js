import { defineStore } from "pinia";
import { ref } from "vue";

export const useProductRoute = defineStore({
  id: "route",
  state: () => ({
    originalPath: "",
  }),
  actions: {
    setOriginalPath(newPath) {
      this.originalPath = newPath;
    },
  },
});
