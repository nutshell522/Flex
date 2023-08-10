//商品符合折扣
export interface MatchDiscount {
    discountId: number;
    discountName: string;
    discountDescription: string;
    discountType: number;
    discountValue: number;
    conditionType: number;
    conditionValue: number;
    discountOrder: number;
}

// 購物車項目內商品資訊
export interface CartItemProduct {
    productSaleId: string;
    productName: string;
    unitPrice: number;
    salesPrice: number;
    size: string;
    color: string;
    matchDiscounts: MatchDiscount[];
    imgPath: string;
    salesCategoryName: string;
    salesCategoryNameStr: string;
}

// 購物車項目
export interface CartItem {
    cartItemId: number;
    cartId: number;
    productId: number;
    qty: number;
    product: CartItemProduct;
    subTotal: number;
    unitSubTotal: number;
}