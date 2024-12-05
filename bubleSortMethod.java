public class bubleSortMethod {
    public static void main(String[] args) {
        int arr[] = new int[] { 9, 23, 1, 5, 6, 3, 14, 78, 36 };

        bubleSort(arr);// start sorting

        for (int i : arr) {// print array
            System.out.print(i + " ");
        }
    }

    public static void bubleSort(int[] arr) {
        int length = arr.length - 1;
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < length - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    int temp = arr[j + 1];
                    arr[j + 1] = arr[j];
                    arr[j] = temp;
                }
            }

        }
    }
}
