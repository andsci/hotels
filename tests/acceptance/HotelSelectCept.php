<?php
$I = new AcceptanceTester($scenario);
$I->amOnPage('/bookings');
$I->click('.item[data-id=1]');
$I->see('Tonyresort');
$I->fillField(['class' => 'date-start'], "12/17/2015");
$I->fillField(['class' => 'date-end'], "12/31/2015");
$I->click('.search-btn');
?>