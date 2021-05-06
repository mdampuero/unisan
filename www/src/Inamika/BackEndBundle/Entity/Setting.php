<?php

//
//  Created by Mauricio Ampuero <mdampuero@gmail.com> on 2019.
//  Copyright © 2019 Inamika S.A. All rights reserved.
//

namespace Inamika\BackEndBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use JMS\Serializer\Annotation\ExclusionPolicy;
use JMS\Serializer\Annotation\Expose;
/**
 * Setting
 *
 * @ORM\Table(name="setting")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\SettingRepository")
 * @ORM\HasLifecycleCallbacks()
 * @ExclusionPolicy("all")
 */

class Setting
{
    /**
     * @var string
     *
     * @ORM\Column(name="id", type="string")
     * @ORM\Id
     * @Expose
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 64
     * )
     * @Expose
     */
    private $title;
    
    /**
     * @var string
     *
     * @ORM\Column(name="email_orders", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailOrders;
    
    /**
     * @var string
     *
     * @ORM\Column(name="email_cotizations", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailCotizations;

    /**
     * @var string
     *
     * @ORM\Column(name="copyright", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $copyright;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated_at", type="datetime")
     */
    private $updatedAt;

    /**
     * @var bool
     *
     * @ORM\Column(name="is_delete", type="boolean")
     */
    private $isDelete=false;


    /**
     * Get id.
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set id.
     *
     * @param string $id
     *
     * @return Setting
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }
    
    /**
     * Set title.
     *
     * @param string $title
     *
     * @return Setting
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title.
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }
    
    /**
     * Set emailOrders.
     *
     * @param string $emailOrders
     *
     * @return Setting
     */
    public function setEmailOrders($emailOrders)
    {
        $this->emailOrders = $emailOrders;

        return $this;
    }

    /**
     * Get emailOrders.
     *
     * @return string
     */
    public function getEmailOrders()
    {
        return $this->emailOrders;
    }
    
    /**
     * Set emailCotizations.
     *
     * @param string $emailCotizations
     *
     * @return Setting
     */
    public function setEmailCotizations($emailCotizations)
    {
        $this->emailCotizations = $emailCotizations;

        return $this;
    }

    /**
     * Get emailCotizations.
     *
     * @return string
     */
    public function getEmailCotizations()
    {
        return $this->emailCotizations;
    }
    
    /**
     * Set copyright.
     *
     * @param string $copyright
     *
     * @return Setting
     */
    public function setCopyright($copyright)
    {
        $this->copyright = $copyright;

        return $this;
    }

    /**
     * Get copyright.
     *
     * @return string
     */
    public function getCopyright()
    {
        return $this->copyright;
    }


    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Setting
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt.
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set updatedAt.
     *
     * @param \DateTime $updatedAt
     *
     * @return Setting
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt.
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * Set isDelete.
     *
     * @param bool $isDelete
     *
     * @return Setting
     */
    public function setIsDelete($isDelete)
    {
        $this->isDelete = $isDelete;

        return $this;
    }

    /**
     * Get isDelete.
     *
     * @return bool
     */
    public function getIsDelete()
    {
        return $this->isDelete;
    }

    /**
     * @ORM\PrePersist
     */
    public function setCreatedAtValue()
    {
        $this->createdAt=new \DateTime();
    }
    
    /**
     * @ORM\PrePersist
     * @ORM\PreUpdate
     */
    public function setUpdatedAtValue()
    {
        $this->updatedAt=new \DateTime();
    }
}
