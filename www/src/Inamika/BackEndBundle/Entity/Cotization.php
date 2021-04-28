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
 * Cotization
 *
 * @ORM\Table(name="cotization")
 * @ORM\Entity(repositoryClass="Inamika\BackEndBundle\Repository\CotizationRepository")
 * @ORM\HasLifecycleCallbacks()
 * @ExclusionPolicy("all")
 */

class Cotization
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
     * Many features have one Service. This is the owning side.
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="Service")
     * @ORM\JoinColumn(name="service_id", referencedColumnName="id")
     * @Expose
     */
    private $service;

    /**
     * @var string
     *
     * @ORM\Column(name="client_name", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Length(
     *      min = 3,
     *      max = 64
     * )
     * @Expose
     */
    private $clientName;
    
    /**
     * @var string
     *
     * @ORM\Column(name="client_email", type="string", length=255)
     * @Assert\Email()
     * @Assert\NotBlank()
     * @Expose
     */
    private $clientEmail;
    
    /**
     * @var string
     *
     * @ORM\Column(name="client_phone", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $clientPhone;

    /**
     * @var string|null
     *
     * @ORM\Column(name="observation", type="text", nullable=true)
     * @Expose
     */
    private $observation;
    
    /**
     * @var string|null
     *
     * @ORM\Column(name="client_address", type="text", nullable=true)
     * @Expose
     */
    private $clientAddress;

    /**
     * @var string
     *
     * @ORM\Column(name="client_city", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $clientCity;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime")
     * @Expose
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
     * Set clientName.
     *
     * @param string $clientName
     *
     * @return Cotization
     */
    public function setClientName($clientName)
    {
        $this->clientName = $clientName;

        return $this;
    }

    /**
     * Get clientName.
     *
     * @return string
     */
    public function getClientName()
    {
        return $this->clientName;
    }
    
    /**
     * Set service.
     *
     * @param int $service
     *
     * @return UnitStatus
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
     * Set clientEmail.
     *
     * @param string $clientEmail
     *
     * @return Cotization
     */
    public function setClientEmail($clientEmail)
    {
        $this->clientEmail = $clientEmail;

        return $this;
    }

    /**
     * Get clientEmail.
     *
     * @return string
     */
    public function getClientEmail()
    {
        return $this->clientEmail;
    }
    
    /**
     * Set clientPhone.
     *
     * @param string $clientPhone
     *
     * @return Cotization
     */
    public function setClientPhone($clientPhone)
    {
        $this->clientPhone = $clientPhone;

        return $this;
    }

    /**
     * Get clientPhone.
     *
     * @return string
     */
    public function getClientPhone()
    {
        return $this->clientPhone;
    }

    /**
     * Set observation.
     *
     * @param string|null $observation
     *
     * @return Cotization
     */
    public function setObservation($observation = null)
    {
        $this->observation = $observation;

        return $this;
    }

    /**
     * Get observation.
     *
     * @return string|null
     */
    public function getObservation()
    {
        return $this->observation;
    }
    
    /**
     * Set clientAddress.
     *
     * @param string|null $clientAddress
     *
     * @return Cotization
     */
    public function setClientAddress($clientAddress = null)
    {
        $this->clientAddress = $clientAddress;

        return $this;
    }

    /**
     * Get clientAddress.
     *
     * @return string|null
     */
    public function getClientAddress()
    {
        return $this->clientAddress;
    }
    
    /**
     * Set clientCity.
     *
     * @param string|null $clientCity
     *
     * @return Cotization
     */
    public function setClientCity($clientCity = null)
    {
        $this->clientCity = $clientCity;

        return $this;
    }

    /**
     * Get clientCity.
     *
     * @return string|null
     */
    public function getClientCity()
    {
        return $this->clientCity;
    }

    /**
     * Set createdAt.
     *
     * @param \DateTime $createdAt
     *
     * @return Cotization
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
     * @return Cotization
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
     * @return Cotization
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
