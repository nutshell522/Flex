<template>
  <div style="height: 1200px">
    <navBar></navBar>
    <userBar :btnActive="2"></userBar>
    <section id="searchorderout" class="container">
      <div id="srarchdate" class="col-3">
        <label>訂單時間:</label>
        <input
          type="text"
          v-model="begintime"
          @searchInputbegintime="inputbegintime"
          class="form-control datePicker"
          placeholder="輸入開始日期"
        />
        ~
        <input
          type="text"
          v-model="endtime"
          @searchInputendtime="inputendtime"
          class="form-control datePicker"
          placeholder="輸入結束日期"
        />
      </div>
      <div id="searchorder" class="col-3">
        <label>輸入關鍵字:</label>
        <input
          type="text"
          v-model="keyword"
          @searchInput="inputhandler"
          class="form-control"
          placeholder="輸入商品/活動/課程名稱"
        />
        <button class="button btn btn-outline-info" @click="keywordSearch">
          搜尋
        </button>
      </div>
    </section>
    <div id="cate">
      <button
        @click="
          setTypeValue('1');
          setostatusValue('');
        "
      >
        商品
      </button>

      <button
        @click="
          setTypeValue('4');
          setostatusValue('');
        "
      >
        客製化
      </button>

      <button
        @click="
          setTypeValue('2');
          setostatusValue('1');
        "
      >
        活動
      </button>

      <button
        @click="
          setTypeValue('3');
          setostatusValue('1');
        "
      >
        課程
      </button>
    </div>
    <section class="container" v-if="Type == 1">
      <table class="table" style="width: 1300px">
        <thead>
          <tr>
            <!-- <th></th> -->
            <th>訂單日期</th>
            <th>訂單編號</th>
            <th>總數量</th>
            <th>總金額</th>
            <th>付款方式</th>
            <th>發票編號</th>
            <th>訂單狀態</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="item in GetOrders" :key="item.id">
            <tr class="firstTr firtr" @click="toggleDetails(item.id)">
              <!-- <td class="firstTr"><button><i class="bi bi-chevron-down"></i></button></td> -->
              <td class="firstTr">{{ formatOrderTime(item.ordertime) }}</td>
              <td class="firstTr">{{ item.id }}</td>
              <td class="firstTr">{{ item.total_quantity }}</td>
              <td class="firstTr">{{ formatter.format(item.total_price) }}</td>
              <td class="firstTr">{{ item.pay_method }}</td>
              <td class="firstTr">{{ item.receipt }}</td>
              <td class="firstTr">{{ item.order_status }}</td>
            </tr>
            <tr>
              <td colspan="8">
                <table
                  class="table"
                  style="text-align: left; border: 2px solid black"
                  v-show="expandedItems.includes(item.id)"
                >
                  <tr>
                    <td colspan="8" style="text-align: right">
                      <div style="text-align: right">
                        <button
                          v-if="
                            item.order_status_Id !== 7 &&
                            item.order_status_Id !== 9 &&
                            item.order_status_Id !== 8 &&
                            item.close !== true
                          "
                          @click="setcancelProductIdValue(item.id)"
                          class="btn btn-primary"
                          style="margin-right: 30px"
                        >
                          申請取消
                        </button>
                        <button
                          v-if="
                            item.order_status_Id !== 7 &&
                            item.order_status_Id !== 9 &&
                            item.order_status_Id !== 8 &&
                            item.close !== true
                          "
                          @click="setreturnIdValue(item.id)"
                          class="btn btn-primary"
                          :data-bs-toggle="
                            item.order_status_Id === 6 ? 'modal' : null
                          "
                          :data-bs-target="
                            item.order_status_Id === 6 &&
                            item.pay_method_Id === 1
                              ? '#exampleModal'
                              : '#exampleModal1'
                          "
                        >
                          申請退貨
                        </button>
                        <button
                          v-if="item.order_status_Id == 9"
                          type="button"
                          class="btn btn-secondary"
                          @click="setcancelreturnIdValue2(item.id)"
                        >
                          取消退貨
                        </button>
                      </div>
                    </td>
                  </tr>
                  <tr v-for="orderItem in item.orderItems" :key="orderItem.id">
                    <td class="sceTr">
                      商品名稱：{{ orderItem.product_name }}
                    </td>
                    <td class="sceTr">數量：{{ orderItem.quantity }}</td>
                    <td class="sceTr">
                      價格：{{ formatter.format(orderItem.per_price) }}
                    </td>
                    <td class="sceTr">
                      規格：{{ orderItem.items_description }}
                    </td>
                    <td>
                      <button
                        v-if="
                          item.order_status_Id == 6 &&
                          orderItem.comment !== true &&
                          item.close == true
                        "
                        class="btn btn-primary"
                        :data-bs-toggle="'modal'"
                        :data-bs-target="'#exampleModal2'"
                        @click="
                          prepareCommentData(
                            item.fk_member_Id,
                            orderItem.productcommit,
                            orderItem.id
                          )
                        "
                      >
                        留下評論
                      </button>
                    </td>
                  </tr>
                  <hr />
                  <tr style="justify-content: center">
                    <td colspan="8">
                      <table
                        class=""
                        style="text-align: left"
                        v-show="expandedItems.includes(item.id)"
                      >
                        <tr>
                          <td
                            id="orderpeopleDetail"
                            style="
                              padding: 0 200px 80px 20px;
                              border-right: 2px solid black;
                              width: 500px;
                            "
                          >
                            <h6>商品收件資訊</h6>

                            <div>地址：{{ item.recipient_address }}</div>

                            <div>姓名:{{ item.receiver }}</div>

                            <div>電話:{{ item.cellphone }}</div>
                            <hr />
                            <h6>發票收件資訊</h6>

                            <div>地址：{{ item.biller_adress }}</div>

                            <div>姓名:{{ item.biller }}</div>

                            <div>電話:{{ item.biller_cellphone }}</div>
                          </td>
                          <td
                            id="orderItemDetail"
                            style="padding-left: 30px; width: 800px"
                          >
                            <h6>運費</h6>
                            <div>{{ formatter.format(item.freight) }}</div>
                            <h6>已使用優惠券</h6>
                            <div>{{ item.coupon_name }}</div>
                            <h6>優惠券折扣</h6>
                            <div>
                              {{ formatter.format(item.coupon_discount) }}
                            </div>
                            <h6>訂單金額</h6>
                            <div>${{ formatter.format(item.total_price) }}</div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </section>
    <section class="container" v-if="Type == 4">
      <table class="table" style="width: 1300px">
        <thead>
          <tr>
            <!-- <th></th> -->
            <th>訂單日期</th>
            <th>訂單編號</th>
            <th>總數量</th>
            <th>總金額</th>
            <th>付款方式</th>
            <th>發票編號</th>
            <th>訂單狀態</th>
          </tr>
        </thead>
        <tbody>
          <template v-for="item in GetOrders" :key="item.id">
            <tr class="firstTr firtr" @click="toggleDetails(item.id)">
              <!-- <td><button @click="toggleDetails(item.id)"><i class="bi bi-chevron-down"></i></button></td> -->
              <td class="firstTr">{{ formatOrderTime(item.ordertime) }}</td>
              <td class="firstTr">{{ item.id }}</td>
              <td class="firstTr">{{ item.total_quantity }}</td>
              <td class="firstTr">{{ formatter.format(item.total_price) }}</td>
              <td class="firstTr">{{ item.pay_method }}</td>
              <td class="firstTr">{{ item.receipt }}</td>
              <td class="firstTr">{{ item.order_status }}</td>
            </tr>
            <tr>
              <td colspan="8">
                <table
                  class="table"
                  style="text-align: left; border: 2px solid black"
                  v-show="expandedItems.includes(item.id)"
                >
                  <tr>
                    <td colspan="4" style="text-align: right">
                      <div style="text-align: right">
                        <button
                          v-if="
                            item.order_status_Id !== 7 &&
                            item.order_status_Id !== 9 &&
                            item.order_status_Id !== 8 &&
                            item.order_status_Id !== 10 &&
                            item.close !== true
                          "
                          @click="setcancelIdValue(item.id)"
                          class="btn btn-primary"
                          style="margin-right: 30px"
                        >
                          申請取消
                        </button>
                        <button
                          v-if="
                            item.order_status_Id !== 7 &&
                            item.order_status_Id !== 9 &&
                            item.order_status_Id !== 8 &&
                            item.order_status_Id !== 10 &&
                            item.close !== true
                          "
                          @click="setchangeIdValue(item.id)"
                          class="btn btn-primary"
                        >
                          申請換貨
                        </button>
                        <button
                          v-if="item.order_status_Id == 10"
                          type="button"
                          class="btn btn-secondary"
                          @click="setcancelreturnIdValue3(item.id)"
                        >
                          取消換貨
                        </button>
                      </div>
                    </td>
                  </tr>
                  <tr v-for="orderItem in item.orderItems" :key="orderItem.id">
                    <td>商品名稱：{{ orderItem.product_name }}</td>
                    <td>數量：{{ orderItem.quantity }}</td>
                    <td>價格：{{ formatter.format(orderItem.per_price) }}</td>
                    <td>規格：{{ orderItem.items_description }}</td>
                  </tr>
                  <hr />
                  <tr style="justify-content: center">
                    <td colspan="8">
                      <table
                        class=""
                        style="text-align: left"
                        v-show="expandedItems.includes(item.id)"
                      >
                        <tr>
                          <td
                            style="
                              padding: 0 200px 80px 20px;
                              border-right: 2px solid black;
                              width: 500px;
                            "
                          >
                            <h3>收件資訊</h3>
                            <div>地址：{{ item.recipient_address }}</div>
                            <br />
                            <div>姓名:{{ item.receiver }}</div>
                            <br />
                            <div>電話{{ item.cellphone }}</div>
                          </td>
                          <td
                            id="orderItemDetail"
                            style="padding-left: 30px; width: 800px"
                          >
                            <h6>運費</h6>
                            <div>{{ formatter.format(item.freight) }}</div>
                            <h6>運費折扣</h6>
                            <h6>已使用優惠券</h6>
                            <div>{{ item.coupon_name }}</div>
                            <h6>優惠券折扣</h6>
                            <div>
                              {{ formatter.format(item.coupon_discount) }}
                            </div>
                            <h6>訂單金額</h6>
                            <div>{{ formatter.format(item.total_price) }}</div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </section>
    <section class="container" v-if="Type == 2">
      <table class="table" style="width: 100%">
        <div id="cateorder">
          <button @click="setostatusValue('1')">即將開始</button>

          <button @click="setostatusValue('7')">已取消</button>

          <button @click="setostatusValue('6')">已結束</button>
        </div>
        <thead>
          <h3>我報名的活動</h3>
        </thead>
        <tbody>
          <template v-for="item in GetOrders" :key="item.id">
            <tr
              v-for="orderItem in item.orderItems"
              :key="orderItem.id"
              class="secondtr"
            >
              <td style="text-align: left" @click="toggleDetails(item.id)">
                <div>活動名稱：{{ orderItem.product_name }}</div>
                <div>活動時間:{{ formatOrderTime(item.close_time) }}</div>
                <div>活動地點：{{ item.recipient_address }}</div>
                <div>活動講師:{{ item.receiver }}</div>
                <div>費用：{{ formatter.format(orderItem.per_price) }}</div>
              </td>
              <!-- <td><button @click="toggleDetails(item.id)">收合/展開</button></td> -->
            </tr>
            <tr>
              <td colspan="8">
                <table
                  class="table"
                  style="text-align: left; border: 2px solid black"
                  v-show="expandedItems.includes(item.id)"
                >
                  <tr style="justify-content: center">
                    <td colspan="8">
                      <table
                        class=""
                        style="text-align: left"
                        v-show="expandedItems.includes(item.id)"
                      >
                        <tr>
                          <td
                            style="padding: 10px 200px 20px 20px; width: 500px"
                          >
                            <h3>訂單詳請</h3>
                            <div>
                              購買時間：{{ formatOrderTime(item.ordertime) }}
                            </div>
                            <div>訂單編號:{{ item.id }}</div>
                            <div>發票編號{{ item.receipt }}</div>
                            <button
                              v-if="
                                item.order_status_Id !== 7 &&
                                item.order_status_Id !== 6
                              "
                              @click="setcancelIdValue(item.id)"
                              class="btn btn-success"
                            >
                              申請取消
                            </button>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </section>
    <section class="container" v-if="Type == 3">
      <table class="table" style="width: 100%">
        <div id="cateorder">
          <button @click="setostatusValue('1')">即將開始</button>

          <button @click="setostatusValue('7')">已取消</button>

          <button @click="setostatusValue('6')">已結束</button>
        </div>
        <thead>
          <h3>我報名的課程</h3>
        </thead>
        <tbody>
          <template v-for="item in GetOrders" :key="item.id">
            <tr
              v-for="orderItem in item.orderItems"
              :key="orderItem.id"
              class="secondtr"
            >
              <td style="text-align: left" @click="toggleDetails(item.id)">
                <div>課程名稱：{{ orderItem.product_name }}</div>
                <div>課程時間:{{ formatOrderTime(item.close_time) }}</div>
                <div>課程地點：{{ item.recipient_address }}</div>
                <div>課程講師:{{ item.receiver }}</div>
              </td>
              <!-- <td><button @click="toggleDetails(item.id)">收合/展開</button></td> -->
            </tr>
            <tr>
              <td colspan="8">
                <table
                  class="table"
                  style="text-align: left; border: 2px solid black"
                  v-show="expandedItems.includes(item.id)"
                >
                  <tr style="justify-content: center">
                    <td colspan="8">
                      <table
                        class=""
                        style="text-align: left"
                        v-show="expandedItems.includes(item.id)"
                      >
                        <tr>
                          <td
                            style="padding: 10px 200px 20px 20px; width: 500px"
                          >
                            <h3>訂單詳請</h3>
                            <div>
                              購買時間：{{ formatOrderTime(item.ordertime) }}
                            </div>
                            <div>訂單編號:{{ item.id }}</div>
                            <button
                              v-if="
                                item.order_status_Id !== 7 &&
                                item.order_status_Id !== 6
                              "
                              @click="setcancelcourseIdValue(item.id)"
                              class="btn btn-success"
                            >
                              申請取消
                            </button>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </template>
        </tbody>
      </table>
    </section>

    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">輸入退款資訊</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label class="form-label">退款帳號:</label>
              <input
                type="text"
                class="form-control"
                v-model="returnaccount"
                maxlength="16"
              />
            </div>
            <div class="form-group">
              <label class="form-label">退貨原因:</label>
              <select class="form-control" v-model="returnreason">
                <option
                  v-for="reason in reReason"
                  :key="reason.id"
                  :value="reason.id"
                >
                  {{ reason.退貨理由 }}
                </option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
              @click="setcancelreturnIdValue()"
            >
              關閉
            </button>
            <button
              type="button"
              class="btn btn-primary"
              data-bs-dismiss="modal"
              @click="setreturndetalValue()"
              :disabled="isButtonDisabled"
            >
              確定
            </button>
          </div>
        </div>
      </div>
    </div>

    <div
      class="modal fade"
      id="exampleModal1"
      tabindex="-1"
      aria-labelledby="exampleModalLabel1"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">輸入退款資訊</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label class="form-label">退款帳號:</label>
              <label class="form-label">此商品為信用卡付款或第三方支付</label>
            </div>
            <div class="form-group">
              <label class="form-label">退貨原因:</label>
              <select class="form-control" v-model="returnreason">
                <option
                  v-for="reason in reReason"
                  :key="reason.id"
                  :value="reason.id"
                >
                  {{ reason.退貨理由 }}
                </option>
              </select>
            </div>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
              @click="setcancelreturnIdValue()"
            >
              關閉
            </button>
            <button
              type="button"
              class="btn btn-primary"
              data-bs-dismiss="modal"
              @click="setreturndetalValue()"
              :disabled="isButtonDisabled2"
            >
              確定
            </button>
          </div>
        </div>
      </div>
    </div>

    <template v-for="item in GetOrders" :key="item.id">
      <div
        class="modal fade"
        id="exampleModal2"
        tabindex="-1"
        aria-labelledby="exampleModalLabel2"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">評分</h5>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label class="form-label">分數:</label>
                <input
                  class="form-range"
                  type="range"
                  min="0"
                  max="5"
                  step="1"
                  v-model="commentstar"
                  @input="handleInput()"
                />
              </div>
              <div class="form-group">
                <label class="form-label">評論:</label>
                <textarea
                  class="form-control"
                  v-model="commentdescription"
                ></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
                @click="returncomment()"
              >
                取消
              </button>
              <button
                type="button"
                class="btn btn-primary"
                data-bs-dismiss="modal"
                @click="comment()"
              >
                確定
              </button>
            </div>
          </div>
        </div>
      </div>
    </template>

    <div class="chat" style="display: none">
      <h4>聊天室</h4>
      <div id="showcon" class="showcon">
        <div>
          <div v-for="message in messages" :key="message.id">
            <ul
              :class="{
                'align-left': message.userName === 'GM',
                'align-right': message.userName !== 'GM',
              }"
            >
              <li>
                {{ message.message }}
                <br />
                <span class="message-timestamp">{{ message.timestamp }}</span>
              </li>
            </ul>
          </div>
          <div class="p-2 chat"></div>
        </div>
      </div>
      <!-- <input v-model="userName" placeholder="使用者名稱"> -->
      <input id="msg" v-model="messageText" placeholder="訊息" />
      <button
        class="btn btn-success"
        @click="sendMessage()"
        :disabled="!messageText"
      >
        送出
      </button>
    </div>
    <button class="chat2" @click="toggleContainer()">
      <i class="bi bi-chat-right-dots">客服</i>
    </button>
    <!-- <div class="showcon" id="showcon">
        <div class="container" id="app">
          <div class="row">
            <input class="col-4 m-1" id="userName" placeholder="User name" />
            <input class="col-6 m-1" id="message" placeholder="Message" />
            <button class="col-1 m-1" id="send">Send</button>
          </div>
          <div class="p-2 chat">
            <ul id="list">
            </ul>
          </div>
        </div>
      </div>
      <input type="text" id="msg" />
      <button @click="send()">發送</button> -->

    <!-- <div class="modal fade" id="insertModal" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog"
    aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalTitleId">輸入退款資訊</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label class="form-label">退款帳號:</label>
            <input type="text" class="form-control" v-model="returnaccount" />
          </div>
          <div class="form-group">
            <label class="form-label">退貨原因:</label>
            <input type="text" class="form-control" v-model="returnreason" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-info" data-bs-dismiss="modal">關閉</button>
          <button type="button" class="btn btn-primary" @click="insert">確定</button>
        </div>
      </div>
    </div>
  </div> -->
  </div>
