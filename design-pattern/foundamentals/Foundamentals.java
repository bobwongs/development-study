
/**
 * Foundamentals
 */
public class Foundamentals 
{
    public static void main(String[] args) {
        System.out.print("hi");
    }
}

/**
 * Duck
 */
class Duck 
{
    Flyable flyable;

    public Duck () { }

    public void quack() {
        System.out.println("Quack");
    }

    public void fly() {
        this.flyable.fly();
    }
}

/**
 * YellowDuck
 */
class YellowDuck extends Duck
{
    public void showYellow() {
        System.out.println("I'm in yellow color");
    }
}

/**
 * Flyable
 */
interface Flyable {
    public void fly();
}