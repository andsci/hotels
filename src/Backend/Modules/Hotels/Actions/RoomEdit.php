<?php

namespace Backend\Modules\Hotels\Actions;

use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\File;

use Backend\Core\Engine\Base\ActionEdit as BackendBaseActionEdit;
use Backend\Modules\Hotels\Engine\Model as BackendHotelsModel;
use Backend\Core\Engine\Model as BackendModel;
use Backend\Core\Engine\Form as BackendForm;
use Backend\Core\Engine\Language as BL;


class RoomEdit extends BackendBaseActionEdit
{
    private $hotel;

    public function execute()
    {
        // get parameters
        $this->id = $this->getParameter('id', 'int');

        if ($this->id !== null && BackendHotelsModel::exists('hotels_rooms', $this->id)) {
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
        $this->record = BackendHotelsModel::getRecord('hotels_rooms', $this->id);
        $this->hotel = BackendHotelsModel::getRecord('hotels', $this->record['hotel_id']);
    }

    private function loadForm()
    {
        $this->frm = new BackendForm('edit');
        $this->frm->addText('title', $this->record['title'], null, 'inputText title', 'inputTextError title');
        $this->frm->addText('capacity', $this->record['capacity']);
        $this->frm->addText('price', $this->record['price']);
        $this->frm->addText('count', $this->record['count']);
        $this->frm->addImage('image');
        $this->frm->addCheckbox('delete_image');
    }

    private function validateForm()
    {
        if ($this->frm->isSubmitted()) {

            $fields = $this->frm->getFields();

            $fields['title']->isFilled(BL::err('TitleIsRequired'));

            if ($this->frm->isCorrect()) {
                $item = [];
                $item['id'] = $this->id;
                $item['title'] = $fields['title']->getValue();
                $item['image'] = $this->record['image'];
                $item['capacity'] = $fields['capacity']->getValue();
                $item['count'] = $fields['count']->getValue();
                $item['price'] = $fields['price']->getValue();

                // the image path
                $imagePath = FRONTEND_FILES_PATH . '/rooms/images';

                // create folders if needed
                $fs = new Filesystem();

                if($fields['delete_image']->isFilled() || ($fields['image']->isFilled() && $this->record['image'])) {
                    $item['image'] = null;
                    BackendModel::deleteThumbnails($imagePath, $this->record['image']);
                }

                if($fields['image']->isFilled()) {
                    if(!$fs->exists($imagePath . '/128x128')) $fs->mkdir(array($imagePath . '/source', $imagePath . '/128x128'));
                    if(!$fs->exists($imagePath . '/64x64')) $fs->mkdir(array($imagePath . '/source', $imagePath . '/64x64'));

                    $item['image'] = $fields['image']->getFileName(false).'.'.$fields['image']->getExtension();

                    $i = 2;
                    while($fs->exists($imagePath . '/source/'.$item['image'])){
                        $item['image'] = $fields['image']->getFileName(false) . '(' . $i . ')' . '.' . $fields['image']->getExtension();
                        $i++;
                    }

                    // upload the image & generate thumbnails
                    $fields['image']->generateThumbnails($imagePath, $item['image']);
                }

                BackendHotelsModel::updateRecord('hotels_rooms', $item, $this->id);

                $this->redirect(BackendModel::createURLForAction('Rooms') . '&report=edited&var=' . urlencode($item['title']) . '&id=' . $this->hotel['id'] . '&highlight=row-' . $item['id']);
            }
        }
    }

    protected function parse()
    {
        $this->tpl->assign('hotel', $this->hotel);
        $this->tpl->assign('item', $this->record);
        parent::parse();
    }
}