</template>
<script setup>
//import OrdernavBar from "@/components/Order/OrdernavBar.vue";
import navBar from "@/components/home/navBar.vue";
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";
import userBar from "@/components/user/userBar.vue";
import { MandarinTraditional } from "flatpickr/dist/l10n/zh-tw.js";
import Swal from "sweetalert2/dist/sweetalert2.js";
//------get使用者ID--------

//------get使用者ID--------

const baseAddress = import.meta.env.VITE_API_BASEADDRESS;
const GetOrders = ref([]);
const Type = ref("");
const keyword = ref("");
const begintime = ref("");
const endtime = ref("");
const expandedItems = ref([]);
const cancelId = ref("");
const retrunId = ref("");
const ostatus = ref("");
const returnaccount = ref("");
const returnreason = ref("");
const returnOrderId = ref("");
const request = ref([]);
const reReason = ref([]);
const commentMemberid = ref("");
const commentProductid = ref("");
const commentstar = ref("");
const commentdescription = ref("");
const commentId = ref("");
var wsUrl = `wss://localhost:7183`;
var socket = null;
const messages = ref([]);
const userName = ref("");
const messageText = ref("");
const isButtonDisabled = ref(true);
const isButtonDisabled2 = ref(true);

//------get使用者ID--------
const storedUser = localStorage.getItem("loggedInUser");
const userObject = JSON.parse(storedUser);
const membersId = userObject ? userObject.memberId : null;
let currentUserName = "GM";
//------get使用者ID--------
const loadGetOrders = async () => {
  const begintimeValue = begintime.value;
  const endtimeValue = endtime.value;
  if (begintimeValue > endtimeValue) {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: "時間錯誤：開始時間不能大於結束時間!",
      showConfirmButton: false,
      timer: 1500,
    });
    begintime.value = "";
    endtime.value = "";
    return;
  }
  await axios
    .get(
      `${baseAddress}api/Orders/GetOrders?begintime=${begintime.value}&endtime=${endtime.value}&keyword=${keyword.value}&typeId=${Type.value}&ostatusId=${ostatus.value}&memberId=${userObject.memberId}`
    )
    .then((response) => {
      console.log(response.data);
      GetOrders.value = response.data;
    })
    .catch((error) => {
      alert(error);
    });
};
const CancelOrders = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/cancel?id=${cancelId.value}`)
    .then((response) => {
      //console.log(response.data);
      if (response.data == "已取消訂單") {
        Swal.fire("訂單已取消");
      } else if (response.data == "訂單已寄出，無法取消") {
        Swal.fire({
          icon: "info",
          showConfirmButton: false,
          text: "商品已寄出，無法取消!",
          timer: 1500,
        });
      } else if (response.data == "已過退費時間，無法取消") {
        Swal.fire({
          icon: "info",
          showConfirmButton: false,
          text: "已過退費時間，無法取消訂單",
          timer: 1500,
        });
      }
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const Cancelcourse = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/cancelcourse?id=${cancelId.value}`)
    .then((response) => {
      //console.log(response.data);
      if (response.data == "已取消預約") {
        Swal.fire({
          text: "已取消預約",
          showConfirmButton: false,
          timer: 1500,
        });
      }
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const CancelProductOrders = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/cancelProduct?id=${cancelId.value}`)
    .then((response) => {
      //console.log(response.data);
      if (response.data == "已取消訂單") {
        Swal.fire("訂單已取消");
      } else if (response.data == "訂單已寄出，無法取消") {
        Swal.fire({
          icon: "info",
          showConfirmButton: false,
          text: "商品已寄出，無法取消!",
          timer: 1500,
        });
      } else if (response.data == "已過退費時間，無法取消") {
        Swal.fire({
          icon: "info",
          showConfirmButton: false,
          text: "已過退費時間，無法取消訂單",
          timer: 1500,
        });
      }

      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const setcancelIdValue = (paramValue) => {
  cancelId.value = paramValue;
  CancelOrders();
};
const setcancelcourseIdValue = (paramValue) => {
  cancelId.value = paramValue;
  Cancelcourse();
};
const setcancelProductIdValue = (paramValue) => {
  cancelId.value = paramValue;
  CancelProductOrders();
};
watch([returnaccount, returnreason], ([accountValue, reasonValue]) => {
  isButtonDisabled.value = !(
    accountValue.length >= 10 &&
    accountValue.length <= 16 &&
    /^\d+$/.test(accountValue) &&
    reasonValue
  );
});
watch([returnaccount, returnreason], ([accountValue, reasonValue2]) => {
  isButtonDisabled2.value = !reasonValue2;
});
const ReturnOrders = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/return?orderid=${retrunId.value}`)
    .then((response) => {
      //console.log(response.data);
      // if (response.data == '已申請退貨') {
      //   Swal.fire({
      //     position: 'top', icon: 'warning', text: '已申請退貨', showConfirmButton: false, timer: 1500
      //   });
      // }
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const setreturnIdValue = (paramValue) => {
  retrunId.value = paramValue;
  ReturnOrders();
};
const CancelReturnOrders = async () => {
  await axios
    .put(
      `https://localhost:7183/api/Orders/cancelreturn?orderid=${retrunId.value}`
    )
    .then((response) => {
      //console.log(response.data);
      if (response.data == "已取消退貨") {
        Swal.fire({
          position: "top",
          icon: "info",
          text: "已取消退貨",
          showConfirmButton: false,
          timer: 1500,
        });
      }
      loadGetOrders();
      returnaccount.value = "";
      returnreason.value = "";
    })
    .catch((error) => {
      alert(error);
    });
};
const CancelChangeOrders = async () => {
  await axios
    .put(
      `https://localhost:7183/api/Orders/cancelChange?orderid=${retrunId.value}`
    )
    .then((response) => {
      //console.log(response.data);
      alert(response.data);
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const SetOrdersclose = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/setclose?orderid=${retrunId.value}`)
    .then((response) => {
      //console.log(response.data);
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const setcancelreturnIdValue = async (paramValue) => {
  returnOrderId.value = paramValue;
  await CancelReturnAndCloseOrders();
};
const setcancelreturnIdValue2 = async (paramValue) => {
  retrunId.value = paramValue;
  await CancelReturnAndCloseOrders();
};
const setcancelreturnIdValue3 = async (paramValue) => {
  retrunId.value = paramValue;
  await CancelChangeOrders();
  await SetOrdersclose();
};
const CancelReturnAndCloseOrders = async () => {
  await CancelReturnOrders();
  await SetOrdersclose();
};
const Returndetail = async () => {
  let showError = false;
  if (returnaccount.value !== "" && !/^\d+$/.test(returnaccount.value)) {
    alert("退貨原因必須是數字");
    showError = true;
  }
  if (!returnreason.value) {
    alert("請選擇退貨原因");
    showError = true;
  }

  if (showError) {
    CancelReturnAndCloseOrders();
    return;
  }
  const requestData = {
    退貨轉帳帳號: returnaccount.value,
    退貨理由: returnreason.value,
  };
  await axios
    .post(
      `https://localhost:7183/api/Orders/NewReturn?orderid=${retrunId.value}`,
      requestData
    )
    .then((response) => {
      if (response.data == "輸入成功") {
        Swal.fire({
          position: "center",
          icon: "success",
          text: "退款資訊已提交",
          showConfirmButton: false,
          timer: 1500,
        });
      }
      loadGetOrders();
      returnaccount.value = "";
      returnreason.value = "";
    })
    .catch((error) => {
      alert(error);
    });
};
const setreturndetalValue = (paramValue) => {
  returnOrderId.value = paramValue;
  Returndetail();
};
const fetchReturnReasons = async () => {
  await axios
    .get("https://localhost:7183/api/Orders/ReturnReasons")
    .then((response) => {
      reReason.value = response.data;
      console.log(reReason.value);
    })
    .catch((error) => {
      alert(error);
    });
};
const activityclose = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/activitycolse`)
    .then((response) => {
      //console.log(response.data);
      //loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const ChangeOrders = async () => {
  await axios
    .put(`https://localhost:7183/api/Orders/Change?orderid=${retrunId.value}`)
    .then((response) => {
      //console.log(response.data);
      alert(response.data);
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const setchangeIdValue = (paramValue) => {
  retrunId.value = paramValue;
  ChangeOrders();
};
const prepareCommentData = async (item, orderItem, orderitemId) => {
  commentMemberid.value = item;
  commentProductid.value = orderItem;
  commentId.value = orderitemId;
};
const comment = async () => {
  if (commentstar.value == 0) {
    commentstar.value = 1;
  }
  const commentData = {
    memberID: commentMemberid.value,
    productId: commentProductid.value,
    score: commentstar.value,
    description: commentdescription.value,
  };
  await axios
    .post(`https://localhost:7183/api/Orders/Newcommit`, commentData)
    .then((response) => {
      Swal.fire({
        icon: "success",
        title: "評論成功",
        showConfirmButton: false,
        timer: 1500,
      });
      closecomment();
      loadGetOrders();
      commentstar.value = "1";
      commentdescription.value = "";
    })
    .catch((error) => {
      alert(error);
    });
};

const handleInput = () => {
  if (commentstar.value == 0) {
    commentstar.value = 1;
  }
};
const closecomment = async () => {
  await axios
    .put(
      `https://localhost:7183/api/Orders/fincomment?orderid=${commentId.value}`
    )
    .then((response) => {
      //console.log(response.data);
      loadGetOrders();
    })
    .catch((error) => {
      alert(error);
    });
};
const formatter = new Intl.NumberFormat("zh-TW", {
  style: "currency",
  currency: "TWD",
  minimumFractionDigits: 0, // 最少保留小數位數
  maximumFractionDigits: 0, // 最多保留小數位數
});
// const ReturnReason = async () => {
//   if (this.selectedReason === null) {
//     alert('请选择退货原因');
//     return;
//   }
//   await axios
//     .put(`https://localhost:7183/api/Orders/ReturnReason?id=${selectedReason.value}`)
//     .then((response) => {
//       alert(response.data);
//       //loadGetOrders();
//     })
//     .catch((error) => {
//       alert(error);
//     });
// };
let isConnected = false;
const connect = () => {
  if (!socket || socket.readyState !== WebSocket.OPEN) {
    socket = new WebSocket(wsUrl + `/ws?membersId=${membersId}`);
    socket.onmessage = (e) => processMessage(e.data);
    socket.onopen = () => {
      if (!isConnected) {
        sendInitialMessage();
        isConnected = true;
      }
    };
  }
};
const processMessage = (data) => {
  const content = JSON.parse(data);
  const timestamp = new Date().toLocaleTimeString(); // Get current timestamp
  content.timestamp = timestamp;
  messages.value.push(content);
};
const sendInitialMessage = () => {
  if (socket && socket.readyState === WebSocket.OPEN) {
    const data = {
      userName: currentUserName,
      message: "您好，很高興為您服務",
      timestamp: new Date().toLocaleTimeString(),
    };
    socket.send(JSON.stringify(data));
  }
};
const sendMessage = () => {
  if (socket && socket.readyState === WebSocket.OPEN) {
    const data = {
      userName: membersId,
      message: messageText.value,
      timestamp: new Date().toLocaleTimeString(),
    };
    socket.send(JSON.stringify(data));
    messageText.value = "";
  }
};

const formatOrderTime = (ordertime) => {
  const dateTimeObject = new Date(ordertime);
  const year = dateTimeObject.getFullYear();
  const month = (dateTimeObject.getMonth() + 1).toString().padStart(2, "0");
  const dates = dateTimeObject.getDate().toString().padStart(2, "0");
  const hours = dateTimeObject.getHours().toString().padStart(2, "0");
  const minutes = dateTimeObject.getMinutes().toString().padStart(2, "0");
  return year + "-" + month + "-" + dates + " " + hours + ":" + minutes + "";
};
const setTypeValue = async (paramValue) => {
  Type.value = paramValue;
  //loadGetOrders();
};
const setostatusValue = async (paramValue) => {
  ostatus.value = paramValue;
  loadGetOrders();
};

const emit = defineEmits(["searchInput"]);
const inputhandler = () => {
  emit1("searchInput", keyword.value);
  loadGetOrders();
};

const inputbegintime = () => {
  emit2("searchInputbegintime", begintime.value);
  loadGetOrders();
};

const inputendtime = () => {
  emit3("searchInputendtime", endtime.value);
  loadGetOrders();
};

const keywordSearch = () => {
  loadGetOrders();
};

const toggleDetails = (itemId) => {
  if (expandedItems.value.includes(itemId)) {
    const index = expandedItems.value.indexOf(itemId);
    expandedItems.value.splice(index, 1);
  } else {
    expandedItems.value.push(itemId);
  }
};
const returncomment = () => {
  return;
};
const toggleContainer = () => {
  var container = document.querySelector(".chat");
  if (container.style.display === "none" || container.style.display === "") {
    container.style.display = "block";
  } else {
    container.style.display = "none";
  }
};
onMounted(() => {
  Type.value = 1;
  commentstar.value = 1;
  flatpickr(".datePicker", {
    enableTime: false,
    maxDate: "today",
    dateFormat: "Y-m-d",
    locale: MandarinTraditional,
  });
  activityclose();
  loadGetOrders();
  fetchReturnReasons();
  connect();
});
</script>
<style scoped>
#orderItemDetail > h6 {
  color: red;
}

.table > thead > tr > th {
  background-color: rgb(224, 149, 149);
  color: white;
  text-align: center;
}

.table > tbody > tr > td {
  text-align: center;
}

.tables > thead > tr > th {
  background-color: rgba(161, 112, 112, 0.466);
  color: white;
  text-align: center;
}

.tables {
  text-align: center;
  padding-top: 20px;
  border-bottom: solid gray 2px;
}

#cate > button {
  border-right: gray solid 2px;
  border-top: gray solid 2px;
  border-left: gray solid 2px;
  text-align: center;
  padding: 0 5px 0 5px;
  margin: 0 0 0 50px;
  font-size: 30px;
  border-radius: 10% 10% 0 0;
}

#cate > button:hover {
  background-color: rgb(131, 202, 181);
  color: #ededef;
}

#cate {
  justify-content: center;
  text-align: center;
  width: 60%;
  margin: 0 0 0 0px;
}

#cateorder {
  background: linear-gradient(rgb(250, 238, 198) 80%, rgb(255, 255, 255));

  /* background-color: antiquewhite; */
  text-align: center;
  width: 40%;
  border-radius: 10%;
}

#cateorder > button {
  text-align: center;
  padding-right: 20px;
  margin: 10px 30px 10px 10px;
  font-size: 30px;
  border: skyblue solid 2px;
  border-radius: 10%;
}

