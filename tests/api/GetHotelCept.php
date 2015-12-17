<?php 
$I = new ApiTester($scenario);
$I->wantTo('Get list of hotels');
$I->sendPOST('/hotels-api/detail/1', []);
$I->seeResponseContains('{"id":"2","title":"Vip","price":"180","image":"http:\/\/andriuss.ktu.ongr.rocks\/src\/Frontend\/Files\/rooms\/images\/source\/vip_ton.jpg","count":"2","available_rooms":"2"},{"id":"3","title":"Standart","price":"100","image":"http:\/\/andriuss.ktu.ongr.rocks\/src\/Frontend\/Files\/rooms\/images\/source\/standart_ton.jpg","count":"6","available_rooms":"6"},{"id":"4","title":"Family","price":"200","image":"http:\/\/andriuss.ktu.ongr.rocks\/src\/Frontend\/Files\/rooms\/images\/source\/family_ton.jpg","count":"4","available_rooms":"4"}');
