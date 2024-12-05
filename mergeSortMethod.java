public class mergeSortMethod {
    public static void main(String[] args) {
        int[] arr = { 1, 5, 21, 11, 4, 43, 98, 8, 17, 19, 4, 7, 1000, 78, 984 };

        mergeSort(arr);

        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }

    }

    public static void mergeSort(int[] arr) {

        int length = arr.length;
        if (length <= 1)
            return;// base case

        int middle = length / 2;

        int[] leftArr = new int[middle];
        int[] rightArr = new int[length - middle];

        int i = 0;// left arr index
        int ri = 0;// right arr index

        for (; i < length; i++) {
            if (i < middle) {
                leftArr[i] = arr[i];
            } else {
                rightArr[ri] = arr[i];
                ri++;
            }
        }

        mergeSort(leftArr);
        mergeSort(rightArr);
        merge(leftArr, rightArr, arr);
    }

    public static void merge(int[] leftArr, int[] rightArr, int[] arr) {
        int leftSize = arr.length / 2;
        int rightSize = arr.length - leftSize;

        int i = 0, l = 0, r = 0;

        while (l < leftSize && r < rightSize) {
            if (leftArr[l] < rightArr[r]) {
                arr[i] = leftArr[l];
                i++;
                l++;
            } else {
                arr[i] = rightArr[r];
                i++;
                r++;
            }
        }

        while (l < leftSize) {
            arr[i] = leftArr[l];
            i++;
            l++;
        }
        while (r < rightSize) {
            arr[i] = rightArr[r];
            i++;
            r++;
        }
    }

}
