window.addEventListener('load', () => {
 const priceInput = document.getElementById("item-price")
 const addTaxDom = document.getElementById("add-tax-price")
 const profit = document.getElementById("profit")
 priceInput.addEventListener('input', () => {
   const inputValue = priceInput.value;
 tax = Math.floor(inputValue * 0.1)
 addTaxDom.innerHTML = tax
 profit.innerHTML = Math.floor(inputValue - tax);
    console.log(profit);
 })
})
