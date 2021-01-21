// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load', function(){
 /*************************price******************************************** */
 document.querySelectorAll('.product-price-field').forEach(function(price){
    price.addEventListener('change',function(e){
        const num = price.id.split('price')[1];
        const stock = document.getElementById('stock' + num);
        const total = document.getElementById('total' + num);
        total.textContent = Number(price.value) * Number(stock.value);

        const pstock = document.getElementById('P-stock' + num);
        const ptotal = document.getElementById('P-total' + num);
        ptotal.textContent = Number(price.value) * Number(pstock.value);

    });
 });
 /***************************stock*************************************** */
 document.querySelectorAll('.product-stock-field').forEach(function(stock){
       stock.addEventListener('change',function(e){
           const num = stock.id.split('stock')[1];
           const price = document.getElementById('price' + num);
           const total = document.getElementById('total' + num);
           total.textContent = Number(price.value) * Number(stock.value);

           const pprice = document.getElementById('P-price' + num);
           const ptotal = document.getElementById('P-total' + num);
           ptotal.textContent = Number(pprice.value) * Number(stock.value);
       });
    });
});