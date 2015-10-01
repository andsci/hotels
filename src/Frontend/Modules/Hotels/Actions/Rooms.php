<?php

namespace Frontend\Modules\Hotels\Actions;

use Frontend\Core\Engine\Base\Block as FrontendBaseBlock;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Modules\Hotels\Engine\Model as FrontendHotelsModel;

// Get Hotel Room
class Rooms extends FrontendBaseBlock
{
    private $id;

    private $room;

    /**
     * Execute the extra
     */
    public function execute()
    {
        $this->id = $this->URL->getParameter(1);

        // validate incoming parameters
        if ($this->id !== null) {
            parent::execute();
            $this->loadTemplate();
            $this->getData();
            $this->parse();
        } else {
            $this->saveData();
        }

        $this->redirect(FrontendNavigation::getURL(404));
    }

    private function addReservation($data){
        FrontendHotelsModel::insertRecord('hotels_rooms_bookings', $data);
    }

    private function getData()
    {
        $this->room = FrontendHotelsModel::getRoom($this->id);
    }

    private function saveData()
    {
        $booking['id'] = 0;
        $booking['room_id'] = \SpoonFilter::getPostValue('room_id', null, null);
        $booking['start'] = \SpoonFilter::getPostValue('arrival', null, null);
        $booking['end'] = \SpoonFilter::getPostValue('departure', null, null);
        $booking['client_name'] = \SpoonFilter::getPostValue('client_name', null, null);
        $booking['client_email'] = \SpoonFilter::getPostValue('client_email', null, null);
        $booking['date'] = FrontendModel::getUTCDate();

        if($booking['room_id'] && $booking['start'] && $booking['end'] && $booking['client_name']){
            $booking['id'] = $this->addReservation($booking);
        }

        echo json_encode($booking['id']);die;
    }

    /**
     * Parse the data into the template
     */
    private function parse()
    {
        echo json_encode($this->room);die;
    }
}

?>