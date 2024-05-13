function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    
    if (isNaN(inputValue)) {
      return;
    }
    
    const addTaxPrice = Math.floor(inputValue * 0.1); 
    const profit = Math.floor(inputValue - addTaxPrice); 

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    addTaxDom.textContent = `${addTaxPrice}`; 
    profitDom.textContent = `${profit}`; 
  });
 };
 
 window.addEventListener('turbo:load', price);
 window.addEventListener('turbo:render', price);
 