#cateorder > button:hover {
  background-color: rgb(60, 161, 179);
  color: #ededef;
}

#searchorderout {
  width: 50%;
  margin: 0 500px 30px;
  justify-content: center;
  text-align: center;
  border: #dfd8cda4 solid 2px;
}

#searchorder {
  text-align: center;
  width: 70%;
  display: flex;
  justify-content: left;
  align-items: center;
  margin-left: 15px;
}

#searchorder > input {
  margin: 20px;
  padding: 10px;
  width: 300px;
}

#searchorder > button {
  margin: 20px;
  padding: 10px;
  width: 60px;
  position: relative;
}

#srarchdate {
  text-align: center;
  width: 64%;
  display: flex;
  justify-content: center;
  align-items: center;
}

#srarchdate > input {
  margin: 20px;
  padding: 10px;
  width: 200px;
}

.firstTr {
  padding: 30px 0 30px 0;
}

.firtr:hover td {
  background-color: #e3ecff;
  cursor: pointer;
}

.secondtr:hover td {
  background-color: #ffe4ca;
  cursor: pointer;
}

.sceTr {
  padding: 10px;
}

[type="range"] {
  -webkit-appearance: none;
  appearance: none;
  margin: 0;
  outline: 0;
  cursor: pointer;
  width: calc(var(--number, 5) * 2em);
  --mask-url: url("data:image/svg+xml,%3Csvg width='12' height='11' viewBox='0 0 12 11' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M6 0l1.693 3.67 4.013.476L8.74 6.89l.788 3.964L6 8.88l-3.527 1.974.788-3.964L.294 4.146l4.013-.476L6 0z'/%3E%3C/svg%3E");
  --mask: var(--mask-url) repeat-x left / 2em 100%;
}

