public class Solution {
	public int searchInsert(ArrayList<Integer> a, int b) {
	    int i=0; 
            int j=a.size()-1;
     
            while(i<=j){
                int mid = (i+j)/2;
                int current = a.get(mid);     
                if(b > current){
                    i=mid+1;
                }else if(b < current){
                    j=mid-1;
                }else{
                    return mid;
                }
            }  
     
            return i;
        }
}
