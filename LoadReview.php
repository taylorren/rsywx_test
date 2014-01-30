<?php

namespace tr\rsywxBundle\DataFixtures\ORM;

use \Doctrine\Common\DataFixtures\AbstractFixture;
use \Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use \Doctrine\Common\Persistence\ObjectManager;
use tr\rsywxBundle\Entity\BookReview as BookReview;

class LoadBookReviewData extends AbstractFixture implements OrderedFixtureInterface
{

    /**
     * 
     * {@inheritDoc}
     */
    public function load(ObjectManager $manager)
    {
        for($i=1;$i<=2;$i++)
        {
            $r=new BookReview();
            $r->setDatein(new \DateTime());
            $r->setHid($this->getReference('aHeadline'));
            $r->setTitle("Review $i.");
            $r->setUri("http://$i");
            
            $manager->persist($r);
        }
        $manager->flush();
    }

    /**
     * 
     * {@inheritDoc}
     */
    public function getOrder()
    {
        return 5;
    }

}
