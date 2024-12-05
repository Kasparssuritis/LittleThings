import java.util.ArrayList;

public class insertionSortMethod {
    public static void main(String[] args) {

        return;
    }

    public static ArrayList<Integer> insertionMethod(ArrayList<Integer> array) {
        int temp;
        for (int i = 1; i < array.size(); i++) {
            temp = array.get(i);
            int j = i - 1;
            while (j >= 0 && array.get(j) > temp) {
                array.set(j + 1, array.get(j));
                j = j - 1;
            }

            array.set(j + 1, temp);
        }

        return array;
    }
}
