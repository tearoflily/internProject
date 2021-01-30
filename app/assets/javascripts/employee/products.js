// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load',function(){
  document.getElementById('product-checkPc-delete').addEventListener('click',function(){
    var arr1 = [];
	document.querySelectorAll('.product-checkbox').forEach(function(item){
        if(item.checked){ 
			arr1.push(item.value);
        }
    });
     var result = confirm('削除します。よろしいですか？');
     if(result){
        $.ajax({
            url: "/employee/products/checklist/",
            type: "POST",
            data: {'data': arr1, '_method': 'DELETE'}
          }).done(function() {
            
          });
        }
  });
/********************************************************************************************************** */
document.getElementById('product-checkPhone-delete').addEventListener('click',function(){
    var arr2 = [];
	document.querySelectorAll('.product-checkbox-phone').forEach(function(item){
        if(item.checked){ 
			arr2.push(item.value);
        }
    });
     var result = confirm('削除します。よろしいですか？');
     if(result){
        $.ajax({
            url: "/employee/products/checklist/",
            type: "POST",
            data: {'data': arr2, '_method': 'DELETE'}
          }).done(function() {
            
          });
        }
  });
});