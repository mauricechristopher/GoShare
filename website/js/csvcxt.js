$(document).ready(function(){

    $('#btnSubmit').bind("click",function(event){
      // initialize variables
      var contractName = $("#cxt_name").val();
      var ownerAddress = $("#owner").val();
   
      // make temporary object for easy storage
      var contactObj = {
        contract: contractName,
        owner: ownerAddress
      };
   
      event.preventDefault();
      console.log(contactObj);
    });
    // you can use the above or the one shown below
    $('#btnSubmit').click(function(e){
      e.preventDefault();
      // your statements;
    });
});