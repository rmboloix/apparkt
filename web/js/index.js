/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#login-form").validationEngine({
        showArrow:false,
        promptPosition:"bottomLeft"
    });
    $("#client-form").validationEngine({
        showArrow:false,
        promptPosition:"bottomLeft"
    });
    $("#administrador-form").validationEngine({
        showArrow:false,
        promptPosition:"bottomLeft"
    });
    
    $("#modificar-contrasenya").change(function (){
       if($(this).is(":checked")){
           //checked
            $("input.hidden").removeAttr("disabled").removeClass("hidden");
            $(this).parent().find("span").hide();
            $(this).hide();
       }
    });
});