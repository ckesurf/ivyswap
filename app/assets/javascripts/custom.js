/**
 * Created with JetBrains RubyMine.
 * User: andrewlangdon
 * Date: 2/8/13
 * Time: 7:50 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function(){

    $('.show-product-form').click(function(){
       console.log("bitches");
        $(".product-form-closed").removeClass("product-form-closed");
        $('.show-product-form').fadeOut();


    });
});