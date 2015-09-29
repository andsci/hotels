<?php

namespace Backend\Modules\Hotels\Actions;

use Symfony\Component\Filesystem\Filesystem;

use Backend\Core\Engine\Base\ActionAdd as BackendBaseActionAdd;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Language as BL;

class RoomAdd extends BackendBaseActionAdd
{
    private $id;

    private $record;

    public function execute()
    {
        // get parameters
        $this->id = $this->getParameter('id', 'int');

        if ($this->id !== null && BackendHotelsModel::exists('hotels', $this->id)) {
            parent::execute();
            $this->getData();
            $this->loadForm();
            $this->validateForm();
            $this->parse();
            $this->display();
        } else {
            // no item found, throw an exception, because somebody is fucking with our URL
            $this->redirect(BackendModel::createURLForAction('Index') . '&error=non-existing');
        }
    }

    private function getData()
    {
        $this->record = BackendHotelsModel::getRecord('hotels', $this->id);
    }

    private function loadForm()
    {
        $this->frm = new BackendForm('add');
        $this->frm->addText('title', null, null, 'inputText title', 'inputTextError title');
        $this->frm->addText('capacity');
        $this->frm->addText('price');
        $this->frm->addText('count');
        $this->frm->addImage('image');
    }

    private function validateForm()
    {
        if ($this->frm->isSubmitted()) {

            $fields = $this->frm->getFields();

            $fields['title']->isFilled(BL::err('TitleIsRequired'));

            if ($this->frm->isCorrect()) {
                $item = [];
                $item['title'] = $fields['title']->getValue();
                $item['capacity'] = $fields['capacity']->getValue();
                $item['price'] = $fields['price']->getValue();
                $item['count'] = $fields['count']->getValue();
                $item['image'] = null;
                $item['hotel_id'] = $this->id;

                if($fields['image']->isFilled())
                {
                    // the image path
                    $imagePath = FRONTEND_FILES_PATH . '/rooms/images';

                    // create folders if needed
                    $fs = new Filesystem();
                    $fs->mkdir(array($imagePath . '/source', $imagePath . '/128x128'));

                    $item['image'] = $fields['image']->getFileName(false).'.'.$fields['image']->getExtension();
                    $i = 2;
                    while($fs->exists($imagePath . '/source/'.$item['image'])){
                        $item['image'] = $fields['image']->getFileName(false) . '(' . $i . ')' . '.' . $fields['image']->getExtension();
                        $i++;
                    }

                    // upload the image & generate thumbnails
                    $fields['image']->generateThumbnails($imagePath, $item['image']);
                }

                $item['id'] = BackendHotelsModel::insertRecord('hotels_rooms', $item);

                $this->redirect(BackendModel::createURLForAction('Rooms') . '&id='.$this->id.'&report=added&var=' . urlencode($item['title']) . '&highlight=row-' . $item['id']);
            }
        }
    }

    protected function parse()
    {
        $this->tpl->assign('item', $this->record);
        parent::parse();
    }
}
