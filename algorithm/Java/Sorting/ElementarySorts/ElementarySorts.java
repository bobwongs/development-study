/**
 * Elementary Sorts Entry Class
 */
public class ElementarySorts 
{
    public static void main(String[] args) {
        Student s0 = new Student(20);
        Student s1 = new Student(25);

        System.out.println("s0 compare to s1: " + s0.compareTo(s1));

        
    }

    public static boolean isSorted(Comparable<Comparable>[] a) {   
        for (int i = 0; i < a.length - 1; i++) {
            if (a[i].compareTo(a[i + 1]) > 0) return false;  // 增序
        }
        return true;
    }

    public static void exchange(Comparable[] a, int i, int j) {
        Comparable tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }

    public static void showArray(Comparable[] a) {
        for (int i = 0; i < a.length; i++) {
            System.out.println("array[" + i + "]" + "=" + a[i]);
        }
    }
}

/**
 * Selection Sort
 */
class SelectionSort 
{
    public static void selectionSort() {
        
    }
}

/**
 * Insertion Sort
 */
class InsertionSort 
{
    public InsertionSort () {
        
    }
}

/**
 * Shell Sort
 */
class ShellSort 
{
    public ShellSort () {
        
    }
}

/**
 * Comparable
 */
interface Comparable<Comparable> 
{
    public int compareTo(Comparable c);
}

/**
 * Student
 */
class Student implements Comparable<Student> 
{
    int age;

    public Student (int age) {
        this.age = age;
    }

    public int compareTo(Student s) {
        return this.age - s.age;
    }
}
