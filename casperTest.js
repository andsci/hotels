/*jshint strict:false*/
/*global CasperError console phantom require*/

/**
 * Test hotel booking
 */

casper.test.begin('Testing hotel booking', 6, function suite(test) {
    casper.start("http://hotel.dev.lt/bookings", function() {
        test.assertTitle("Bookings - Hotels", "Page title is the one expected");
        test.assertExists('#bookings div.item[data-id="1"] .title .cell', "Hotel id 1 exists");

		//test.assertSelectorHasText('#bookings div.item[data-id="1"] .title .cell', 'Tonyresort', "Hotel name correct");
		//test.assertEquals(casper.exists('#bookings div.item[data-id="1"] .item-inner'), true, 'Hotel box exists');
		this.click('#bookings div.item[data-id="1"] .item-inner');
    });

	// bookings filter page
    casper.then(function() {
		this.wait(1000, function() {
			//casper.capture('screenshots/museum-search.png');
			//correct hotel title
			test.assertSelectorHasText('.hotel-name', 'Tonyresort', "Hotel selection works");

			// museums loads
			test.assertEval(function() {
				return __utils__.findAll("#museum-list .museum").length == 2;
			}, "All museums loaded");

			this.sendKeys('form.date-form input.date-start', '2016/08/05');
			this.sendKeys('form.date-form input.date-end', '2016/08/07');
			this.click('button.search-btn');
		});
    });

	// bookings detail page
	casper.then(function(){
		this.wait(1000, function() {
			test.assertEval(function() {
				return __utils__.findAll("#room-list .room").length == 3;
			}, "All room kinds found (3)");
			this.click('#room-list .room .room-image');
			this.click('#bookings-detail button.select-btn');
		});
	});

	// bookings checkout page
	casper.then(function(){
		this.wait(2000, function() {
			var price = this.fetchText('#bookings-checkout .room-table tr:last-child td:last-child');
			test.assertEquals(price.substring(0, price.length - 2), "360", 'Price calculation is correct');
		});
	});
	
    casper.run(function() {
        test.done();
    });
});
