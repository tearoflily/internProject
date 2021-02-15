// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('turbolinks:load',function(){
  /*ファイルアップロードのファイル名表示*/
  $(document).on('change', ':file', function() {
    var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.parent().parent().next(':text').val(label);
  });
  //ファイル名から拡張子を取得する関数
  function getExt(filename)
  {
    var pos = filename.lastIndexOf('.');
    if (pos === -1) return '';
    return filename.slice(pos + 1);
  }
  //アップロード予定のファイル名の拡張子が許可されているか確認する関数
  function checkExt(filename)
  {
    var allow_exts = new Array('jpg', 'jpeg', 'png');
    var ext = getExt(filename).toLowerCase();
    //許可する拡張子の一覧(allow_exts)から対象の拡張子があるか確認する
    if (allow_exts.indexOf(ext) === -1) return false;
    return true;
  }
 
  var fileInput = document.querySelector('.item-file-form');
  var fileValidation = document.querySelector('.tooltips');
  var itemSubmitButton = document.querySelector('.item-submit');

  fileInput.addEventListener('change',function(){
    var text = fileInput.value;
    if(checkExt(text)){
      fileValidation.style.display = 'none';
      itemSubmitButton.disabled = false;
    }
    else{
      fileValidation.style.display = 'block';
      itemSubmitButton.disabled = true;
    }
  });

  var fileInputPhone = document.querySelector('.item-file-form-phone');
  var fileValidationPhone = document.querySelector('.tooltips-phone');
  var itemSubmitButtonPhone = document.querySelector('.item-submit-phone');

  fileInputPhone.addEventListener('change',function(){
    var text = fileInputPhone.value;
    if(checkExt(text)){
      fileValidationPhone.style.display = 'none';
      itemSubmitButtonPhone.disabled = false;
    }
    else{
      fileValidationPhone.style.display = 'block';
      itemSubmitButtonPhone.disabled = true;
    }
  });
  

});