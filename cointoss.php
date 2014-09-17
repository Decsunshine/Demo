<?php
class Coin
{
    protected $surface;

    public function __construct()
    {
        $this->randomSurface();
    }

    public function randomSurface()
    {
        $this->surface = rand(0, 10) % 2;
    }

    public function setSurface($isPositive)
    {
        $this->surface = $isPositive; 
    }

    public function getSurface()
    {
        return $surface;
    }

    public function isPositive()
    {
        return $this->surface == true;
    }
}

class Robot
{
    protected $coinContainer;

    public function newCoins()
    {
        $coinNum = 0;
        while($coinNum < 50000)
        {
            $this->coinContainer[] = new Coin();
            $coinNum ++;
        }
    }

    public function reverseCoinsForever()
    {
        while(true)
        {
            $this->reverseCoins();
        }
    }

    public function reverseCoins() 
    {
        if ( count($this->coinContainer) < 0 )
        {
            return;
        }
        
        foreach($this->coinContainer as $coin)
        {
            if ($coin->isPositive())
            {
                $coin->randomSurface();
            }
            else 
            {
                $coin->setSurface(true);
            }
            $this->statisticsCount();
        } 
    }

    public function statisticsCount()
    {
        $count = 0;
        foreach($this->coinContainer as $coin)
        {
            if ($coin->isPositive())
            {
               $count ++;
            }
        } 
        var_dump(" 正面占用比例为：".$count/count($this->coinContainer));
    }
}

$robot = new Robot();
$robot->newCoins();
$robot->reverseCoinsForever();
?>
