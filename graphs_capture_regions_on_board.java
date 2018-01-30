public class Solution {
	public void solve(ArrayList<ArrayList<Character>> a) {
    	if(a==null || a.size()==0 || a.get(0).size()==0)
            return;
     
        int m=a.size();
        int n=a.get(0).size();
     
     
        for(int j=0; j<n; j++){
            if(a.get(0).get(j)=='O'){
                bfs(a, 0, j);
            }
        }
     
        for(int j=0; j<n; j++){
            if(a.get(m-1).get(j)=='O'){
                bfs(a, m-1, j);
            }
        }
     
        for(int i=0; i<m; i++){
            if(a.get(i).get(0)=='O'){
                bfs(a, i, 0);
            }
        }
     
        for(int i=0; i<m; i++){
            if(a.get(i).get(n-1)=='O'){
                bfs(a, i, n-1);
            }
        }
     
        for(int i=0; i<m; i++){
            for(int j=0; j<n; j++){
                if(a.get(i).get(j)=='O'){
                    a.get(i).set(j, 'X');
                }
                if(a.get(i).get(j)=='1'){
                    a.get(i).set(j, 'O');
                }
            }
        }
    }
     
    public void bfs(ArrayList<ArrayList<Character>> board, int o, int p){
        int m=board.size();
        int n=board.get(0).size();
     
        int index = o*n+p;
        LinkedList<Integer> queue = new LinkedList<Integer>();
        queue.offer(index);
        board.get(o).set(p, '1');
     
        while(!queue.isEmpty()){
            int top = queue.poll();
            int i=top/n;
            int j=top%n;
     
            if(i-1>=0 && board.get(i-1).get(j)=='O'){
                board.get(i-1).set(j, '1');
                queue.offer((i-1)*n+j);
            }
            if(i+1<m && board.get(i+1).get(j)=='O'){
                board.get(i+1).set(j, '1');
                queue.offer((i+1)*n+j);
            }
            if(j-1>=0 && board.get(i).get(j-1)=='O'){
                board.get(i).set(j-1, '1');
                queue.offer(i*n+j-1);
            }
            if(j+1<n && board.get(i).get(j+1)=='O'){
                board.get(i).set(j+1, '1');
                queue.offer(i*n+j+1);
            }
        }
    }
}

