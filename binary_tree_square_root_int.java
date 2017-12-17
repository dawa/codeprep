public class Solution {
	public int sqrt(int a) {
	    // Base Cases
        if (a == 0 || a == 1)
            return a;
 
        // Do Binary Search for floor(sqrt(a))
        long start = 0, end = a/2, ans=0;
        while (start <= end)
        {
            long mid = (start + end) / 2;
            // If x is a perfect square
            long sq = mid*mid;
            if ( sq == a)
                return (int) (long) mid;
 
            // Since we need floor, we update answer when mid*mid is
            // smaller than a, and move closer to sqrt(a)
            if (sq < a)
            {
                //System.out.printf("sq:%d mid: %d start: %d end:%d\n", sq, mid, start, end);
                start = mid + 1;
                ans = mid;
            }
            else   // If mid*mid is greater than a
                end = mid - 1;
        }
        return (int) (long) ans;
    }
}

