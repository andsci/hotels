<?php

namespace Frontend\Modules\Bookings\Ajax;

use Frontend\Core\Engine\Base\AjaxAction as FrontendBaseAJAXAction;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Modules\Bookings\Engine\Model as FrontendBookingsModel;
use Frontend\Core\Engine\Template AS Template;

class GetMuseums extends FrontendBaseAJAXAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        parent::execute();

        $hotelId = \SpoonFilter::getPostValue('hotel_id', null, 0);

        if(!$hotelId){
            $this->output(self::ERROR, 'Missing values');
        }

        $hotel = FrontendBookingsModel::getHotel($hotelId);

        if($hotel) {
            $museums = FrontendBookingsModel::getMuseums($hotel['country'], $hotel['city']);
            $tpl = FRONTEND_MODULES_PATH . '/Bookings/Layout/Templates/Museums.tpl';
            $museumsTpl = new Template(false);
            $museumsTpl->assign('hotel', $hotel);
            $museumsTpl->assign('museums', $museums);
            $html = $museumsTpl->getContent($tpl, true, true);
        } else {
            $html = '';
        }
        // output
        $this->output(self::OK, $html);
    }
}
