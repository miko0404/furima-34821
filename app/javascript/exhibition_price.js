window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     
  
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = priceInput.value * 0.1;
     console.log(addTaxDom);
    
     const profit = document.getElementById("profit");
     profit.innerHTML = Math.floor(priceInput.value * 0.9);
    
     
})
});
  