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
 * Model
 *
 * @ORM\Table(name="model")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\ModelRepository")
 * @ORM\HasLifecycleCallbacks()
 * @ExclusionPolicy("all")
 */

class Model
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
     * Many Popup have one Service. This is the owning side.
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="Service")
     * @ORM\JoinColumn(name="service_id", referencedColumnName="id")
     * @Expose
     */
    private $service;

    /**
     * @var bool
     *
     * @ORM\Column(name="for_home", type="boolean")
     * @Expose
     */
    private $forHome=false;
    
    /**
     * @var bool
     *
     * @ORM\Column(name="for_industry", type="boolean")
     * @Expose
     */
    private $forIndustry=false;
    
    /**
     * @var bool
     *
     * @ORM\Column(name="for_event", type="boolean")
     * @Expose
     */
    private $forEvent=false;

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
     * @ORM\Column(name="picture", type="string", length=64, nullable=true)
     * @Assert\File(
     *     maxSize = "2048k",
     *     mimeTypes = {"image/png","image/jpeg","image/jpg","image/gif"},
     *     mimeTypesMessage = "Seleccione un formato de imagen válido"
     * )
     * @Expose
     */
    private $picture;

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     * @Expose
     */
    private $description;
   
    /**
     * @var string|null
     *
     * @ORM\Column(name="spec", type="text", nullable=true)
     * @Expose
     */
    private $spec;
    
    /**
     * @var string|null
     *
     * @ORM\Column(name="conditions", type="text", nullable=true)
     * @Expose
     */
    private $conditions;

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
     * Set service.
     *
     * @param int $service
     *
     * @return Product
     */
    public function setService($service)
    {
        $this->service = $service;

        return $this;
    }

    /**
     * Get service.
     *
     * @return int
     */
    public function getService()
    {
        return $this->service;
    }

    /**
     * Set picture
     *
     * @param string $picture
     *
     * @return User
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;

        return $this;
    }

    /**
     * Get picture
     *
     * @return string
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return Model
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
     * Set description.
     *
     * @param string|null $description
     *
     * @return Model
     */
    public function setDescription($description = null)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description.
     *
     * @return string|null
     */
    public function getDescription()
    {
        return $this->description;
    }
    
    /**
     * Set conditions.
     *
     * @param string|null $conditions
     *
     * @return Model
     */
    public function setConditions($conditions = null)
    {
        $this->conditions = $conditions;

        return $this;
    }

    /**
     * Get conditions.
     *
     * @return string|null
     */
    public function getConditions()
    {
        return $this->conditions;
    }
    
    /**
     * Set spec.
     *
     * @param string|null $spec
     *
     * @return Model
     */
    public function setSpec($spec = null)
    {
        $this->spec = $spec;

        return $this;
    }

    /**
     * Get spec.
     *
     * @return string|null
     */
    public function getSpec()
    {
        return $this->spec;
    }
   
    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Model
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
     * @return Model
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
     * @return Model
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
     * Set forHome.
     *
     * @param bool $forHome
     *
     * @return Model
     */
    public function setForHome($forHome)
    {
        $this->forHome = $forHome;

        return $this;
    }

    /**
     * Get forHome.
     *
     * @return bool
     */
    public function getForHome()
    {
        return $this->forHome;
    }
    
    /**
     * Set forEvent.
     *
     * @param bool $forEvent
     *
     * @return Model
     */
    public function setForEvent($forEvent)
    {
        $this->forEvent = $forEvent;

        return $this;
    }

    /**
     * Get forEvent.
     *
     * @return bool
     */
    public function getForEvent()
    {
        return $this->forEvent;
    }
    
    /**
     * Set forIndustry.
     *
     * @param bool $forIndustry
     *
     * @return Model
     */
    public function setForIndustry($forIndustry)
    {
        $this->forIndustry = $forIndustry;

        return $this;
    }

    /**
     * Get forIndustry.
     *
     * @return bool
     */
    public function getForIndustry()
    {
        return $this->forIndustry;
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
