<?php

namespace Frontend\Modules\Hotels\Actions;

use Frontend\Core\Engine\Base\Block as FrontendBaseBlock;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Modules\Hotels\Engine\Model as FrontendHotelsModel;

// Get Hotel Rooms
class Detail extends FrontendBaseBlock
{
    private $id;

    private $rooms;

    /**
     * Execute the extra
     */
    public function execute()
    {
        $this->id = $this->URL->getParameter(1);

        // validate incoming parameters
        if ($this->id === null) {
            $this->redirect(FrontendNavigation::getURL(404));
        }
        parent::execute();
        $this->loadTemplate();
        $this->getData();
        $this->parse();
    }

    private function getData()
    {
        $start = $this->URL->getParameter('start');
        $end = $this->URL->getParameter('end');
        $this->rooms = FrontendHotelsModel::getRooms($this->id, $start, $end);

        foreach($this->rooms AS &$room) {
            $room['image'] = FRONTEND_FILES_URL . '/rooms/images/source/' . $room['image'];
        }
    }

    /**
     * Parse the data into the template
     */
    private function parse()
    {
        echo json_encode($this->rooms);die;
    }
}

?>