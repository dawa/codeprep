public class Solution {
    public int wordBreak(String A, ArrayList<String> B) {
        HashSet<String> wordDict = new HashSet<>();
        wordDict.addAll(B);

        int maxLen = 0;
        for (String word: B){
            if (word.length() > maxLen) {
                maxLen = word.length();
            }
        }

        int[] pos = new int[A.length()+1];

        Arrays.fill(pos, -1);

        // Initial starting search position
        pos[0]=0;

        for(int i=0; i<A.length(); i++){
            // Only start searching from last "break" candidate
            if(pos[i]!=-1){
                // Search for possible break up to max dict word length
                for(int j=i+1; j<=A.length() && (j - i <= maxLen); j++){
                    String sub = A.substring(i, j);
                    if(wordDict.contains(sub)){
                        pos[j]=i;
                    }
                }
            }
        }

        return pos[A.length()]!=-1 ? 1 : 0;
    }
}

