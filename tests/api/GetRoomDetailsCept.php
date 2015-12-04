<?php 
$I = new ApiTester($scenario);
$I->wantTo('Get list of hotels');
$I->sendPOST('/hotels-api/rooms/2', []);
$I->seeResponseContains('{"id":"2","title":"Vip","price":"180","image":"http:\/\/127.0.0.1:8000\/src\/Frontend\/Files\/rooms\/images\/source\/vip_ton.jpg","count":"2"}');