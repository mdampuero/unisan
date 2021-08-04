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
     * @ORM\Column(name="webpay_commerce_code", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $webpayCommerceCode;
    
    /**
     * @var string
     *
     * @ORM\Column(name="webpay_key_secret", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $webpayKeySecret;
    
    /**
     * @var bool
     *
     * @ORM\Column(name="webpay_production", type="boolean")
     * @Expose
     */
    private $webpayProduction=false;

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
     * @ORM\Column(name="email_retirements", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailRetirements;
    
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
     * @ORM\Column(name="email_certificate", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailCertificate;
    
    /**
     * @var string
     *
     * @ORM\Column(name="email_visits", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailVisits;

    /**
     * @var string
     *
     * @ORM\Column(name="email_cv", type="string", length=255)
     * @Assert\NotBlank()
     * @Assert\Email()
     * @Expose
     */
    private $emailCV;
    
    /**
     * @var string
     *
     * @ORM\Column(name="whatsapp", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $whatsapp;

    /**
     * @var string
     *
     * @ORM\Column(name="copyright", type="string", length=255)
     * @Assert\NotBlank()
     * @Expose
     */
    private $copyright;

    /**
     * @var float
     *
     * @ORM\Column(name="delivery_cost", type="float")
     * @Assert\NotBlank()
     * @Expose
     */
    private $deliveryCost;

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
     * Set webpayCommerceCode.
     *
     * @param string $webpayCommerceCode
     *
     * @return Setting
     */
    public function setWebpayCommerceCode($webpayCommerceCode)
    {
        $this->webpayCommerceCode = $webpayCommerceCode;

        return $this;
    }

    /**
     * Get webpayCommerceCode.
     *
     * @return string
     */
    public function getWebpayCommerceCode()
    {
        return $this->webpayCommerceCode;
    }
    
    /**
     * Set webpayKeySecret.
     *
     * @param string $webpayKeySecret
     *
     * @return Setting
     */
    public function setWebpayKeySecret($webpayKeySecret)
    {
        $this->webpayKeySecret = $webpayKeySecret;

        return $this;
    }

    /**
     * Get webpayKeySecret.
     *
     * @return string
     */
    public function getWebpayKeySecret()
    {
        return $this->webpayKeySecret;
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
     * Set emailRetirements.
     *
     * @param string $emailRetirements
     *
     * @return Setting
     */
    public function setEmailRetirements($emailRetirements)
    {
        $this->emailRetirements = $emailRetirements;

        return $this;
    }

    /**
     * Get emailRetirements.
     *
     * @return string
     */
    public function getEmailRetirements()
    {
        return $this->emailRetirements;
    }
    
    /**
     * Set webpayProduction
     *
     * @param boolean $webpayProduction
     *
     * @return Setting
     */
    public function setWebpayProduction($webpayProduction)
    {
        $this->webpayProduction = $webpayProduction;

        return $this;
    }

    /**
     * Get webpayProduction
     *
     * @return bool
     */
    public function getWebpayProduction()
    {
        return $this->webpayProduction;
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
     * Set emailCertificate.
     *
     * @param string $emailCertificate
     *
     * @return Setting
     */
    public function setEmailCertificate($emailCertificate)
    {
        $this->emailCertificate = $emailCertificate;

        return $this;
    }

    /**
     * Get emailCertificate.
     *
     * @return string
     */
    public function getEmailCertificate()
    {
        return $this->emailCertificate;
    }
    
    /**
     * Set emailVisits.
     *
     * @param string $emailVisits
     *
     * @return Setting
     */
    public function setEmailVisits($emailVisits)
    {
        $this->emailVisits = $emailVisits;

        return $this;
    }

    /**
     * Get emailVisits.
     *
     * @return string
     */
    public function getEmailVisits()
    {
        return $this->emailVisits;
    }
    
    /**
     * Set emailCV.
     *
     * @param string $emailCV
     *
     * @return Setting
     */
    public function setEmailCV($emailCV)
    {
        $this->emailCV = $emailCV;

        return $this;
    }

    /**
     * Get emailCV.
     *
     * @return string
     */
    public function getEmailCV()
    {
        return $this->emailCV;
    }
    
    /**
     * Set whatsapp.
     *
     * @param string $whatsapp
     *
     * @return Setting
     */
    public function setWhatsapp($whatsapp)
    {
        $this->whatsapp = $whatsapp;

        return $this;
    }

    /**
     * Get whatsapp.
     *
     * @return string
     */
    public function getWhatsapp()
    {
        return $this->whatsapp;
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
     * Set deliveryCost.
     *
     * @param float|null $deliveryCost
     *
     * @return Product
     */
    public function setDeliveryCost($deliveryCost = null)
    {
        $this->deliveryCost = $deliveryCost;

        return $this;
    }

    /**
     * Get deliveryCost.
     *
     * @return float|null
     */
    public function getDeliveryCost()
    {
        return $this->deliveryCost;
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
