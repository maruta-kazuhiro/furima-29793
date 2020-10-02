function price_add_tax(){
  const price = document.getElementById('item-price');
  price.addEventListener("input",() => {
    const input_price  = price.value;
    const add_tax_price = document.getElementById("add-tax-price");
  add_tax_price.innerHTML = Math.floor(input_price * 0.1 );
    const price_profit = document.getElementById("profit");
  price_profit.innerHTML = Math.ceil(input_price * 0.9 );
  });
  }

window.addEventListener("load", function(){ 
  var path = location.pathname;
  if (path == "/items/new")
  { price_add_tax() }
});