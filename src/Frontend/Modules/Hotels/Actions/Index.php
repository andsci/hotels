<?php

namespace Frontend\Modules\Hotels\Actions;

use Frontend\Core\Engine\Base\Block as FrontendBaseBlock;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Modules\Hotels\Engine\Model as FrontendHotelsModel;


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
        $this->hotels = FrontendHotelsModel::getAllRecords('hotels');
    }

    /**
     * Parse the data into the template
     */
    private function parse()
    {
        echo json_encode($this->hotels);die;
    }
}








?>