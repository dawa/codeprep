void subsetsUtil(vector<int>& A, vector<vector<int> >& res,
                 vector<int>& subset, int index)
{
    for (int i = index; i < A.size(); i++) {
 
        // include the A[i] in subset.
        subset.push_back(A[i]);
        res.push_back(subset);
 
        // move onto the next element.
        subsetsUtil(A, res, subset, i + 1);
 
        // exclude the A[i] from subset and triggers
        // backtracking.
        subset.pop_back();
    }
 
    return;
}
 
// below function returns the subsets of vector A.
vector<vector<int> > Solution::subsets(vector<int>& A)
{
    vector<int> subset;
    vector<vector<int> > res;
 
    // include the null element in the set.
    res.push_back(subset);
 
    // keeps track of current element in vector A;
    int index = 0;
    sort(A.begin(), A.end());
    subsetsUtil(A, res, subset, index);
 
    return res;
}
