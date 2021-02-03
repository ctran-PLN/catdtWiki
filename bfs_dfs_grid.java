import java.util.*;

public class Main
{
	public static void main(String[] args) {
		int mat[][] = { { 0, 0, 0 }, 
                         { 0, 0, 0 }, 
                         { 0, 0, 0} };
        System.out.println("Bread-first-search");
        bfs(mat);
        System.out.println("Depth-first-search");
        dfs(mat, 0, 0);
	}
	
	static void bfs(int[][] mat){
	    Queue<int[]> q = new LinkedList<>();
	    q.add(new int[]{0,0});
	    while(q.size() > 0){
	        int[] point = q.poll();
	        int p_r = point[0];
	        int p_c = point[1];
	        if(p_r<0 || p_c<0 || p_r>=mat.length || p_c>=mat[0].length 
	                    || mat[p_r][p_c] == 1){
    	        continue;
    	    }
    	    mat[p_r][p_c] = 1;
    	    print2D(mat);
    	    q.add(new int[]{p_r+1,p_c});
    	    q.add(new int[]{p_r-1,p_c});
	        q.add(new int[]{p_r,p_c+1});
	        q.add(new int[]{p_r,p_c-1});
	    }
	}
	
	static void dfs(int[][] mat, int r, int c){
	    if(r<0 || c<0 || r>=mat.length || c>=mat[0].length || mat[r][c] == 1){
	        return;
	    }
	    mat[r][c] = 1;
	    print2D(mat);
	    dfs(mat, r+1, c);
	    dfs(mat, r-1, c);
	    dfs(mat, r, c+1);
	    dfs(mat, r, c-1);
	}
	
	public static void print2D(int mat[][]) 
    { 
        // Loop through all rows 
        for (int[] row : mat) 
  
            // converting each row as string 
            // and then printing in a separate line 
            System.out.println(Arrays.toString(row)); 
        
        System.out.println();
    } 
}

// results
/*
Bread-first-search                                                                                     
[1, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
                                                                                                       
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
                                                                                                       
[1, 1, 0]                                                                                              
[1, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
                                                                                                       
[1, 1, 0]                                                                                              
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
                                                                                                       
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
[1, 0, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 0]                                                                                              
[1, 0, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 1]                                                                                              
[1, 1, 0]   

[1, 1, 1]                                                                                              
[1, 1, 1]                                                                                              
[1, 1, 1] 

Depth-first-search                                                                                     
[1, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
                                                                                                       
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
[0, 0, 0]                                                                                              
                                                                                                       
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
                                                                                                       
[1, 0, 0]                                                                                              
[1, 0, 0]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 0, 0]                                                                                              
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 0]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 1]                                                                                              
[1, 1, 0]                                                                                              
                                                                                                       
[1, 1, 1]                                                                                              
[1, 1, 1]                                                                                              
[1, 1, 1] 


*/
