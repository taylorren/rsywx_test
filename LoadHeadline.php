<?php

namespace tr\rsywxBundle\DataFixtures\ORM;

use \Doctrine\Common\DataFixtures\AbstractFixture;
use \Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use \Doctrine\Common\Persistence\ObjectManager;
use tr\rsywxBundle\Entity\BookHeadline as BookHeadline;

class LoadHeadlineData extends AbstractFixture implements OrderedFixtureInterface
{
    /**
     * 
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        //Create a headline
        $h=new BookHeadline();
        $h->setReviewtitle('A simple review headline');
        $h->setCreateAt(new \DateTime());
        $h->setDisplay(1);
        $h->setBid($this->getReference('aBook'));
        
        $manager->persist($h);
        
        $this->addReference('aHeadline', $h);
        $manager->flush();
    }
    
    /**
     * 
     * {@inheritDoc}
     */
    public function getOrder()
    {
       return 4; 
    }
}