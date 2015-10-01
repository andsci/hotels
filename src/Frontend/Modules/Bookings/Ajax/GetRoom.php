<?php

namespace Frontend\Modules\Bookings\Ajax;

use Frontend\Core\Engine\Base\AjaxAction as FrontendBaseAJAXAction;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Modules\Bookings\Engine\Model as FrontendBookingsModel;
use Frontend\Core\Engine\Template AS Template;

class GetRoom extends FrontendBaseAJAXAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        parent::execute();

        $roomId = \SpoonFilter::getPostValue('room_id', null, 0);
        $room = FrontendBookingsModel::getRoom($roomId);
        $room['arrival'] = \SpoonFilter::getPostValue('arrival', null, '');
        $room['departure'] = \SpoonFilter::getPostValue('departure', null, '');

        if(!$room['arrival']  || ! $room['departure'] || !$roomId){
            $this->output(self::ERROR, 'Missing values');
        }

        if(empty($room)){
            $this->output(self::ERROR, 'Room not found');
        }

        $room['stay_duration'] = floor((strtotime($room['departure']) - strtotime($room['arrival'])) / (60 * 60 * 24));
        $room['total_price'] = $room['stay_duration'] * $room['price'];

        $tpl = FRONTEND_MODULES_PATH . '/Bookings/Layout/Templates/Room.tpl';
        $roomTpl = new Template(false);
        $roomTpl->assign('room', $room);
        $html = $roomTpl->getContent( $tpl, true, true);

        // output
        $this->output(self::OK, $html);
    }
}
