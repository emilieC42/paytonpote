<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Payment.
 *
 * @ORM\Table(name="payment", indexes={@ORM\Index(name="fk_payment_participant1_idx", columns={"participant_id"})})
 * @ORM\Entity
 */
class Payment
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var int|null
     *
     * @ORM\Column(name="amount", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $amount;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=true, options={"default"="NULL"})
     */
    private $createdAt;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true, options={"default"="NULL"})
     */
    private $updatedAt;

    /**
     * @var \Participant
     *
     * @ORM\ManyToOne(targetEntity="Participant",cascade={"persist"})
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="participant_id", referencedColumnName="id")
     * })
     */
    private $participant;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="hide_identity", type="boolean", nullable=true, options={"default"= NULL})
     */
    private $hideIdentity;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="hide_amount", type="boolean", nullable=true, options={"default"= NULL})
     */
    private $hideAmount;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAmount(): ?int
    {
        return $this->amount;
    }

    public function setAmount(?int $amount): self
    {
        $this->amount = $amount;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getParticipant(): ?Participant
    {
        return $this->participant;
    }

    public function setParticipant(?Participant $participant): self
    {
        $this->participant = $participant;

        return $this;
    }

    public function getHideIdentity(): ?bool
    {
        return $this->hideIdentity;
    }

    public function setHideIdentity(?bool $hideIdentity): self
    {
        $this->hideIdentity = $hideIdentity;

        return $this;
    }

    public function getHideAmount(): ?bool
    {
        return $this->hideAmount;
    }

    public function setHideAmount(?bool $hideAmount): self
    {
        $this->hideAmount = $hideAmount;

        return $this;
    }
}
