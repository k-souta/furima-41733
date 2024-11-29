const price = () => {
  
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return
  priceInput.addEventListener("input", () => {
    const price = parseInt(priceInput.value, 10); // 数値に変換
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.textContent = Math.floor(price * 0.1);  // 税額
    const addProfitDom = document.getElementById("profit");
    addProfitDom.textContent = Math.floor(price - Math.round(price * 0.1));  // 利益
  });
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);