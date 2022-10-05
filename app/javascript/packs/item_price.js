window.addEventListener('load', function(){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;

   const addTaxDom = document.getElementById("add-tax-price");
   addTaxDom.innerHTML =  Math.floor(inputValue * 0.1);

   const addProfitDom = document.getElementById("profit")
   addProfitDom.innerHTML = Math.floor(inputValue * 0.9);


   console.log(inputValue);
})
})

// inner htmlで税額加算を追加
// モデルに追記により0カウントはしない？？→validates :price, presence: true, inclusion: { in: 300..9999999 }

// window.addEventListener('input', function(){
// const addTaxDom = document.getElementById("add-tax-price");
// priceInput.addEventListener("input", () => {
//    const inputValue = priceInput.value
// });
// addTaxDom.innerHTML =  Math.floor( inputValue * 0.1)
// })

// innerHTMLで利益額を追加
// window.addEventListener('load', function(){





//***学習記録用 */
// window.addEventListener('load', () => {
//   console.log("OK");
// });

// window.addEventListener('load', function(){
// const priceInput = document.getElementById("item-price");
// console.log(priceInput);
// });