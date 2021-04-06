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
 * Service
 *
 * @ORM\Table(name="service")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\ServiceRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(fields={"code"}, repositoryMethod="getUniqueNotDeleted")
 * @ExclusionPolicy("all")
 */

class Service
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
     * Many Popup have one ServiceCategory. This is the owning side.
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="ServiceCategory")
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     * @Expose
     */
    private $category;
    
    /**
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="ServiceSubcategory")
     * @ORM\JoinColumn(name="subcategory_id", referencedColumnName="id")
     * @Expose
     */
    private $subcategory;

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
     * @var string
     *
     * @ORM\Column(name="code", type="string", length=255, nullable=true)
     * @Assert\Length(
     *      min = 3,
     *      max = 10
     * )
     * @Expose
     */
    private $code;

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
     * @ORM\Column(name="specs", type="text", nullable=true)
     * @Expose
     */
    private $specs;
    
    /**
     * @var string|null
     *
     * @ORM\Column(name="conditions", type="text", nullable=true)
     * @Expose
     */
    private $conditions;

    /**
     * @var string
     *
     * @ORM\Column(name="model", type="string", length=255, nullable=true)
     * @Assert\Length(
     *      min = 3,
     *      max = 64
     * )
     * @Expose
     */
    private $model;

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
     * Set category.
     *
     * @param int $category
     *
     * @return Service
     */
    public function setCategory($category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category.
     *
     * @return int
     */
    public function getCategory()
    {
        return $this->category;
    }
    
    /**
     * Set subcategory.
     *
     * @param int $subcategory
     *
     * @return Service
     */
    public function setSubcategory($subcategory)
    {
        $this->subcategory = $subcategory;

        return $this;
    }

    /**
     * Get subcategory.
     *
     * @return int
     */
    public function getSubcategory()
    {
        return $this->subcategory;
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
     * @return Service
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
     * Set code.
     *
     * @param string $code
     *
     * @return Service
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Get code.
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set description.
     *
     * @param string|null $description
     *
     * @return Service
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
     * Set specs.
     *
     * @param string|null $specs
     *
     * @return Service
     */
    public function setSpecs($specs = null)
    {
        $this->specs = $specs;

        return $this;
    }

    /**
     * Get specs.
     *
     * @return string|null
     */
    public function getSpecs()
    {
        return $this->specs;
    }

    /**
     * Set conditions.
     *
     * @param string|null $conditions
     *
     * @return Service
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
     * Set model.
     *
     * @param string|null $model
     *
     * @return Service
     */
    public function setModel($model = null)
    {
        $this->model = $model;

        return $this;
    }

    /**
     * Get model.
     *
     * @return string|null
     */
    public function getModel()
    {
        return $this->model;
    }
    
    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Service
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
     * @return Service
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
     * @return Service
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
