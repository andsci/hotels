<?php

namespace Frontend\Modules\Bookings\Actions;

use Frontend\Core\Engine\Base\Block as FrontendBaseBlock;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Modules\Bookings\Engine\Model as FrontendBookingsModel;

// Get all hotels
class Index extends FrontendBaseBlock
{
    private $hotels;

    /**
     * Execute the extra
     */
    public function execute()
    {
        parent::execute();
        $this->loadTemplate();
        $this->getData();
        $this->parse();
    }

    private function getData()
    {
        $this->hotels = FrontendBookingsModel::getHotels();
    }

    /**
     * Parse the data into the template
     */
    private function parse()
    {
        $this->tpl->assign('hotels', $this->hotels);
    }
}

?>