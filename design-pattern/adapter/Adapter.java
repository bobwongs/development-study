/**
 * Adapter
 */
public class Adapter 
{
    public static void main(String[] args) {
        Turkey turkey = new Turkey();
        turkey.gobble();
        turkey.fly();

        Duck duck = new TurkeyAdapter(turkey);
        makeDuckAction(duck);
    }

    public static void makeDuckAction(Duck duck) {
        duck.quack();
        duck.fly();
    }
}

/**
 * Duck
 */
interface Duck 
{
    public void quack();
    public void fly();
}

/**
 * Turkey
 */
class Turkey 
{
    public void gobble() {
        System.out.println("Turkey gobble!");
    }
    public void fly() {
        System.out.println("Turkey fly!");        
    }
}

/**
 * TurkeyAdapter
 */
class TurkeyAdapter implements Duck
{
    Turkey turkey;

    public TurkeyAdapter (Turkey turkey) {
        this.turkey = turkey;
    }

    @Override
    public void quack() {
        this.turkey.gobble();
    }

    @Override
    public void fly() {
        this.turkey.fly();
    }
}