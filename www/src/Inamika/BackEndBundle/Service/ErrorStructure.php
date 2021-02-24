<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Service;

use Doctrine\ORM\EntityManager;

/**
 * Class ErrorStructure
 *
 * @package Inamika\BackEndBundle\Service
 */
class ErrorStructure
{
    protected $em;

    public function __construct()
    {
        
    }

    /**
     * @return array
     */
    public function get(array $data){
        return array(
            'errors'=>[],
            'form'=>[
                'code'=>$data['code'],
                'errors'=>[
                    'children'=>[
                        $data['property']=>[
                            'errors'=>[$data['message']]
                        ]
                    ]
                ],
            ]
        );
    }
    
}