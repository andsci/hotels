<?php

namespace Frontend\Modules\Hotels\Actions;

use Frontend\Core\Engine\Base\Block as FrontendBaseBlock;
use Frontend\Core\Engine\Navigation as FrontendNavigation;
use Frontend\Core\Engine\Model as FrontendModel;
use Frontend\Modules\Hotels\Engine\Model as FrontendHotelsModel;

// Get all hotels
class Index extends FrontendBaseBlock
{
    private $record;

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

        if($this->URL->getParameter(0) == null){
            $this->record = FrontendHotelsModel::getAllRecords('hotels');

            foreach($this->record AS &$hotel) {
                $hotel['image'] = HOTELS_API_URL.FRONTEND_FILES_URL . '/hotels/images/source/' . $hotel['image'];
            }
        } else {
            $this->record = FrontendHotelsModel::getRecord('hotels', $this->URL->getParameter(0));
            if(empty($this->record)) http_response_code(404);
        }

    }

    /**
     * Parse the data into the template
     */
    private function parse()
    {
        echo json_encode($this->record);die;
    }
}

?>