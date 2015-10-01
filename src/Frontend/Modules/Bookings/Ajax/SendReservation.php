<?php

namespace Frontend\Modules\Bookings\Ajax;

use Frontend\Core\Engine\Base\AjaxAction as FrontendBaseAJAXAction;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Modules\Bookings\Engine\Model as FrontendBookingsModel;
use Frontend\Core\Engine\Template AS Template;

class SendReservation extends FrontendBaseAJAXAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        parent::execute();

        $room['room_id'] = \SpoonFilter::getPostValue('room_id', null, 0);
        $room['arrival'] = \SpoonFilter::getPostValue('arrival', null, '');
        $room['departure'] = \SpoonFilter::getPostValue('departure', null, '');
        $room['client_name'] = \SpoonFilter::getPostValue('client_name', null, '');

        if(!$room['arrival']  || ! $room['departure'] || !$room['room_id'] || !$room['client_name']){
            $this->output(self::ERROR, 'Missing values');
        }

        FrontendBookingsModel::reserveRoom($room);

        // output
        $this->output(self::OK, 'success');
    }
}