[type="range"]::-webkit-slider-runnable-track {
  background: #f59b00;
  height: 2em;
  -webkit-mask: var(--mask);
  mask: var(--mask);
}

[type="range"]::-webkit-slider-thumb {
  -webkit-appearance: none;
  width: 0;
  height: 100%;
  box-shadow: 999em 0 0 999em #ededef;
}

[type="range"]:focus::-webkit-slider-thumb {
  box-shadow: 999em 0 0 999em #ededef;
  background: #f59b00;
}

/* 只展示 */
[type="range"][readonly] {
  pointer-events: none;
}

/* 兼容火狐浏览器 */
[type="range"],
_::-moz-range-track {
  appearance: auto;
}

[type="range"],
_::-moz-range-track {
  appearance: none;
  -webkit-mask: var(--mask);
  mask: var(--mask);
  height: 2em;
}

[type="range"]::-moz-range-track {
  background: #ededef;
  height: inherit;
}

[type="range"]::-moz-range-progress {
  background: #f59b00;
  height: inherit;
}

[type="range"]::-moz-range-thumb {
  width: 0;
  opacity: 0;
}

.chat {
  width: 400px;
  text-align: center;
  padding: 20px 0;
  max-width: 0 auto;
  overflow: auto;
  background-color: rgb(149, 236, 149);
  position: fixed;
  bottom: 0;
  right: 200px;
  border-radius: 5%;
}

