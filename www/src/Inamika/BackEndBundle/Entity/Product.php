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
 * Product
 *
 * @ORM\Table(name="product")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\ProductRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(fields={"code"}, repositoryMethod="getUniqueNotDeleted")
 * @ExclusionPolicy("all")
 */

class Product
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
     * Many Popup have one Category. This is the owning side.
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     * @Expose
     */
    private $category;

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
     * @ORM\Column(name="code", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 10
     * )
     * @Expose
     */
    private $code;

    /**
     * Many features have one Currency. This is the owning side.
     * @ORM\ManyToOne(targetEntity="Currency")
     * @Expose
     * @ORM\JoinColumn(name="currency_id", referencedColumnName="id")
     */
    private $currency;

    /**
     * @var float
     *
     * @ORM\Column(name="price", type="float")
     * @Assert\NotBlank()
     * @Expose
     */
    private $price;

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
     * @var bool
     *
     * @ORM\Column(name="is_salient", type="boolean")
     * @Expose
     */
    private $isSalient=false;

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     * @Expose
     */
    private $description;

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
     * @return Product
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
     * Set category.
     *
     * @param int $category
     *
     * @return Product
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
     * Set currency.
     *
     * @param string $currency
     *
     * @return Product
     */
    public function setCurrency($currency)
    {
        $this->currency = $currency;

        return $this;
    }

    /**
     * Get currency.
     *
     * @return string
     */
    public function getCurrency()
    {
        return $this->currency;
    }

    /**
     * Set price.
     *
     * @param float|null $price
     *
     * @return Product
     */
    public function setPrice($price = null)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price.
     *
     * @return float|null
     */
    public function getPrice()
    {
        return $this->price;
    }
    
    /**
     * Set code.
     *
     * @param string $code
     *
     * @return Product
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
     * @return Product
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
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Product
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
     * @return Product
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
     * Set isSalient.
     *
     * @param bool $isSalient
     *
     * @return Product
     */
    public function setIsSalient($isSalient)
    {
        $this->isSalient = $isSalient;

        return $this;
    }

    /**
     * Get isSalient.
     *
     * @return bool
     */
    public function getIsSalient()
    {
        return $this->isSalient;
    }

    /**
     * Set isDelete.
     *
     * @param bool $isDelete
     *
     * @return Product
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
