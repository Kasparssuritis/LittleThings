import java.util.ArrayList;

public class selectionSortMethod {
    public static void main(String[] args) {

        return;
    }

    public static ArrayList<Integer> selectionMethod(ArrayList<Integer> array) {
        for (int i = 0; i < array.size(); i++) {
            int min = array.get(i);
            int imin = i;
            for (int j = i + 1; j < array.size(); j++) {
                if (array.get(j) < min) {
                    min = array.get(j);
                    imin = j;
                }
            }

            if (i != imin) {
                int temp = array.get(i);
                array.set(i, array.get(imin));
                array.set(imin, temp);
            }
        }

        return array;
    }
}
