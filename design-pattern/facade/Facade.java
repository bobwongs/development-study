
/**
 * Facade
 */
public class Facade 
{
    public static void main(String[] args) {
        HomeMovieTheatre homeMovieTheatre = new HomeMovieTheatre();
        homeMovieTheatre.everythingOn();
        homeMovieTheatre.everythingOff();
    }
}

/**
 * HomeMovieTheatre
 */
class HomeMovieTheatre 
{
    public void everythingOn() {
        lightUp();
        playMusic();
        boilWater();
        toast();    
    }

    public void everythingOff() {
        lightOff();
        endMusic();
        endBoilWater();
        endToast();
    }

    public void lightUp() {
        System.out.println("lightUp");
    }
    
    public void lightOff() {
        System.out.println("lightOff");
    }

    public void playMusic() {
        System.out.println("playMusic");
    }

    public void endMusic() {
        System.out.println("endMusic");
    }

    public void boilWater() {
        System.out.println("boilWater");
    }

    public void endBoilWater() {
        System.out.println("endBoilWater");
    }

    public void toast() {
        System.out.println("toast");
    }

    public void endToast() {
        System.out.println("endToast");
    }
}