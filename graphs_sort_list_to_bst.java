/**
 * Definition for binary tree
 * class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     public int val;
 *     public ListNode next;
 *     ListNode(int x) { val = x; next = null; }
 * }
 */
public class Solution {
	public TreeNode sortedListToBST(ListNode a) {
	   /*Count the number of nodes in Linked List */
        int n = countNodes(a);
        
        head = a;
        
        /* Construct BST */
        return sortedListToBSTRecur(n);
    }

    /* head node of link list */
    static ListNode head;
    
    /* The main function that constructs balanced BST and
       returns root of it.
       n  --> No. of nodes in the Doubly Linked List */
    TreeNode sortedListToBSTRecur(int n) 
    {
        /* Base Case */
        if (n <= 0) 
            return null;

        /* Recursively construct the left subtree */
        TreeNode left = sortedListToBSTRecur(n / 2);

        /* head_ref now refers to middle node, 
           make middle node as root of BST*/
        TreeNode root = new TreeNode(head.val);

        // Set pointer to left subtree
        root.left = left;

        /* Change head pointer of Linked List for parent 
           recursive calls */
        head = head.next;

        /* Recursively construct the right subtree and link it 
           with root. The number of nodes in right subtree  is 
           total nodes - nodes in left subtree - 1 (for root) */
        root.right = sortedListToBSTRecur(n - n / 2 - 1);

        return root;
    }

    /* UTILITY FUNCTIONS */
    /* A utility function that returns count of nodes in a 
       given Linked List */
    int countNodes(ListNode head) 
    {
        int count = 0;
        ListNode temp = head;
        while (temp != null)
        {
            temp = temp.next;
            count++;
        }
        return count;
    }
    
    /* Function to print nodes in a given linked list */
    void printList(ListNode node) 
    {
        while (node != null) 
        {
            System.out.print(node.val + " ");
            node = node.next;
        }
    }

    /* A utility function to print preorder traversal of BST */
    void preOrder(TreeNode node) 
    {
        if (node == null)
            return;
        System.out.print(node.val + " ");
        preOrder(node.left);
        preOrder(node.right);
    }
}

