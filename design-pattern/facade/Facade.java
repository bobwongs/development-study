
/**
 * Facade
 */
public class Facade 
{
    public static void main(String[] args) {
        Light light = new Light();
        MusicPlayer musicPlayer = new MusicPlayer();
        Kettle kettle = new Kettle();
        Toast toast = new Toast();

        HomeMovieTheatre homeMovieTheatre = new HomeMovieTheatre(light, musicPlayer, kettle, toast);
        homeMovieTheatre.everythingOn();
        homeMovieTheatre.everythingOff();
    }
}

/**
 * HomeMovieTheatre
 */
class HomeMovieTheatre 
{
    Light light;
    MusicPlayer musicPlayer;
    Kettle kettle;
    Toast toast;

    public HomeMovieTheatre(Light light, MusicPlayer musicPlayer, Kettle kettle, Toast toast) {
        this.light = light;
        this.musicPlayer = musicPlayer;
        this.kettle = kettle;
        this.toast = toast;
    }

    public void everythingOn() {
        System.out.println("Everything on:");

        this.light.on();
        this.musicPlayer.play();
        this.kettle.on();
        this.toast.on();
    }

    public void everythingOff() {
        System.out.println("Everything off:");
        this.light.off();
        this.musicPlayer.stop();
        this.kettle.off();
        this.toast.off();
    }
}

/**
 * Light
 */
class Light 
{
    public void on() {
        System.out.println("Light up!");
    }
    
    public void off() {
        System.out.println("Light off!");
    }
}

/**
 * MusicPlayer
 */
class MusicPlayer 
{
    public void play() {
        System.out.println("MusicPlayer play!");
    }

    public void stop() {
        System.out.println("MusicPlayer stop!");
    }
}

/**
 * Kettle
 */
class Kettle 
{
    public void on() {
        System.out.println("Boil water!");
    }

    public void off() {
        System.out.println("End boil water!");
    }
}

/**
 * Toast
 */
class Toast 
{
    public void on() {
        System.out.println("Toast on!");
    }

    public void off() {
        System.out.println("Toast off!");
    }
}