/*!
* Start Bootstrap - Shop Homepage v5.0.5 (https://startbootstrap.com/template/shop-homepage)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-shop-homepage/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

   	function Logout() {
   	    $.ajax({
   	        url: '/logout',
   	        type: 'get',
   	        async: false,
   	        dataType: 'text',
   	        success: function (res) {
   	        	alert(res);
   	            location.href =res;
   	        }
   	    });
   	  }
 