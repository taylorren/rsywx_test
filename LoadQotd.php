<?php

namespace tr\rsywxBundle\DataFixtures\ORM;

use \Doctrine\Common\DataFixtures\AbstractFixture;
use \Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use \Doctrine\Common\Persistence\ObjectManager;
use tr\rsywxBundle\Entity\Qotd as Qotd;

class LoadQotdData extends AbstractFixture implements OrderedFixtureInterface
{
    /**
     * 
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        //Create some quotes
        for($i=1;$i<=10;$i++)
        {
            $q=new Qotd();
            $q->setQuote("Quote $i");
            $q->setSource("Source $i");
            
            $manager->persist($q);
        }
        
        $manager->flush();
    }
    
    /**
     * 
     * {@inheritDoc}
     */
    public function getOrder()
    {
       return 7; 
    }
}