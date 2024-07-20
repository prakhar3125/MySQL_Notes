class Solution {
  // Main function to find the start and end position of a given target 'k' in the array 'arr'
  public int[] searchRange(int[] arr, int k) {
      // Initialize the result array with -1, indicating the target is not found by default
      int[] ans = {-1, -1};
      int i = 0;
      int j = arr.length - 1;
      
      // Perform binary search to find any occurrence of the target 'k'
      while (i <= j) {
          int mid = i + (j - i) / 2;
          if (arr[mid] == k) {
              // If the target is found, search for the leftmost and rightmost positions
              ans[0] = BSleft(0, mid, k, arr);
              ans[1] = BSright(mid, arr.length - 1, k, arr);
              break; // Exit the loop once the range is found
          } else if (arr[mid] > k) {
              j = mid - 1; // Move to the left half
          } else {
              i = mid + 1; // Move to the right half
          }
      }

      return ans; // Return the result array containing start and end positions
  }

  // Helper function to find the leftmost (first) occurrence of the target 'k'
  public static int BSleft(int l, int r, int k, int[] arr) {
      int ans = -1;
      
      // Perform binary search to find the leftmost position of 'k'
      while (l <= r) {
          int mid = l + (r - l) / 2;
          if (arr[mid] >= k) {
              if (arr[mid] == k) ans = mid; // Update ans to mid if 'k' is found
              r = mid - 1; // Move to the left half
          } else {
              l = mid + 1; // Move to the right half
          }
      }
      return ans; // Return the leftmost position of 'k' or -1 if not found
  }

  // Helper function to find the rightmost (last) occurrence of the target 'k'
  public static int BSright(int l, int r, int k, int[] arr) {
      int ans = -1;
      
      // Perform binary search to find the rightmost position of 'k'
      while (l <= r) {
          int mid = l + (r - l) / 2;
          if (arr[mid] <= k) {
              if (arr[mid] == k) ans = mid; // Update ans to mid if 'k' is found
              l = mid + 1; // Move to the right half
          } else {
              r = mid - 1; // Move to the left half
          }
      }
      return ans; // Return the rightmost position of 'k' or -1 if not found
  }
}

/*
Explanation of Maximization and Minimization of 'ans' Concept:
1. In the `BSleft` function, the goal is to find the leftmost occurrence of the target 'k'. 
 - When `arr[mid]` is equal to 'k', we update `ans` to `mid` and continue searching in the left half (`r = mid - 1`).
 - This ensures that we keep finding the leftmost index where 'k' appears.
 - If `arr[mid]` is greater than or equal to 'k', it narrows down to the left side since the first occurrence could be there.

2. In the `BSright` function, the goal is to find the rightmost occurrence of the target 'k'.
 - When `arr[mid]` is equal to 'k', we update `ans` to `mid` and continue searching in the right half (`l = mid + 1`).
 - This ensures that we keep finding the rightmost index where 'k' appears.
 - If `arr[mid]` is less than or equal to 'k', it narrows down to the right side since the last occurrence could be there.

By using these two helper functions, we ensure that we accurately find both the start and end positions of the target 'k' in the array, even if 'k' appears multiple times.
*/
