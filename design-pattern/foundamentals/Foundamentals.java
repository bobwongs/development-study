
/**
 * Foundamentals
 */
public class Foundamentals 
{
    public static void main(String[] args) {
        Duck duck = new Duck();
        duck.quack();
        duck.fly();
        duck.flyable = new FlyHighly();
        duck.fly();
        duck.flyable = new FlyLowly();
        duck.fly();

        System.out.println("duck age: " + duck.getAge());
        duck.setAge(5);
        System.out.println("duck age: " + duck.getAge());

        YellowDuck yellowDuck = new YellowDuck();
        yellowDuck.showYellow();
    }
}

/**
 * Duck, Encapsulation
 */
class Duck 
{
    Flyable flyable;  // Polymorphism
    private int age;

    public Duck () {
        this.setAge(1);
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    public void quack() {
        System.out.println("Quack");
    }

    public void fly() {
        if (this.flyable != null) {
            this.flyable.fly();
        } else {
            System.out.println("I'm can not flyable");
        }
    }
}

/**
 * YellowDuck, Inheritance
 */
class YellowDuck extends Duck
{
    public void showYellow() {
        System.out.println("I'm duck in yellow color");
    }
}

/**
 * Flyable
 */
interface Flyable 
{
    public void fly();
}

/**
 * FlyHighly
 */
class FlyHighly implements Flyable
{
    public FlyHighly () { }

    // Polymorphism
    @Override
    public void fly() {
        System.out.println("I can fly highly!");
    }
}

/**
 * FlyLowly
 */
class FlyLowly implements Flyable
{
    public FlyLowly () { }

    @Override
    public void fly() {
        System.out.println("I can fly lowly!");
    }
}