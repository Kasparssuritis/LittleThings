
public class quickSortMethod {
    public static void main(String[] args) {

        int[] array = { 4, 45, 3, 0, 65, 5, 31, 17, 7, 9, 5, 8, 85, 1, 79 };

        quickSort(array, 0, array.length - 1);

        for (int i : array) {
            System.out.print(i + " ");
        }

    }

    public static void quickSort(int[] array, int start, int end) {

        if (end <= start)
            return; // base case

        int pivot = partition(array, start, end);
        quickSort(array, start, pivot - 1);
        quickSort(array, pivot + 1, end);

    }

    public static int partition(int[] array, int start, int end) {
        int pivot = array[end];
        int i = start - 1;

        for (int j = start; j < end; j++) {
            if (array[j] < pivot) {

                i++;
                int temp = array[j];
                array[j] = array[i];
                array[i] = temp;
            }
        }

        i++;
        int temp = array[end];
        array[end] = array[i];
        array[i] = temp;

        return i;

    }

}
