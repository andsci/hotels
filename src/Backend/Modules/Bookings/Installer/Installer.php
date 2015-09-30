<?php

namespace Backend\Modules\Bookings\Installer;

use Backend\Core\Installer\ModuleInstaller;

class Installer extends ModuleInstaller
{
    public function install()
    {
        // add 'bookings' as a module
        $this->addModule('Bookings');

        // module rights
        $this->setModuleRights(1, 'Bookings');

        $this->insertExtra('Bookings', 'block', 'Bookings', null, null, 'N', 7000);
    }
}
