// package whatever; // don't place package name!
/*
The root node is in row 0
Any node that is a child of another node will be in the row immediately following that of its parent
Any node that is a left child will be in the column immediately preceding that of its parent
Any node that is a right child will be in the column immediately following that of its parent
Any node that is a left child with a parent that is a right child will be in the same column as its grandparent
Any node that is a right child with a parent that is a left child will be in the same column as its grandparent
If two nodes share the same row and column, the node whose parent is a left child comes first

Example:

Input tree:
          5
         / \
        4   8
       /   / \
      9   6   4
     / \     / \
    7   2   5   1
    
In the above tree, there are 7 columns, three of which have two nodes: [4, 2], [5, 6], and [8,5]. 
Therefore the algorithm would return a linked list with the following characters: 
7→9→4→2→5→6→8→5→4→1.

Container
([7], [9], [4, 2], [5, 6],  [8,5], [4], [1])
  */
// List interface// ArrayList implementation
//  TreeMap<Integer, List<TreeNode>> map = new TreeMap<>();
using System;

//import java.io.*;
//import java.util.*;

public class Test {
  
    static class TreeNode{
        int val;
        TreeNode left;
        TreeNode right; // next

        public TreeNode(int val) {
            this.val = val;
        }
        public TreeNode() {
        }
    }
  
  /*
      static class ListNode{
        int val;
        ListNode next; // next

        public ListNode(int val) {
            this.val = val;
        }
    }
    */
   static TreeNode sortTreeByColumns(TreeNode root){
     TreeMap<Integer, List<TreeNode>> map = new TreeMap<>();
     
     
     sortList(root, 0, map);
     
     // map -> TreeNode
     TreeNode head = new TreeNode(0);
     TreeNode work = head;
     
     for(int key : map.keySet()) {
       List<Integer> list = map.get(key);

       TreeNode newNode = new TreeNode();
       for(int value: list){
         work.right = new TreeNode();
         work.right.val = value;
         work = work.right;
       }
     }
     return head.right;
   }

  
  static void sortList(TreeNode node, Integer column, TreeMap<Integer, List<TreeNode>> map){
     if (node == null) {
       return;
     } 
    
    // handle current node
    // recursive left
    // recursive right
    
       if(!map.containsKey(column)){
         map.put(column, new ArrayList<Integer>());
       }
       map.get(column).add(node.val);
    
       sortList(node.left, column - 1, map);
       sortList(node.right, column + 1, map);
  }
  
  
    public static void main(String[] args){
        TreeNode root = new TreeNode(5);

        root.left = new TreeNode(4);
        root.left.left = new TreeNode(9);
        root.left.left.left = new TreeNode(7);
        root.left.left.right = new TreeNode(2);

        root.right = new TreeNode(8);
        root.right.left = new TreeNode(6);
        root.right.right = new TreeNode(4);
        root.right.right.left = new TreeNode(5);
        root.right.right.right = new TreeNode(1);

        TreeNode res = sortTreeByColumns(root);

        System.out.print("Result:\t\t");
        while(res != null){
            System.out.print(res.val);
            System.out.print(" -> ");
            res = res.right;
        }
        System.out.print("\n");

        System.out.println("Expected:\t7 -> 9 -> 4 -> 2 -> 5 -> 6 -> 8 -> 5 -> 4 -> 1 -> ");
    }
}

