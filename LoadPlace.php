<?php

namespace tr\rsywxBundle\DataFixtures\ORM;

use \Doctrine\Common\DataFixtures\AbstractFixture;
use \Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use \Doctrine\Common\Persistence\ObjectManager;
use \tr\rsywxBundle\Entity\BookPlace as BookPlace;

class LoadPlaceData extends AbstractFixture implements OrderedFixtureInterface
{
    /**
     * 
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        //Create a common place
        $place1=new BookPlace();
        $place1->setName('Common');
        $this->addReference('commonPlace', $place1);
        
        //Create a special place
        $place2=new BookPlace();
        $place2->setName('Special');
        $this->addReference('specialPlace', $place2);
        
        $manager->persist($place1);
        $manager->persist($place2);
        
        $manager->flush();
    }
    
    /**
     * 
     * {@inheritDoc}
     */
    public function getOrder()
    {
       return 2; 
    }
}