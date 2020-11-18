window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
 
  priceInput.addEventListener("input", () => {
    priceInput.value = priceInput.value.replace(/[^0-9]+/i,'')
    const input = priceInput.value
    const tax = Math.floor(input /10 )
    addTaxDom.innerHTML = tax
    addProfitDom.innerHTML = input - tax
  })
});