
/**
 * Decorator
 */
public class Decorator 
{
    public static void main(String[] args) {
        Decoration decoration = new SpringMatching();
        Clothes clothes = new Overcoat(decoration);
        clothes = new Hat(clothes);
        clothes = new Jean(clothes);
        System.out.println("total cost: " + clothes.cost());
    }
}

/**
 * Decoration
 */
class Decoration 
{
    String name = "Unknown";

    @Override
    public String toString() {
        return this.name;
    }

    public double cost() {
        return 0.0;
    }
}

/**
 * SpringMatching
 */
class SpringMatching extends Decoration
{
    public SpringMatching () {
        this.name = "SpringMatching";
    }

    @Override
    public double cost() {
        return 22.0;
    }
}

/**
 * SummerMatching
 */
class SummerMatching extends Decoration
{
    public SummerMatching () {
        this.name = "SummerMatching";
    }

    @Override
    public double cost() {
        return 50.0;
    }    
}

/**
 * Clothes
 */
abstract class Clothes extends Decoration 
{
    // abstract public double totalCost();
}

/**
 * Overcoat
 */
class Overcoat extends Clothes 
{
    Decoration decoration;

    public Overcoat(Decoration d) {
        this.decoration = d;
        this.name = "Overcoat";
    }

    @Override
    public double cost() {
        return 60.0 + decoration.cost();
    }
}

/**
 * Hat
 */
class Hat extends Clothes
{
    Decoration decoration;

    public Hat(Decoration d) {
        this.decoration = d;
        this.name = "Hat";
    }

    @Override
    public double cost() {
        return 55.0 + decoration.cost();
    }
}

/**
 * Jean
 */
class Jean extends Clothes 
{
    Decoration decoration;

    public Jean (Decoration d) {
        this.decoration = d;
        this.name = "Jean";
    }

    @Override
    public double cost() {
        return 100.0 + decoration.cost();
    }
}
