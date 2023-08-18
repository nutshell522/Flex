import { defineStore } from "pinia";
import { ref } from "vue";

export const useProductRoute = defineStore("productRoute", {
  state: () => ({
    originalPath: "",
    productName: "",
    minPrice: "",
    maxPrice: "",
    productInfo: {
      salesCategoryName: "",
      categoryName: "",
      subCategoryName: "",
    },
  }),
  actions: {
    setOriginalPath(newPath) {
      this.originalPath = newPath;
    },
    setProductName(newName) {
      this.productName = newName;
    },
    setProductInfo(newInfo) {
      this.productInfo = newInfo;
    },
    setPriceInfo(newMinPrice, newMaxPrice) {
      this.minPrice = newMinPrice;
      this.maxPrice = newMaxPrice;
    },
  },
});
