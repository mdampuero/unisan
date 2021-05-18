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
 * Filter
 *
 * @ORM\Table(name="filter")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\FilterRepository")
 * @ORM\HasLifecycleCallbacks()
 * @ExclusionPolicy("all")
 */

class Filter
{
    /**
     * @var string
     *
     * @ORM\Column(name="id", type="guid")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="UUID")
     * @Expose
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 64
     * )
     * @Expose
     */
    private $name;
    
    /**
     * @var string
     *
     * @ORM\Column(name="for_section", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 64
     * )
     * @Expose
     */
    private $forSection;

    /**
     * @var string
     *
     * @ORM\Column(name="json_models", type="text")
     * @Expose
     */
    private $jsonModels;
    
    /**
     * @var string
     *
     * @ORM\Column(name="json_services", type="text")
     * @Expose
     */
    private $jsonServices;

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
     * @Expose
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
     * Set name.
     *
     * @param string $name
     *
     * @return Filter
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
    
    /**
     * Set forSection.
     *
     * @param string $forSection
     *
     * @return Filter
     */
    public function setForSection($forSection)
    {
        $this->forSection = $forSection;

        return $this;
    }

    /**
     * Get forSection.
     *
     * @return string
     */
    public function getForSection()
    {
        return $this->forSection;
    }
    
    /**
     * Set jsonModels.
     *
     * @param string $jsonModels
     *
     * @return Filter
     */
    public function setJsonModels($jsonModels)
    {
        $this->jsonModels = $jsonModels;

        return $this;
    }

    /**
     * Get jsonModels.
     *
     * @return string
     */
    public function getJsonModels()
    {
        return $this->jsonModels;
    }
    
    /**
     * Set jsonServices.
     *
     * @param string $jsonServices
     *
     * @return Filter
     */
    public function setJsonServices($jsonServices)
    {
        $this->jsonServices = $jsonServices;

        return $this;
    }

    /**
     * Get jsonServices.
     *
     * @return string
     */
    public function getJsonServices()
    {
        return $this->jsonServices;
    }

    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Filter
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
     * @return Filter
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
     * @return Filter
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
