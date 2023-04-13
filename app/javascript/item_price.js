window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom1 = document.getElementById("add-tax-price");
    addTaxDom1.innerHTML = Math.floor(inputValue * 0.1);
    const addTaxDom2 = document.getElementById("profit");
    addTaxDom2.innerHTML = Math.floor(inputValue - inputValue * 0.1);
 })
});

