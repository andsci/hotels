<?php 
$I = new ApiTester($scenario);
$I->wantTo('Get list of hotels');
$I->sendPOST('/hotels-api/rooms/2', []);
$I->seeResponseContains('{"id":"2","title":"Vip","price":"180","image":"http:\/\/andriuss.ktu.ongr.rocks\/src\/Frontend\/Files\/rooms\/images\/source\/vip_ton.jpg","count":"2"}');