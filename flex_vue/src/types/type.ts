import axios from "axios";
export class CountdownTimer {
  private targetTime: number | null;
  private intervalId: NodeJS.Timeout | null;
  private _countdownText: string;

  constructor(targetTime: number | null) {
    this.targetTime = targetTime;
    this.intervalId = null;
    this._countdownText = '';
    if (this.targetTime == null) {
      this._countdownText = '長期優惠';
    }
    else if (this.shouldStartCountdown()) {
      this.startCountdown();
    } else {
      this.displayDeadline();
    }
  }
  get countdownText(): string {
    return this._countdownText;
  }

  private updateDisplay(remainingTime: number) {
    const days = Math.floor(remainingTime / 86400);
    const hours = Math.floor((remainingTime % 86400) / 3600);
    const minutes = Math.floor((remainingTime % 3600) / 60);
    const seconds = remainingTime % 60;
    this._countdownText = `剩餘時間: ${hours} 小時 ${minutes} 分 ${seconds} 秒`;
  }

  private tick() {
    const currentTime = Math.floor(Date.now() / 1000);
    const remainingTime = Math.max(0, this.targetTime! - currentTime);

    this.updateDisplay(remainingTime);

    if (remainingTime === 0) {
      this.stopCountdown();
      this._countdownText = '已截止';
    }
  }

  private shouldStartCountdown(): boolean {
    const currentTime = Math.floor(Date.now() / 1000);
    const timeDifference = this.targetTime! - currentTime;
    return timeDifference <= 86400; // 86400 seconds = 1 day
  }

  private startCountdown() {
    this.intervalId = setInterval(() => this.tick(), 1000);
    this.tick();
  }

  public stopCountdown() {
    if (this.intervalId !== null) {
      clearInterval(this.intervalId);
      this.intervalId = null;
    }
  }
  private displayDeadline() {
    const deadline = new Date(this.targetTime! * 1000);
    const parsedDate = new Date(deadline);
    const year = parsedDate.getFullYear();
    const month = (parsedDate.getMonth() + 1).toString().padStart(2, '0');
    const day = parsedDate.getDate().toString().padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;
    this._countdownText = `截止日期: ${formattedDate}`;
  }
}
export class PayInfo {
  MerchantID: string = "";
  MerchantTradeNo: string = "";
  MerchantTradeDate: string = "";
  PaymentType: string = "";
  TotalAmount: string = "";
  TradeDesc: string = "";
  ItemName: string = "";
  ReturnURL: string = "";
  ChoosePayment: string = "";
  EncryptType: string = "";
  ClientBackURL: string = "";
  CheckMacValue: string = "";
  OrderResultURL: string = "";
  CustomField1: string = "";
  CustomField2: string = "";
  CustomField3: string = "";
  CustomField4: string = "";
}
export class SizeVM {
  productSaleId: string = "";
  productId: number = 0;
  size: string = "";
  color: string = "";
}
export class GetSizeVM {
  productSaleId: string = "";
  color: string = "";
}
export class Discount {
  discountId: number = 0;
  discountName: string = '';
  discountDescription: string = '';
  projectTagId: number = 0;
  startDate: Date = new Date();
  endDate: Date | null = null;
}
export class SalesCategory {
  id: number = 0;
  salesCategoryName: string = '';
  salesCategoryStr: string = '';
}
export class OnSaleProduct {
  imgPath: string = '';
  productDescription: string = '';
  productId: string = '';
  productName: string = '';
  salesPrice: number = 0;
  unitPrice: number | null = null;
  salesCategoryId: number = 0;
  salesCategoryStr: string = '';
}
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
    public paymentMethod: number = 0,
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