import axios from "axios";
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

// 購物車物件
export class ShoppingCartItem {
    private item: CartItem;

    constructor(cartitem: CartItem) {
        this.item = cartitem;
    }
    async addOneItem(callback?: () => void): Promise<void> {
        this.addItem(1, callback);
    }

    async addItem(qty: number, callback?: () => void): Promise<void> {
        this.item.qty += qty;
        this.updateItemQty(callback);
    }
    async removeOneItem(callback?: () => void): Promise<void> {
        this.removeItem(1, callback);
    }

    async removeItem(qty: number, callback?: () => void): Promise<void> {
        if (this.item.qty >= qty) {
            this.item.qty = Math.max(this.item.qty - qty, 0);
            if (this.item.qty > 0) {
                this.updateItemQty(callback);
            }
            if (this.item.qty <= 0) {
                const result = confirm("是否刪除此商品？");
                if (result) {
                    this.updateItemQty(callback);
                }
                else {
                    this.item.qty = 1;
                    this.updateItemQty(callback);
                }
            }
        }
    }

    getCartItemQty(): number {
        return this.item.qty;
    }

    private updateItemQty = async (callback?: () => void) => {
        let url: string = `${import.meta.env.VITE_API_BASEADDRESS}api/Cart/UpdateItem`;
        await axios
            .put(url, this.item)
            .then((response) => {
                if (callback) {
                    callback();
                }
            })
            .catch((error) => {
                alert(error);
                if (callback) {
                    callback();
                }
            });
    };
}