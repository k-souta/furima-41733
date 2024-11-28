const pay = () => {
  // 公開鍵をセット
  const publicKey = gon.public_key
  const payjp = Payjp(publicKey);

  // Payjp Elementsを作成
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // 入力フォームにマウント
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  // フォーム送信時の処理
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {

    // トークンを作成
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        // トークンを取得しフォームに追加
        const token = response.id;
        const renderDom = document.getElementById("charge-form")
        const tokenObj = `<input value=${token} name="token" type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        // 元の入力要素のname属性を削除
        numberElement.clear
        expiryElement.clear
        document.getElementById("charge-form").submit()
    });
     e.preventDefault()
  });
};

// ページロード時に関数を実行
window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);


