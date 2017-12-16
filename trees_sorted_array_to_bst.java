/**
 * Definition for binary tree
 * class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
	public TreeNode sortedArrayToBST(final List<Integer> a) {
        return tree(a, 0, a.size()-1);
    }
    
    private TreeNode tree(List<Integer> a, int i, int j) {
        if (i == j) {
            return new TreeNode(a.get(i));
        }
        
        int mid = (i+j)/2;
        TreeNode b = new TreeNode(a.get(mid));
        if (i < mid) {
            b.left = tree(a, i, mid-1);
        }
        if (mid < j) {
            b.right = tree(a, mid+1, j);
        }
        
        return b;
    }
}

