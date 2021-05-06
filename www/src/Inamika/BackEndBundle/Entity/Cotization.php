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
     * Many features have one Model. This is the owning side.
     * @Assert\NotBlank()
     * @ORM\ManyToOne(targetEntity="Model")
     * @ORM\JoinColumn(name="model_id", referencedColumnName="id")
     * @Expose
     */
    private $model;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $name;
    
    /**
     * @var string
     *
     * @ORM\Column(name="company", type="string", length=255,nullable=true)
     * @Assert\NotBlank()
     * @Expose
     */
    private $company;
    
    /**
     * @var string
     *
     * @ORM\Column(name="rut", type="string", length=255,nullable=true)
     * @Assert\NotBlank()
     * @Expose
     */
    private $rut;
    
    /**
     * @var string
     *
     * @ORM\Column(name="comercial_address_street", type="string", length=255,nullable=true)
     * @Assert\NotBlank()
     * @Expose
     */
    private $comercialAddressStreet;
    
    /**
     * @var string
     *
     * @ORM\Column(name="comercial_address_number", type="string", length=255,nullable=true)
     * @Expose
     */
    private $comercialAddressNumber;
    
    /**
     * @var string
     *
     * @ORM\Column(name="comercial_address_city", type="string", length=255,nullable=true)
     * @Expose
     */
    private $comercialAddressCity;
    
    /**
     * @var string
     *
     * @ORM\Column(name="service_address_street", type="string", length=255,nullable=true)
     * @Assert\NotBlank()
     * @Expose
     */
    private $serviceAddressStreet;
    
    /**
     * @var string
     *
     * @ORM\Column(name="service_address_number", type="string", length=255,nullable=true)
     * @Expose
     */
    private $serviceAddressNumber;
    
    /**
     * @var string
     *
     * @ORM\Column(name="service_address_city", type="string", length=255,nullable=true)
     * @Expose
     */
    private $serviceAddressCity;
    
    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=255, nullable=true)
     * @Assert\Email()
     * @Assert\NotBlank()
     * @Expose
     */
    private $email;
    
    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $phone;
    
    /**
     * @var string
     *
     * @ORM\Column(name="frequency", type="string", length=255, nullable=true)
     * @Expose
     */
    private $frequency;

    /**
     * @var string|null
     *
     * @ORM\Column(name="observation", type="text", nullable=true)
     * @Expose
     */
    private $observation;

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
     * Set name.
     *
     * @param string $name
     *
     * @return Cotization
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
     * Set company.
     *
     * @param string $company
     *
     * @return Cotization
     */
    public function setCompany($company)
    {
        $this->company = $company;

        return $this;
    }

    /**
     * Get company.
     *
     * @return string
     */
    public function getCompany()
    {
        return $this->company;
    }
    
    /**
     * Set rut.
     *
     * @param string $rut
     *
     * @return Cotization
     */
    public function setRut($rut)
    {
        $this->rut = $rut;

        return $this;
    }

    /**
     * Get rut.
     *
     * @return string
     */
    public function getRut()
    {
        return $this->rut;
    }
    
    /**
     * Set comercialAddressStreet.
     *
     * @param string $comercialAddressStreet
     *
     * @return Cotization
     */
    public function setComercialAddressStreet($comercialAddressStreet)
    {
        $this->comercialAddressStreet = $comercialAddressStreet;

        return $this;
    }

    /**
     * Get comercialAddressStreet.
     *
     * @return string
     */
    public function getComercialAddressStreet()
    {
        return $this->comercialAddressStreet;
    }
    
    /**
     * Set comercialAddressNumber.
     *
     * @param string $comercialAddressNumber
     *
     * @return Cotization
     */
    public function setComercialAddressNumber($comercialAddressNumber)
    {
        $this->comercialAddressNumber = $comercialAddressNumber;

        return $this;
    }

    /**
     * Get comercialAddressNumber.
     *
     * @return string
     */
    public function getComercialAddressNumber()
    {
        return $this->comercialAddressNumber;
    }
    
    /**
     * Set comercialAddressCity.
     *
     * @param string $comercialAddressCity
     *
     * @return Cotization
     */
    public function setComercialAddressCity($comercialAddressCity)
    {
        $this->comercialAddressCity = $comercialAddressCity;

        return $this;
    }

    /**
     * Get comercialAddressCity.
     *
     * @return string
     */
    public function getComercialAddressCity()
    {
        return $this->comercialAddressCity;
    }
    
    /**
     * Set serviceAddressStreet.
     *
     * @param string $serviceAddressStreet
     *
     * @return Cotization
     */
    public function setServiceAddressStreet($serviceAddressStreet)
    {
        $this->serviceAddressStreet = $serviceAddressStreet;

        return $this;
    }

    /**
     * Get serviceAddressStreet.
     *
     * @return string
     */
    public function getServiceAddressStreet()
    {
        return $this->serviceAddressStreet;
    }
    
    /**
     * Set serviceAddressNumber.
     *
     * @param string $serviceAddressNumber
     *
     * @return Cotization
     */
    public function setServiceAddressNumber($serviceAddressNumber)
    {
        $this->serviceAddressNumber = $serviceAddressNumber;

        return $this;
    }

    /**
     * Get serviceAddressNumber.
     *
     * @return string
     */
    public function getServiceAddressNumber()
    {
        return $this->serviceAddressNumber;
    }
    
    /**
     * Set serviceAddressCity.
     *
     * @param string $serviceAddressCity
     *
     * @return Cotization
     */
    public function setServiceAddressCity($serviceAddressCity)
    {
        $this->serviceAddressCity = $serviceAddressCity;

        return $this;
    }

    /**
     * Get serviceAddressCity.
     *
     * @return string
     */
    public function getServiceAddressCity()
    {
        return $this->serviceAddressCity;
    }
    
    /**
     * Set model.
     *
     * @param int $model
     *
     * @return UnitStatus
     */
    public function setModel($model)
    {
        $this->model = $model;

        return $this;
    }

    /**
     * Get model.
     *
     * @return int
     */
    public function getModel()
    {
        return $this->model;
    }

    
    /**
     * Set email.
     *
     * @param string $email
     *
     * @return Cotization
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get email.
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }
    
    /**
     * Set phone.
     *
     * @param string $phone
     *
     * @return Cotization
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone.
     *
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
    }
    
    /**
     * Set frequency.
     *
     * @param string $frequency
     *
     * @return Cotization
     */
    public function setFrequency($frequency)
    {
        $this->frequency = $frequency;

        return $this;
    }

    /**
     * Get frequency.
     *
     * @return string
     */
    public function getFrequency()
    {
        return $this->frequency;
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
