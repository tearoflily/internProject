// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load', function(){
 /*************************price******************************************** */
 document.querySelectorAll('.product-price-field').forEach(function(price){
    price.addEventListener('change',function(e){
        var num = price.id.split('price')[1];
        var stock = document.getElementById('stock' + num);
        var total = document.getElementById('total' + num);
        total.textContent = Number(price.value) * Number(stock.value);

        var pstock = document.getElementById('P-stock' + num);
        var ptotal = document.getElementById('P-total' + num);
        ptotal.textContent = Number(price.value) * Number(pstock.value);

    });
 });
 /***************************stock*************************************** */
 document.querySelectorAll('.product-stock-field').forEach(function(stock){
       stock.addEventListener('change',function(e){
           var num = stock.id.split('stock')[1];
           var price = document.getElementById('price' + num);
           var total = document.getElementById('total' + num);
           total.textContent = Number(price.value) * Number(stock.value);

           var pprice = document.getElementById('P-price' + num);
           var ptotal = document.getElementById('P-total' + num);
           ptotal.textContent = Number(pprice.value) * Number(stock.value);
       });
    });
});