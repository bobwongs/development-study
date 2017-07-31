import java.util.List;
import java.util.ArrayList;
import java.util.Random;

/**
 * Elementary Sorts Entry Class
 */
public class ElementarySorts 
{
    public static void main(String[] args) {

        Comparable<Comparable>[] list0 = randomComparableList();
        showArray(list0);
        isSorted(list0);

        Comparable<Comparable>[] list1 = randomComparableList();
        SelectionSort.selectionSort(list1);
        showArray(list1);
        isSorted(list1);

        Comparable<Comparable>[] list2 = randomComparableList();
        InsertionSort.insertionSort(list2);
        showArray(list2);
        isSorted(list2);
    }

    public static boolean isSorted(Comparable<Comparable>[] a) {   
        for (int i = 0; i < a.length - 1; i++) {
            if (a[i].compareTo(a[i + 1]) > 0) {
                System.out.println("The array is not sorted");
                return false;  // 正确的排序为增序
            }
        }
        System.out.println("The array is sorted");
        return true;
    }

    public static void exchange(Comparable[] a, int i, int j) {
        if (i == j) return;
        Comparable tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }

    public static void showArray(Comparable[] a) {
        for (int i = 0; i < a.length; i++) {
            System.out.print(a[i] + "  ");
        }
    }

    public static Comparable<Comparable>[] randomComparableList() {
        List<Comparable> students = new ArrayList<Comparable>();
        Random randomGenerator = new Random();
        for (int i = 0; i < 10; i++) {
            students.add(new Student(randomGenerator.nextInt(100)));
        }
        
        Comparable<Comparable>[] list = students.toArray(new Student[0]);
        return list;
    }
}

/**
 * Selection Sort
 */
class SelectionSort 
{
    public static void selectionSort(Comparable<Comparable>[] a) {
        for (int i = 0; i < a.length - 1; i++) {
            int min = i;
            for (int j = min + 1; j < a.length; j++) {
                if (a[min].compareTo(a[j]) > 0) {
                    min = j;
                }
            }
            ElementarySorts.exchange(a, i, min);
        }
    }
}

/**
 * Insertion Sort
 */
class InsertionSort 
{
    public static void insertionSort (Comparable<Comparable>[] a) {
        for (int i = 1; i < a.length; i++) {
            for (int j = i; j > 0; j--) {
                if (a[j-1].compareTo(a[j]) > 0) {
                    ElementarySorts.exchange(a, j-1, j);
                } else {
                    break;
                }
            }
        }
    }
}

/**
 * Shell Sort
 */
class ShellSort 
{
    public ShellSort (Comparable<Comparable>[] a) {
        
    }
}

/**
 * Comparable
 * 待研究Java中的Generic
 */
interface Comparable<Comparable>
{
    public int compareTo(Comparable c);
}

/**
 * Student
 */
class Student implements Comparable<Comparable>
{
    int age;

    public Student (int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return Integer.toString(this.age);
    }

    @Override
    public int compareTo(Comparable c) {
        Student s = (Student)c;
        return this.age - s.age;
    }
}