.chat2 {
  width: 200px;
  height: 50px;
  text-align: center;
  padding: 0 0;
  max-width: 0 auto;
  /* overflow: auto; */
  background-color: rgb(185, 235, 236);
  position: fixed;
  bottom: 0;
  right: 0;
  border-radius: 5%;
}

.chat .showcon {
  width: 380px;
  height: 300px;
  padding: 10px;
  overflow: auto;
  background-color: #fff;
  margin: 0 auto 10px;
  border-radius: 5%;
}

#msg {
  width: 270px;
  height: 40px;
  margin-bottom: 10px;
  border-radius: 5%;
}

.chat button {
  width: 60px;
  height: 40px;
  vertical-align: middle;
  border-radius: 5%;
}

.align-left {
  text-align: left;
}

.align-left > li {
  border-radius: 5px;
  background-color: rgb(247, 206, 93);
  padding: 5px;
  display: inline-block;
  /* 让气泡宽度根据内容自动调整 */
  white-space: normal;
  /* 允许文本换行 */
  max-width: 80%;
  /* 可选：限制气泡的最大宽度，以免过宽 */
  margin: 5px 0;
  /* 可选：调整气泡之间的垂直间距 */
}

.align-right {
  text-align: right;
}

.align-right > li {
  border-radius: 5px;
  background-color: rgb(178, 211, 200);
  padding: 5px;
  display: inline-block;
  /* 让气泡宽度根据内容自动调整 */
  white-space: normal;
  /* 允许文本换行 */
  max-width: 80%;
  /* 可选：限制气泡的最大宽度，以免过宽 */
  margin: 5px 0;
  /* 可选：调整气泡之间的垂直间距 */
}

#orderpeopleDetail {
  justify-content: center;
  align-items: center;
}

#orderpeopleDetail > div {
  padding-bottom: 5px;
}

.activityordertable {
  border: #f59b00 solid 2px;
}

section.container {
  border-top: gray solid 2px;
  border-left: gray solid 2px;
  border-right: gray solid 2px;
  border-radius: 5px;
  padding-top: 10px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.message-timestamp {
  font-size: 10px;
  color: gray;
  margin-left: 10px;
}
</style>
