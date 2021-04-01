<?php

namespace Inamika\BackEndBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use JMS\Serializer\Annotation\ExclusionPolicy;
use JMS\Serializer\Annotation\Expose;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Criteria;

/**
 * ServiceCategory
 *
 * @ORM\Table(name="service_category")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\ServiceCategoryRepository")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(fields={"name"}, repositoryMethod="getUniqueNotDeleted")
 */
class ServiceCategory
{
    const INDUSTRY='INDUSTRY';
    const HOME='HOME';
    const EVENT='EVENT';

    /**
     * @var string
     *
     * @ORM\Column(name="id", type="guid")
     * @ORM\Id
     * @Expose
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     * @Assert\NotBlank()
     */
    private $name;
    
    /**
     * @var string
     *
     * @ORM\Column(name="label", type="string", length=255)
     * @Assert\NotBlank()
     */
    private $label;

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
     * @ORM\OneToMany(targetEntity="ServiceSubcategory", mappedBy="category")
     * @Assert\NotBlank()
     */
    private $subcategories;

    public function __construct()
    {
        $this->subcategories = new ArrayCollection();
    }

    /**
     * Set id.
     *
     * @param string $id
     *
     * @return ServiceCategory
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

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
     * Get subcategories.
     *
     * @return int
     */
    public function getSubcategories()
    {
        $criteria = Criteria::create()
            ->andWhere(Criteria::expr()->eq('isDelete', false))
            ->orderBy(['createdAt' => 'ASC']);
        return $this->subcategories->matching($criteria);
    }
    
    /**
     * Set subcategories.
     *
     * @return Orders
     */
    public function setSubcategories($subcategories)
    {
        return $this->subcategories=$subcategories;
    }

    /**
     * Set name.
     *
     * @param string $name
     *
     * @return ServiceCategory
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
     * Set label.
     *
     * @param string $label
     *
     * @return ServiceCategory
     */
    public function setLabel($label)
    {
        $this->label = $label;

        return $this;
    }

    /**
     * Get label.
     *
     * @return string
     */
    public function getLabel()
    {
        return $this->label;
    }

    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return ServiceCategory
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
     * @return ServiceCategory
     */
    public function setUpdateAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt.
     *
     * @return \DateTime
     */
    public function getUpdateAt()
    {
        return $this->updatedAt;
    }

    /**
     * Set isDelete.
     *
     * @param bool $isDelete
     *
     * @return ServiceCategory
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
