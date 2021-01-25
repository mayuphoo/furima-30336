// const priceInput = document.getElementById("item-price");
// console.log(priceInput);
window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  
  const addTaxDom = document.getElementById("add-tax-price")
  const TaxValue = inputValue * 0.1
  addTaxDom.innerHTML = (Math.floor(TaxValue));

  const proFit = document.getElementById("profit")
  proFit.innerHTML = (Math.floor(inputValue - TaxValue));

})
});