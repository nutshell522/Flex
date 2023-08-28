<template>
    <footer>
        <div class="container">
            <div class="footer-container">
                <div>
                    <h3 class="footer-btn">關於flex<i class="bi bi-plus d-lg-none"></i><i class="bi bi-dash d-lg-none"></i>
                    </h3>
                    <ul>
                        <li><a href="javascript:;">最新消息</a></li>
                        <li><a href="javascript:;">人才招募</a></li>
                        <li><a href="javascript:;">門市資訊</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="footer-btn">售後與工作室服務<i class="bi bi-plus d-lg-none"></i><i class="bi bi-dash d-lg-none"></i>
                    </h3>
                    <ul>
                        <li><a href="javascript:;">售後服務說明</a></li>
                        <li><a href="javascript:;">客服服務</a></li>
                        <li><a href="/CustomerIndex">客製化服務</a></li>
                    </ul>
                </div>
                <div class="me-push">
                    <h3 class="footer-btn">俱樂部<i class="bi bi-plus d-lg-none"></i><i class="bi bi-dash d-lg-none"></i></h3>
                    <ul>
                        <li><a href="/flexClub">活動與課程</a></li>
                    </ul>
                </div>
                <div class="social-network-wrapper">
                    <h3>社群網站</h3>
                    <ul>
                        <li>
                            <a href="javascript:;"><i class="fa-brands fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa-brands fa-facebook-f"></i></a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa-brands fa-line"></i></a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa-brands fa-instagram"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer-footer">
                <div>2023 Flex 版權所有</div>
                <ul>
                    <li><a href="javascript:;">銷售條款</a></li>
                    <li><a href="javascript:;">使用條款</a></li>
                    <li><a href="javascript:;">Flex 隱私權政策</a></li>
                </ul>
            </div>
        </div>
    </footer>
</template>
    
<script setup lang='ts'>
import { onMounted } from "vue";
onMounted(() => {
    const btns = document.querySelectorAll('.footer-btn');
    btns.forEach(btn => {
        btn.addEventListener('click', () => {
            if (btn.classList.contains('active')) {
                btn.classList.remove('active');
                return;
            }
            btns.forEach(item => {
                item.classList.remove('active');
            })
            btn.classList.add('active');
        })
    })
})
</script>
    
<style scoped lang="scss">
footer {
    background-color: #111111;
    width: 100%;
    position: relative;
    z-index: 200;
    margin-top: 80px;

    @media screen and (min-width: 992px) {
        padding: 0;
        padding-top: 40px;
    }

    @media screen and (max-width: 991px) {
        padding: 40px 25px 0;
    }

    .container {

        .footer-h3 {
            color: #fff;
            font-size: 25px;

            @media screen and (max-width: 991px) {
                margin-top: 15px;
            }
        }

        .footer-container {
            display: flex;

            div {
                @media screen and (min-width: 992px) {
                    &:not(:last-child) {
                        margin-right: 100px;
                    }
                }

                &.me-push {
                    @media screen and (min-width: 992px) {
                        margin-right: auto;
                    }
                }

                h3 {
                    @extend .footer-h3
                }

                ul {
                    padding: 0;



                    li {
                        margin-top: 15px;
                        font-size: 16px;

                        a {
                            color: #7e7e7e;

                            &:hover {
                                color: #fff;
                            }
                        }
                    }
                }
            }

            @media screen and (max-width: 991px) {
                .footer-btn {
                    display: flex;
                    align-items: center;
                    width: 100%;
                    height: 50px;
                    justify-content: space-between;
                    cursor: pointer;
                    border-bottom: 2px #999 solid;

                    &.active {
                        .bi-plus {
                            display: none;
                        }

                        .bi-dash {
                            display: block;
                        }

                        &+ul {
                            height: 130px;
                        }
                    }

                    &:not(.active) {
                        .bi-plus {
                            display: block;
                        }

                        .bi-dash {
                            display: none;

                        }
                    }

                    i {
                        color: #fff
                    }
                }

                .footer-btn+ul {
                    height: 0;
                    overflow: hidden;
                    transition: 0.3s
                }
            }

            .social-network-wrapper {
                h3 {
                    @extend .footer-h3;

                    @media screen and (min-width: 992px) {
                        text-align: center;
                    }
                }

                ul {
                    display: flex;
                    width: 100%;

                    @media screen and (min-width: 992px) {
                        justify-content: center;
                    }



                    li {
                        &:not(:first-child) {
                            margin-left: 10px;
                        }

                        a {
                            color: #111111;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            font-size: 22px;
                            width: 40px;
                            height: 40px;
                            background-color: #7e7e7e;
                            border-radius: 50%;
                            transition: .3s;

                            &:hover {
                                background-color: #fff;
                            }
                        }
                    }
                }
            }

            @media screen and (max-width: 991px) {
                flex-direction: column;
            }
        }


        .footer-footer {
            display: flex;
            margin-top: 50px;
            justify-content: center;

            div {
                color: #7e7e7e;
            }

            ul {
                display: flex;

                li {
                    @media screen and (min-width: 992px) {
                        margin-left: 20px;
                    }

                    a {
                        color: #7e7e7e;
                    }
                }
            }

            @media screen and (max-width: 991px) {
                flex-direction: column;

                ul {
                    flex-direction: column;
                    padding: 0;

                    li {
                        margin-top: 10px;
                    }
                }
            }
        }
    }
}
</style>