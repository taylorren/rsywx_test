<?php

namespace tr\rsywxBundle\DataFixtures\ORM;

use \Doctrine\Common\DataFixtures\AbstractFixture;
use \Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use \Doctrine\Common\Persistence\ObjectManager;
use tr\rsywxBundle\Entity\BookTaglist as BookTaglist;

class LoadTaglistData extends AbstractFixture implements OrderedFixtureInterface
{
    /**
     * 
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        //Create a few tags
        for ($i=1;$i<=5;$i++)
        {
            $t=new BookTaglist();
            $t->setTag("tag$i");
            $t->setBid($this->getReference('aBook'));
            
            $manager->persist($t);
        }
        $manager->flush();

    }
    
    /**
     * 
     * {@inheritDoc}
     */
    public function getOrder()
    {
       return 6; 
    }
}