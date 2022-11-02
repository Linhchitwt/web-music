const loginBtn = document.querySelector('.btn-js-dangnhap')
            const modal = document.querySelector('.modal.dangnhap')
            const modalClose = document.querySelector('.icon-close.dangnhap')
            const modalClose1 = document.querySelector('.icon-close.dangky')
            const loginBtn1 = document.querySelector('.btn-js-dangky')
            const modal1 = document.querySelector('.modal.dangky')
            function showLogin() {
                modal.classList.add('open')

            }


            function showLogin1() {
                modal1.classList.add('open')

            }
            function hideShowLogin1() {
                modal1.classList.remove('open')

            }
            function hideShowLogin() {
                modal.classList.remove('open')

            }
            function dangnhap() { showLogin(); hideShowLogin1() }
            function dangky() { showLogin1(); hideShowLogin() }
            loginBtn.addEventListener('click', dangnhap)
            // loginBtn.addEventListener('click',hideShowLogin1)

            loginBtn1.addEventListener('click', dangky)
            modalClose1.addEventListener('click', hideShowLogin1)
            modalClose.addEventListener('click', hideShowLogin)
            document.querySelector('.btn.btn-dangnhap').addEventListener('click', dangnhap)
            document.querySelector('.btn.btn-dangky').addEventListener('click', dangky)

          