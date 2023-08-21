import axios from "axios";
export class Coupon {
  id: number = 0;
  couponCategoryId: number = 0;
  sendingId: number = 0;
  name: string = "";
  minimumPurchaseAmount: number = 0;
  discountType: number = 0;
  discountValue: number = 0;
  startDate: Date = new Date();
  startDateStr: string = "";
  endDate: Date = new Date();
  endDateStr: string = "";

}
export class MatchDiscount {
  constructor(
    public discountId: number = 0,
    public discountName: string = "",
    public discountDescription: string = "",
    public discountType: number = 0,
    public discountValue: number = 0,
    public conditionType: number = 0,
    public conditionValue: number = 0,
    public discountOrder: number = 0
  ) { }
}

export class CartItemProduct {
  constructor(
    public productSaleId: string = "",
    public productName: string = "",
    public unitPrice: number = 0,
    public salesPrice: number = 0,
    public size: string = "",
    public color: string = "",
    public matchDiscounts: MatchDiscount[] = [],
    public imgPath: string = "",
    public salesCategoryName: string = "",
    public salesCategoryNameStr: string = "",
    public categorySubStr: string = "",
    public tagsValue: string = ""
  ) { }
}

export class AppliedDiscount {
  constructor(
    public id: number = 0,
    public rule: any = null,
    public products: CartItemProduct[] = [],
    public amount: number = 0
  ) { }
}

export class CartItem {
  constructor(
    public cartItemId: number = 0,
    public cartId: number = 0,
    public productId: number = 0,
    public qty: number = 0,
    public product: CartItemProduct = new CartItemProduct(),
    public subTotal: number = 0,
    public unitSubTotal: number = 0
  ) { }
}

export class ShoppingCart {
  constructor(
    public memberId: number = 0,
    public cartItems: CartItem[] = [],
    public appliedDiscounts: AppliedDiscount[] = [],
    public coupon: Coupon = new Coupon(),
    public originalTotalAmount: number = 0,
    public deliveryFee: number = 0,
    public couponValue: number = 0,
    public totalPrice: number = 0,
    public checkoutData: CheckoutData = new CheckoutData()
  ) { }
}

export class Member {
  constructor(
    public memberId: number = 0,
    public fk_Level: number = 0,
    public levelName: string = "",
    public name: string = "",
    public email: string = "",
    public mobile: string = "",
    public gender: boolean = false,
    public birthday: string = "",
    public commonAddress: string = "",
    public alternateAddress1: string = "",
    public alternateAddress2: string = "",
    public isSubscribeNews: boolean = false
  ) { }
}

export class CheckoutData {
  constructor(
    public contactInfo: ContactInfo = new ContactInfo(),
    public billingAddress: BillingAddress = new BillingAddress(),
    public paymentInfo: PaymentInfo = new PaymentInfo()
  ) { }
}

export class ContactInfo {
  constructor(
    public contactName: string = "",
    public postalCode: string = "",
    public address: string = "",
    public email: string = "",
    public phone: string = ""
  ) { }
}

export class BillingAddress {
  constructor(
    public name: string = "",
    public postalCode: string = "",
    public address: string = "",
    public phone: string = ""
  ) { }
}

export class PaymentInfo {
  constructor(
    public paymentMethod: string = "",
    public cardName: string = "",
    public cardNumber: string = "",
    public expiration: string = "",
    public cvv: string = "",
    public confirmTerms: boolean = false,
    public couponId?: number
  ) { }
}

// 購物車物件
export class ShoppingCartItem {
  private item: CartItem;
  private memberId: number;
  private qty: number = 0;

  constructor(cartitem: CartItem, memberId: number) {
    this.item = { ...cartitem };
    this.memberId = memberId;
  }
  async addOneItem(callback?: () => void): Promise<void> {
    this.addItem(1, callback);
  }

  async addItem(qty: number, callback?: () => void): Promise<void> {
    this.item.qty += qty;
    this.qty = qty;
    this.updateItemQty(callback);
  }
  async removeOneItem(callback?: () => void): Promise<void> {
    this.removeItem(1, callback);
  }

  async removeItem(qty: number, callback?: () => void): Promise<void> {
    if (this.item.qty - qty <= 0) {
      const result = confirm("是否刪除此商品？");
      if (result) {
        this.qty = qty * -1
        this.updateItemQty(callback);
      }
      else {
        if (callback) {
          callback();
        }
      }
    }
    else {
      this.qty = qty * -1
      this.updateItemQty(callback);
    }
  }

  getCartItemQty(): number {
    return this.item.qty;
  }

  private updateItemQty = async (callback?: () => void) => {
    let url: string = `${import.meta.env.VITE_API_BASEADDRESS}api/Cart/UpdateItem`;
    const request = {
      MemberId: this.memberId,
      CartItem: this.item
    }
    request.CartItem.qty = this.qty;
    await axios
      .put(url, request)
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