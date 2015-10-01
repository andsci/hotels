<?php

namespace Frontend\Modules\Bookings\Ajax;

use Frontend\Core\Engine\Base\AjaxAction as FrontendBaseAJAXAction;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Modules\Bookings\Engine\Model as FrontendBookingsModel;
use Frontend\Core\Engine\Template AS Template;

class GetRooms extends FrontendBaseAJAXAction
{
    /**
     * Execute the action
     */
    public function execute()
    {
        parent::execute();

        $hotelId = \SpoonFilter::getPostValue('hotel_id', null, 0);
        $arrival = \SpoonFilter::getPostValue('arrival', null, 0);
        $departure = \SpoonFilter::getPostValue('departure', null, 0);

        if(!$hotelId && !$arrival && !$departure){
            $this->output(self::ERROR, 'Missing values');
        }

        $rooms = FrontendBookingsModel::getRooms($hotelId, $arrival, $departure);

        foreach($rooms AS &$room){
            if($room['available_rooms'] < 1){
                $room['disabled'] = true;
            }
        }

        $tpl = FRONTEND_MODULES_PATH . '/Bookings/Layout/Templates/Rooms.tpl';
        $roomsTpl = new Template(false);
        $roomsTpl->assign('rooms', $rooms);
        $html = $roomsTpl->getContent( $tpl, true, true);

        // output
        $this->output(self::OK, $html);
    }
}
