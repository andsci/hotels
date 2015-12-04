<?php 
$I = new ApiTester($scenario);
$I->wantTo('Get list of hotels');
$I->sendPOST('/hotels-api', []);
$I->seeResponseContains('{"id":"1","title":"Tonyresort","image":"http:\/\/127.0.0.1:8000\/src\/Frontend\/Files\/hotels\/images\/source\/download(6).jpg","country":"Lithuania","city":"Vilnius"},{"id":"3","title":"Kaunas","image":"http:\/\/127.0.0.1:8000\/src\/Frontend\/Files\/hotels\/images\/source\/36207618.jpg","country":"Lithuania","city":"Kaunas"},{"id":"4","title":"Gaia Village","image":"http:\/\/127.0.0.1:8000\/src\/Frontend\/Files\/hotels\/images\/source\/211050_xl.jpg","country":null,"city":null},{"id":"5","title":"Europa Royale","image":"http:\/\/127.0.0.1:8000\/src\/Frontend\/Files\/hotels\/images\/source\/big_4ac32e645761a.jpg","country":null,"city":null}');
